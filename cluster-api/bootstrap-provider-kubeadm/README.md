# cluster-api-bootstrap-provider-kubeadm

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-bootstrap-provider-kubeadm`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-bootstrap-provider-kubeadm`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-bootstrap-provider-kubeadm
kpt live apply cluster-api-bootstrap-provider-kubeadm --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
