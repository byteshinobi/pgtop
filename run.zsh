#!/bin/zsh

set -e
BUILD_FLAG=false
DB=""

# Parse arguments
for arg in "$@"; do
  if [ "$arg" = "-b" ]; then
    BUILD_FLAG=true
  else
    DB=$arg
  fi
done

if [ -z "$DB" ]; then
    echo
    echo "Usage: $0 [-b] <db-name>"
    echo "  -b: Force build the docker image"
    exit 1
fi

# Build if -b flag is set or if image doesn't exist
if [ "$BUILD_FLAG" = true ] || ! docker image inspect "pgtop-${DB}" >/dev/null 2>&1; then
    echo "Building docker image for ${DB} . . ."
    ./build.zsh ${DB}
fi

echo "Running ${DB}"
docker run --rm -it --add-host=host.docker.internal:host-gateway pgtop-${DB}
