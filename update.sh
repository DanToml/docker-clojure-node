#!/usr/bin/env bash
set -e

variants=( "$@" )
if [ ${#variants[@]} -eq 0 ]; then
  variants=( */*/ )
fi
variants=( "${variants[@]%/}" )

generated_warning() {
  cat <<EOH
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
EOH
}

for variant in "${variants[@]}"; do
  dir="$variant"
  lein_version=${variant%/*}
  node_version=${variant#*/}
  output="$dir/Dockerfile"
  template="Dockerfile.template"

  if [[ ! -d "$dir" ]]; then
    echo "Making output dir: $dir"
    mkdir -p "$dir"
  fi

  generated_warning > "$output"
  cat "$template" >> "$output"
  sed -i 's/%%BASE_TAG%%/'"$lein_version"'/g' "$output"
  sed -i 's/ENV NODE_VERSION 0.0.0/'"ENV NODE_VERSION $node_version"'/g' "$output"
done
