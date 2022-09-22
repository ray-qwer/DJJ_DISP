import numpy as np
from numpy.linalg import inv
import cv2
import math
import sys

loc = "./brightness/"

RGB2YCbCr = np.array([[0.114, 0.587, 0.299], [0.5, -0.331, -0.169], [-0.081, -0.419, 0.5]])
YCbCr2RGB = inv(RGB2YCbCr)
def brightness_adjust(img, alpha):
    if len(img.shape) == 2: #gray scale
        img = 255* ((img / 255) ** alpha)
        img = img.astype(np.uint8)
    elif len(img.shape) == 3:   # rgb  
        img = img.astype(np.float64)
        for i in range(img.shape[0]):
            for j in range(img.shape[1]):
                img[i,j] = np.matmul(RGB2YCbCr, img[i, j])
        img[:,:,0] = 255* ((img[:, :, 0]/ 255)**alpha)
        for i in range(img.shape[0]):
            for j in range(img.shape[1]):
                img[i,j] = np.matmul(YCbCr2RGB, img[i, j])
        np.putmask(img, img > 255, 255)
        np.putmask(img, img < 0, 0)
        img = img.astype(np.uint8)
    return img


img= cv2.imread("baboon.png")
cv2.imwrite(loc+"color_dark_2.png", brightness_adjust(img, 2))
cv2.imwrite(loc+"color_light_05.png", brightness_adjust(img, 0.5))
# cv2.imshow("test", brightness_adjust(img, 0.2))
cv2.waitKey(0)