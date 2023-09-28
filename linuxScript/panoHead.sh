#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Usage: $0 [v|i]"
  exit 1
fi


source /mnt/tmw/module/python/PanoHead/venv/bin/activate1


export PYTHONPATH=/mnt/tmw/module/python/PanoHead/PanoHead:$PYTHONPATH


cd /mnt/tmw/module/python/PanoHead/PanoHead

if [ $1  == "v"  ]; then
    python gen_videos.py --network ./models/easy-khair-180-gpc0.8-trans10-025000.pkl --seeds 0-3 --grid 1x1 --output=test.mp4 --cfg Head --trunc 0.7

fi

if [ $1  == "i"  ]; then
    python gen_samples.py --outdir=out --shape-format=.ply --trunc=0.7 --shapes=true --seeds=0-3 --network ./models/easy-khair-180-gpc0.8-trans10-025000.pkl
fi
