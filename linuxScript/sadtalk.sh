cd /mnt/tmw/module/python/talk/SadTalker
. /mnt/tmw/module/python/talk/venv/bin/activate1
export CUDA_VISIBLE_DEVICES=-1
python3.8 inference.py --driven_audio ./examples/driven_audio/RD_Radio31_000.wav  --source_image examples/source_image/full3.png  --result_dir ./results --still --preprocess full --enhancer gfpgan
