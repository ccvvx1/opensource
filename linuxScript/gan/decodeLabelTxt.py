import numpy as np

text_file_path = './data/mnist_self_labels.txt'
data = np.loadtxt(text_file_path)

npy_file_path = './data/mnist_self_labels.npy'
np.save(npy_file_path, data)
