import cv2
import numpy as np
import math

def NRMSE(img1, img2):
    assert img1.shape == img2.shape and img1.size == img2.size
    img1, img2 = img1.astype(np.int16), img2.astype(np.int16)
    energy = (img1** 2).sum()
    diff = ((img2 - img1)** 2).sum()
    return math.sqrt(diff/energy)

def PSNR(img1, img2):
    assert img1.shape == img2.shape and img1.size == img2.size
    # factor = 1 if len(img1.shape) == 2 else 3
    img1, img2 = img1.astype(np.int16), img2.astype(np.int16)    
    diff = ((img2 - img1)** 2).mean()
    return 10*math.log10(255**2/diff)

def SSIM(img1, img2):
    assert img1.shape == img2.shape and len(img1.shape) == 2
    img1, img2 = img1.astype(np.int16), img2.astype(np.int16)
    ux, uy = img1.mean(), img2.mean()
    var_x, var_y = np.var(img1), np.var(img2)
    # covariance: two imgs flatten first and get covariance by np.cov
    cov = np.cov(img1.flatten(), img2.flatten())[0,1]
    L = 255
    c = math.sqrt(1/L)
    Lc2 = (L * c) ** 2
    return (2 *ux *uy + Lc2) * (2* cov + Lc2) / ( (ux**2 + uy**2 + Lc2) * (var_x + var_y + Lc2) )


loc = "./brightness/"
# all in gray scale or rgb
img1 = cv2.imread(loc+"gray_dark_2.png",0)
# img2 = cv2.imread("lena.bmp", 0)
# img2 = cv2.imread(loc+"gray_light_05.png",0)
img2 = cv2.imread("baboon.png",0)
# img2 = np.zeros((512,512),dtype=np.uint8)
# img1 = np.ones((256,256),dtype=np.uint8)*255
# print(NRMSE(img1, img2))
# print(PSNR(img1, img2))
print(SSIM(img1,img2))