# capi-kubeadm-bootstrap-system

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] capi-kubeadm-bootstrap-system`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree capi-kubeadm-bootstrap-system`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init capi-kubeadm-bootstrap-system
kpt live apply capi-kubeadm-bootstrap-system --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
