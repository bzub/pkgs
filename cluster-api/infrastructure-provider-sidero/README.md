# cluster-api-provider-sidero

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-provider-sidero`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-provider-sidero`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-provider-sidero
kpt live apply cluster-api-provider-sidero --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
