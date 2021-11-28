#!/bin/bash

docker-compose run gcc-cpp-sample bash -c "g++ $1 -o a.out && ./a.out && rm -f a.out"
