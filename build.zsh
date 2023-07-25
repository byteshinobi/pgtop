#!/bin/zsh
DB=$1
docker build --build-arg DB=${DB} -t pgtop-${DB} .
