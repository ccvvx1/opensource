#!/bin/bash

if [ "$#" -ne 0 ]; then
	    echo "usage: $0 <directory>"
	        exit 1
fi

current_directory=$(pwd)

sudo docker run -it --rm --hostname redroid-builder --name redroid-builder -v "$current_directory:/src" redroid-builder

