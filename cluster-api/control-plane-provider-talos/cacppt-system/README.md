# cacppt-system

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] cacppt-system`
Details: https://kpt.dev/reference/pkg/get/

### View package content
`kpt pkg tree cacppt-system`
Details: https://kpt.dev/reference/pkg/tree/

### Apply the package
```
kpt live init cacppt-system
kpt live apply cacppt-system --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/live/