#!/bin/bash

if [ "$#" -ne 1 ]; then
	    echo "usage: $0 "
	        exit 1
fi

sudo docker run -it --rm --hostname redroid-builder --name redroid-builder -v "$1:/src" redroid-builder

