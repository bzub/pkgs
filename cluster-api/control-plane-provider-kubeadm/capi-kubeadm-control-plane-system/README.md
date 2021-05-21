# capi-kubeadm-control-plane-system

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] capi-kubeadm-control-plane-system`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree capi-kubeadm-control-plane-system`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init capi-kubeadm-control-plane-system
kpt live apply capi-kubeadm-control-plane-system --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
