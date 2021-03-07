#!/bin/bash

if [ "$1" = "molecule" ]; then
    shift 1

    exec molecule -- "$@"
fi

exec -- "$@"
