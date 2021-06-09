#!/usr/bin/env sh
set -ef -o pipefail

hack_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
repo_dir="$(dirname "${hack_dir}")"
management_cluster="bzub-pkgs-e2e-management-$(git -C "${repo_dir}" rev-parse --short HEAD)"
work_dir="$(mktemp -d -t "${management_cluster}")"
capi_repo_dir="${work_dir}/cluster-api"
e2e_config="${capi_repo_dir}/test/e2e/config/e2e-config.yaml"
capi_ver="v0.3.16"
management_cluster_config="${work_dir}/kind-cluster-config.yaml"

echo "${work_dir}"

deploy_dir="${work_dir}/e2e"
mkdir -p "${deploy_dir}"

for capi_pkg in core clusterctl-crds bootstrap-provider-kubeadm control-plane-provider-kubeadm infrastructure-provider-docker; do
	kpt pkg get "file://${repo_dir}.git/cluster-api/${capi_pkg}" "${deploy_dir}"
done

for pkg in cert-manager; do
	kpt pkg get "file://${repo_dir}.git/${pkg}" "${deploy_dir}"
done

cat >> "${deploy_dir}/Kptfile" <<EOF
apiVersion: kpt.dev/v1alpha2
kind: Kptfile
metadata:
  name: ${management_cluster}
pipeline:
  mutators:
    - image: gcr.io/kpt-fn/apply-setters:unstable
      configMap:
        EXP_CLUSTER_RESOURCE_SET: "true"
        EXP_MACHINE_POOL: "true"
EOF

kpt fn render "${deploy_dir}"
kpt live init "${deploy_dir}" --inventory-id="${management_cluster}"

cat <<EOF > "${management_cluster_config}"
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: ${management_cluster}
nodes:
  - role: control-plane
    extraMounts:
      - hostPath: /var/run/docker.sock
        containerPath: /var/run/docker.sock
EOF

KIND_EXPERIMENTAL_DOCKER_NETWORK=bridge \
	kind create cluster --config "${management_cluster_config}"

images="$(\
	kpt fn source "${deploy_dir}" |\
	grep -F "              image:" |\
	sed 's/^ *image: //' |\
	sort |\
	uniq \
)"

for image in ${images}; do
	docker pull "${image}"
	kind load docker-image --name "${management_cluster}" ${image}
done

retry_count="0"
while ! kpt live apply --install-resource-group "${deploy_dir}"; do
	if [ "${retry_count}" -ge "5" ]; then
		echo "[ERROR] Timeout applying packages."
		exit 1
	fi
	sleep 10s
	retry_count="$((retry_count+1))"
done

git clone \
	--depth=1 \
	"--branch=${capi_ver}" \
	https://github.com/kubernetes-sigs/cluster-api.git \
	"${capi_repo_dir}"

sed \
	"s/^  - name: v0\.3\.0$/  - name: ${capi_ver}/" \
	"${capi_repo_dir}/test/e2e/config/docker.yaml" \
	> "${e2e_config}"

make -C "${capi_repo_dir}" docker-build-e2e
make -C "${capi_repo_dir}" test-e2e \
	USE_EXISTING_CLUSTER=true \
	E2E_CONF_FILE="${e2e_config}"

if [ "${SKIP_RESOURCE_CLEANUP}" != "true" ]; then
	kind delete cluster --name "${management_cluster}"
fi
