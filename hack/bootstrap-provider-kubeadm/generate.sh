#!/usr/bin/env sh
set -ef -o pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

kustomize build "${script_dir}"
