# cluster-api-clusterctl-crds

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-clusterctl-crds`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-clusterctl-crds`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-clusterctl-crds
kpt live apply cluster-api-clusterctl-crds --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
