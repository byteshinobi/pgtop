#!/bin/zsh
DB=${1}


# echo "Building docker image for ${DB} . . ."
# ./build.zsh ${DB}

echo "Running ${DB}"
docker run --rm -it pgtop-${DB}
