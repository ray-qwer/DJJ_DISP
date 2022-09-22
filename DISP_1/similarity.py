import cv2
import numpy as np
import math

def NRMSE(img1, img2):
    assert img1.shape == img2.shape and img1.size == img2.size
    img1, img2 = img1.astype(np.uint16), img2.astype(np.uint16)
    energy = (img1** 2).sum()
    diff = ((img2 - img1)** 2).sum()
    return math.sqrt(diff/energy)

def PSNR(img1, img2):
    assert img1.shape == img2.shape and img1.size == img2.size
    # factor = 1 if len(img1.shape) == 2 else 3
    diff = ((img2 - img1)** 2).mean()
    return 10*math.log10(255**2/diff)
loc = "./brightness/"
# all in gray scale or rgb
img1 = cv2.imread(loc+"gray_dark_2.png",0)
img2 = cv2.imread("baboon.png",0)
print(NRMSE(img1, img2))
print(PSNR(img1, img2))