#!/bin/zsh
DB=${1}


#echo "Building docker image for ${DB} . . ."
#./build.zsh ${DB}

echo "Running ${DB}"
docker run --network="host" --rm -it pgtop-${DB}
