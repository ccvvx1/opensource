import os
import numpy as np
import math
import sys
from time import time
import torchvision.transforms as transforms
from torchvision.utils import save_image
from torch.utils.data import DataLoader
from torchvision import datasets
from torch.autograd import Variable
import torch.nn as nn
import torch.nn.functional as F
import torch
import torchvision
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

os.makedirs("images", exist_ok=True)

class Opt(object):
    dim = 10
    n_epochs = 200
    batch_size = dim*dim
    lr = 0.0002
    b1 = 0.5
    b2 = 0.999
    n_cpu = 1
    latent_dim = 100
    img_size = 28
    channels = 1
    sample_interval = 400
opt = Opt()

img_shape = (opt.channels, opt.img_size, opt.img_size)

cuda = True if torch.cuda.is_available() else False

class Generator(nn.Module):
    def __init__(self):
        super(Generator, self).__init__()

        self.main = nn.Sequential(
            # input is Z, going into a convolution
            # nn.ConvTranspose2d( 1, 400, 7, 1, 1, bias=False),
            # nn.BatchNorm2d(400),
            # nn.ReLU(True),
            nn.ConvTranspose2d( 1, 200, 6, 1, 0, bias=False),
            nn.BatchNorm2d(200),
            nn.ReLU(True),
            # state size. ``(ngf*8) x 4 x 4``
            nn.ConvTranspose2d(200, 100, 6, 2, 1, bias=False),
            nn.BatchNorm2d(100),
            nn.ReLU(True),
            # state size. ``(ngf*4) x 8 x 8``
            nn.ConvTranspose2d( 100, 1, 6, 2, 2, bias=False),
            nn.Tanh()
            # state size. ``(nc) x 64 x 64``
        )

    def forward(self, input):
        # return self.main(input)
        img = self.main(input)
        img = img.view(img.size(0), *img_shape)
        return img

class Discriminator(nn.Module):
    def __init__(self, img_channels=1, img_size=28):
        super(Discriminator, self).__init__()

        self.model = nn.Sequential(
            nn.Conv2d(1, 100, kernel_size=4, stride=2, padding=1, bias=False),
            nn.BatchNorm2d(100),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Conv2d(100, 128, kernel_size=4, stride=2, padding=1, bias=False),
            nn.BatchNorm2d(128),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Conv2d(128, 256, kernel_size=4, stride=2, padding=1, bias=False),
            nn.BatchNorm2d(256),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Conv2d(256, 1, kernel_size=4, stride=2, padding=1, bias=False),
            nn.Sigmoid(),
        )

    def forward(self, img):
        validity = self.model(img)
        return validity
bce_loss = torch.nn.BCELoss()
generator = Generator()
discriminator = Discriminator()

if cuda:
    generator.cuda()
    discriminator.cuda()
    bce_loss.cuda()

# Configure data loader
os.makedirs("data/mnist", exist_ok=True)
dataloader = torch.utils.data.DataLoader(
    datasets.MNIST(
        "data/mnist",
        train=True,
        download=True,
        transform=transforms.Compose([transforms.ToTensor(), transforms.Normalize([0.5], [0.5])]),
    ),
    batch_size=opt.batch_size,
    shuffle=True,
)



# # 设置数据集路径和转换
# images_folder_path = '/content/data/mnist_images'
# labels_path = '/content/data/mnist_labels.npy'
# transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize([0.5], [0.5])])

# # 创建自定义数据集
# custom_dataset = CustomDataset(images_folder_path, labels_path, transform)

# # 创建 DataLoader
# batch_size = 64
# dataloader = DataLoader(custom_dataset, batch_size=batch_size, shuffle=True)


# Optimizers
generator_optimizer = torch.optim.Adam(generator.parameters(), lr=opt.lr, betas=(opt.b1, opt.b2))
discriminator_optimizer = torch.optim.Adam(discriminator.parameters(), lr=opt.lr, betas=(opt.b1, opt.b2))

Tensor = torch.cuda.FloatTensor if cuda else torch.FloatTensor

# ----------
#  Training
# ----------
saved_imgs = []
for epoch in range(opt.n_epochs):
    start = time()
    for i, (imgs, _) in enumerate(dataloader):
        real = torch.full((100,), 1.0, dtype=torch.float).cuda()
        fake = torch.full((100,), 0.0, dtype=torch.float).cuda()


        real_imgs = Variable(imgs.type(Tensor))
        #  train Generator
        generator_optimizer.zero_grad()
        # sample noise as generator input
        # z = Variable(Tensor(np.random.normal(0, 1, (imgs.shape[0], opt.latent_dim))))
        # generate a batch of images
        z = torch.randn(100, 1, 1, 1).cuda()
        gen_imgs = generator(z)
        # loss measures generator's ability to fool the discriminator:
        # for the generated images, the generator wants the discriminator to think they're real (1)
        # so if the discriminator(gen_imgs) == real == 1, then the generator is doing a good job, there is no loss
        generator_loss = bce_loss(discriminator(gen_imgs).view(-1), real)
        generator_loss.backward()
        generator_optimizer.step()
        # train Discriminator
        discriminator_optimizer.zero_grad()
        # loss measure discriminator's ability to classify real from generated samples:
        real_loss = bce_loss(discriminator(real_imgs).view(-1),         real)
        fake_loss = bce_loss(discriminator(gen_imgs.detach()).view(-1), fake)
        discriminator_loss = (real_loss + fake_loss) / 2
        discriminator_loss.backward()
        discriminator_optimizer.step()
        batches_done = epoch * len(dataloader) + i

        # Print losses
        if i % len(dataloader) == 0:
            print(f"Epoch [{epoch}/{opt.n_epochs}], Batch Step [{i}/{len(dataloader)}], "
                  f"Generator Loss: {generator_loss.item():.4f}, Discriminator Loss: {discriminator_loss.item():.4f}")
            
    end = time()
    elapsed = end - start
    print('done, took %.1f seconds.' % elapsed)
    grid = torchvision.utils.make_grid(gen_imgs.data.cpu(), nrow=opt.dim)
    img = (np.transpose(grid.detach().numpy(), (1, 2 ,0)) * 255).astype(np.uint8)
    saved_imgs.append(img)