#!/usr/bin/env sh
set -ef -o pipefail

hack_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
repo_dir="$(dirname "${hack_dir}")"

pkgs="$(find "${hack_dir}" -type d -depth 1)"
if [ -n "${PKGS}" ]; then
	pkgs="${PKGS}"
fi

for dir in ${pkgs}; do
	pkg="$(basename "${dir}")"
	if [ "${pkg}" = "common" ]; then
		continue
	fi

	resources="$("${dir}/generate.sh")"
	if [ -n "${resources}" ]; then
		echo "${resources}" | kpt fn sink "${repo_dir}/${pkg}"
		kpt fn render "${repo_dir}/${pkg}"
	fi
done
