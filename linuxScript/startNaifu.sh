export DTYPE=float16 && export CLIP_CONTEXTS=3 && export AMP=1 && export MODEL=stable-diffusion && export DEV=True && export MODEL_PATH=models/animefull-final-pruned && export ENABLE_EMA=1 && export VAE_PATH=models/animevae.pt && export PENULTIMATE=1 && export PYTHONDONTWRITEBYTECODE=1 && export SAVE_FILES=1

python -m uvicorn --host 0.0.0.0 --port=6969 main:app & bore local 6969 --to bore.pub & cloudflared tunnel --url l
