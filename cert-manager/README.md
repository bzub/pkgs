# cert-manager

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cert-manager`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cert-manager`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cert-manager
kpt live apply cert-manager --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/
