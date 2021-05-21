# cluster-api-bootstrap-provider-talos

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-bootstrap-provider-talos`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-bootstrap-provider-talos`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-bootstrap-provider-talos
kpt live apply cluster-api-bootstrap-provider-talos --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
