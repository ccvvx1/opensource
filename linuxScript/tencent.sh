. /mnt/tmw/module/python/tx/venv/bin/activate1
cd /mnt/tmw/module/python/tx/GFPGAN
rm -rf results
python inference_gfpgan.py -i inputs/upload -o results -v 1.3 -s 2 --bg_upsampler realesrgan