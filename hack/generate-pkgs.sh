#!/usr/bin/env sh
set -ef -o pipefail

hack_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
repo_dir="$(dirname "${hack_dir}")"

pkgs="$(\
	find "${repo_dir}" -type f -name "Kptfile" |\
	sed "s|${repo_dir}/\(.*\)/Kptfile|\1|" |\
	grep -Ev '^cluster-api$' \
)"
if [ -n "${PKGS}" ]; then
	pkgs="${PKGS}"
fi

for pkg in ${pkgs}; do
	pkg_generator="${hack_dir}/${pkg}/generate.sh"

	if [ ! -x "${pkg_generator}" ]; then
		echo "[WARN] Package ${pkg} does not have a generator at ${pkg_generator}. Skipping."
		continue
	fi

	resources="$("${pkg_generator}")"
	if [ -n "${resources}" ]; then
		echo "${resources}" | kpt fn sink "${repo_dir}/${pkg}"
	fi
done

for dir in $(find "${PWD}" -depth 2 -type f -name "Kptfile" | sed "s|${PWD}/\(.*\)/Kptfile|\1|"); do
	kpt fn render "${dir}"
done
