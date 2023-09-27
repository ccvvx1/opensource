cd /mnt/tmw/module/python/sovit/so-vits-svc
. /mnt/tmw/module/python/sovit/venv/bin/activate1
python inference_main.py -m "logs/44k/G_0.pth" -c "configs/config.json" -n "ok1.wav" -t 0 -s "tsukuyomi"
