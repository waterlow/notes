#!/bin/bash

docker-compose run --rm ruby18 bash -c "cd $(dirname $1) && ruby $(basename $1)"
