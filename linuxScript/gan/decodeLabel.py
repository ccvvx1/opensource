import numpy as np

# 读取 npy 文件
file_path = './data/mnist_labels.npy'
data = np.load(file_path)

# 保存为文本文件
text_file_path = './data/mnist_labels.txt'
np.savetxt(text_file_path, data, fmt='%s')
