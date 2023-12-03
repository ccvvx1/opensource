
import gzip
import os
import numpy as np
from PIL import Image

# 解压 MNIST 图像文件
def extract_mnist_images(file_path, save_dir):
    with gzip.open(file_path, 'rb') as f:
        data = np.frombuffer(f.read(), dtype=np.uint8, offset=16)
        data = data.reshape(-1, 28, 28)

    # 保存为 PNG 图像
    os.makedirs(save_dir, exist_ok=True)
    for i, image in enumerate(data):
        im = Image.fromarray(image)
        im.save(os.path.join(save_dir, f'image_{i:05d}.png'))

# 设置文件路径和保存目录
mnist_images_path = './data/mnist/MNIST/raw/train-images-idx3-ubyte.gz'
save_directory = './data/mnist_images'

# 解压并保存为 PNG
extract_mnist_images(mnist_images_path, save_directory)

