# cluster-api-provider-docker

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cluster-api-provider-docker`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cluster-api-provider-docker`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cluster-api-provider-docker
kpt live apply cluster-api-provider-docker --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
