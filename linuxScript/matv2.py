import torch
from torchvision.transforms.functional import to_tensor, to_pil_image
from PIL import Image

model = torch.jit.load('model.pth').cuda().eval()

src = Image.open('src.png')
bgr = Image.open('bgr.png')
     

src = to_tensor(src).cuda().unsqueeze(0)
bgr = to_tensor(bgr).cuda().unsqueeze(0)
     
     
if src.size(2) <= 2048 and src.size(3) <= 2048:
  model.backbone_scale = 1/4
  model.refine_sample_pixels = 80_000
else:
  model.backbone_scale = 1/8
  model.refine_sample_pixels = 320_000
              

pha, fgr = model(src, bgr)[:2]

com = pha * fgr + (1 - pha) * torch.tensor([120/255, 255/255, 155/255], device='cuda').view(1, 3, 1, 1)


to_pil_image(com[0].cpu())

to_pil_image(pha[0].cpu()).save('pha.png')
to_pil_image(fgr[0].cpu()).save('fgr.png')
to_pil_image(com[0].cpu()).save('com.png')     