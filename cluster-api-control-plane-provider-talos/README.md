# cluster-api-control-plane-provider-talos

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-control-plane-provider-talos`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-control-plane-provider-talos`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-control-plane-provider-talos
kpt live apply cluster-api-control-plane-provider-talos --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
