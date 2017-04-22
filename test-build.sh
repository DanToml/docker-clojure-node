#!/usr/bin/env bash
#
# Run a test build for all images.

set -uo pipefail
IFS=$'\n\t'

info() {
  printf "%s\n" "$@"
}

fatal() {
  printf "**********\n"
  printf "%s\n" "$@"
  printf "**********\n"
  exit 1
}

variants=( "$@" )
if [ ${#variants[@]} -eq 0 ]; then
  variants=( */*/ )
fi
variants=( "${variants[@]%/}" )

for variant in "${variants[@]}"; do
  lein_version=${variant%/*}
  node_version=${variant#*/}

  # Skip "docs" and other non-docker directories
  [ -f "$variant/Dockerfile" ] || continue

  tag="$lein_version-node-$node_version"

  info "Building $tag..."
  docker build -t endocrimes/clojure-node:"$tag" "$variant"

  if [[ $? -gt 0 ]]; then
    fatal "Build of $tag failed!"
  else
    info "Build of $tag succeeded."
  fi
done

info "All builds successful!"

exit 0
