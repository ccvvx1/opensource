#!/bin/bash

if [ "$#" -ne 2 ]; then
	    echo "usage: $0 <mount path>"
	        exit 1
fi

docker run -it --rm --hostname redroid-builder --name redroid-builder -v "$2:/src" redroid-builder

