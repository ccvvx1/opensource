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
from PIL import Image

from torch.utils.data import Dataset, DataLoader

warnings.filterwarnings('ignore')

os.makedirs("images", exist_ok=True)

class CustomDataset(Dataset):
    def __init__(self, images_folder, labels_path, transform=None):
        self.images_folder = images_folder
        self.labels = np.load(labels_path)
        self.transform = transform

    def __len__(self):
        return len(self.labels)

    def __getitem__(self, idx):
        image_path = os.path.join(self.images_folder, f'image_{idx:05d}.png')
        image = Image.open(image_path)

        if self.transform:
            image = self.transform(image)

        label = torch.tensor(int(self.labels[idx]))

        return image, label

class Opt(object):
    dim = 10
    n_epochs = 10
    batch_size = dim*dim
    lr = 0.0002
    b1 = 0.5
    b2 = 0.999
    n_cpu = 1
    latent_dim = 100
    img_size = 28
    img_w = 21
    img_h = 60
    channels = 3
    sample_interval = 400
opt = Opt()

# img_shape = (opt.channels, opt.img_size, opt.img_size)
img_shape = (opt.channels, opt.img_h, opt.img_w)

cuda = True if torch.cuda.is_available() else False

class Generator(nn.Module):
    def __init__(self):
        super(Generator, self).__init__()
        def block(in_feat, out_feat, normalize=True):
            layers = [nn.Linear(in_feat, out_feat)]
            if normalize:
                layers.append(nn.BatchNorm1d(out_feat, 0.8))
            layers.append(nn.LeakyReLU(0.2, inplace=True))
            return layers
        self.model = nn.Sequential(
            *block(opt.latent_dim, 128, normalize=False),
            *block(128, 256),
            *block(256, 512),
            *block(512, 1024),
            nn.Linear(1024, int(np.prod(img_shape))),
            nn.Tanh()
        )
    def forward(self, z):
        img = self.model(z)
        img = img.view(img.size(0), *img_shape)
        return img

class Discriminator(nn.Module):
    def __init__(self):
        super(Discriminator, self).__init__()
        self.model = nn.Sequential(
            nn.Linear(int(np.prod(img_shape)), 512),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(512, 256),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(256, 1),
            nn.Sigmoid(),
        )
    def forward(self, img):
        img_flat = img.view(img.size(0), -1)
        validity = self.model(img_flat)
        return validity

bce_loss = torch.nn.BCELoss()
generator = Generator()
discriminator = Discriminator()

if cuda:
    generator.cuda()
    discriminator.cuda()
    bce_loss.cuda()

# # Configure data loader
# os.makedirs("data/mnist", exist_ok=True)
# dataloader = torch.utils.data.DataLoader(
#     datasets.MNIST(
#         "data/mnist",
#         train=True,
#         download=True,
#         transform=transforms.Compose([transforms.ToTensor(), transforms.Normalize([0.5], [0.5])]),
#     ),
#     batch_size=opt.batch_size,
#     shuffle=True,
# )

print_interval = 10

# 设置数据集路径和转换
# images_folder_path = './data/mnist_images'
images_folder_path = '/home/tmw/shared/pngcp'
# labels_path = './data/mnist_labels.npy'
labels_path = './data/mnist_self_labels.npy'
transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize([0.5], [0.5])])

# 创建自定义数据集
custom_dataset = CustomDataset(images_folder_path, labels_path, transform)

# 创建 DataLoader
batch_size = 64
dataloader = DataLoader(custom_dataset, batch_size=batch_size, shuffle=True)




# Optimizers
generator_optimizer = torch.optim.Adam(generator.parameters(), lr=opt.lr, betas=(opt.b1, opt.b2))
discriminator_optimizer = torch.optim.Adam(discriminator.parameters(), lr=opt.lr, betas=(opt.b1, opt.b2))

Tensor = torch.cuda.FloatTensor if cuda else torch.FloatTensor

# ----------
#  Training
# ----------
generator.load_state_dict(torch.load('./data/final_generator.pth'))
generator.train()
discriminator.load_state_dict(torch.load('./data/final_discriminator.pth'))
discriminator.train()

saved_imgs = []
for epoch in range(opt.n_epochs):
    print('Epoch ' + str(epoch) + ' training...' , end=' ')
    print('\n')
    start = time()
    for i, (imgs, _) in enumerate(dataloader):
        real = Variable(Tensor(imgs.size(0), 1).fill_(1.0), requires_grad=False)
        fake = Variable(Tensor(imgs.size(0), 1).fill_(0.0), requires_grad=False)
        real_imgs = Variable(imgs.type(Tensor))
        #  train Generator
        generator_optimizer.zero_grad()
        # sample noise as generator input
        z = Variable(Tensor(np.random.normal(0, 1, (imgs.shape[0], opt.latent_dim))))
        # generate a batch of images
        gen_imgs = generator(z)
        # loss measures generator's ability to fool the discriminator:
        # for the generated images, the generator wants the discriminator to think they're real (1)
        # so if the discriminator(gen_imgs) == real == 1, then the generator is doing a good job, there is no loss
        generator_loss = bce_loss(discriminator(gen_imgs), real)
        generator_loss.backward()
        generator_optimizer.step()
        # train Discriminator
        discriminator_optimizer.zero_grad()
        # loss measure discriminator's ability to classify real from generated samples:
        real_loss = bce_loss(discriminator(real_imgs),         real)
        fake_loss = bce_loss(discriminator(gen_imgs.detach()), fake)
        discriminator_loss = (real_loss + fake_loss) / 2
        discriminator_loss.backward()
        discriminator_optimizer.step()
        batches_done = epoch * len(dataloader) + i
        
          # 打印损失值
        if i % print_interval == 0:
            print(
                f"Epoch [{epoch}/{opt.n_epochs}], Batch [{i}/{len(dataloader)}], "
                f"Generator Loss: {generator_loss.item():.4f}, "
                f"Discriminator Loss: {discriminator_loss.item():.4f}"
            )
    end = time()
    elapsed = end - start
    print('done, took %.1f seconds.' % elapsed)
    grid = torchvision.utils.make_grid(gen_imgs.data.cpu(), nrow=opt.dim)
    img = (np.transpose(grid.detach().numpy(), (1, 2 ,0)) * 255).astype(np.uint8)
    saved_imgs.append(img)
    
# Save the final models
torch.save(generator.state_dict(), './data/final_generator.pth')
torch.save(discriminator.state_dict(), './data/final_discriminator.pth')    

img_indexes = [0, 4, 9]
# img_indexes = [0, 4, 9, 49, 99, 749, 999]
# img_indexes = [99699, 99799, 99899, 99999]
for i in img_indexes:
    plt.figure(figsize = (opt.dim, opt.dim))
    plt.imshow(saved_imgs[i], interpolation='nearest')
    plt.axis('off')  # Turn off axis labels if needed
    plt.savefig(f'./data/results/image_{i}.png', bbox_inches='tight', pad_inches=0)
