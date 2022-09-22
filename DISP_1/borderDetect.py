import cv2
import numpy as np
import sys
import math


loc = "./detect_border_image/"
def diff_horizon(img):
    img_border = np.zeros(img.shape, np.uint8)
    for i in range(1,img.shape[1]):
        # img_border[:,i] = np.where(abs(img[:,i] - img[:,i-1]) < 128, 0, 255)
        img_border[:, i] = abs(img[:,i] - img[:,i-1])
    return img_border

def diff_vertical(img):
    img_border = np.zeros(img.shape, np.uint8)
    for i in range(1, img.shape[0]):
        # img_border[i,:] = np.where(abs(img[i,:] - img[i-1,:]) < 128, 0, 255)
        img_border[i, :] = abs(img[i,:] - img[i-1,:])
    return img_border

def kernel_conv_op(img, kernel):
    kernel = kernel.flatten()
    img_border = np.zeros(img.shape, np.int16)
    img = img.astype(np.int16)
    for i in range(1, img.shape[0] - 1):
        for j in range(1, img.shape[1] - 1):
            area = img[i-1:i+2,j-1:j+2].flatten()
            img_border[i,j] = abs(np.convolve(area, kernel, 'valid')[0])
    img_border = img_border * 255 / img_border.max()
    img_border = img_border.astype(np.uint8)
    return img_border

img = cv2.imread("lena.bmp",0)
# cv2.imshow("test",diff_vertical(img))
sobel_0 = np.array([[1, 0, -1], [2, 0, -2], [1, 0, -1]])/4
sobel_90 = np.array([[1, 2, 1], [0, 0, 0], [-1, -2, -1]])/4
sobel_45 = np.array([[0, -1, -2], [1, 0, -1], [2, 1, 0]])/4
sobel_135 = np.array([[-2, -1, 0], [-1, 0, 1], [0, 1, 2]])/4
lap_kernel = np.array([[-1, -1, -1], [-1, 8, -1], [-1, -1, -1]])/8
edgeList=[("sobel_0", sobel_0),("sobel_90", sobel_90),("sobel_45", sobel_45),("sobel_135", sobel_135),("lap", lap_kernel)]
# cv2.imshow("test",kernel_conv_op(img,sobel_0))
cv2.imwrite(loc+"diff_0_v2.bmp", diff_horizon(img))
cv2.imwrite(loc+"diff_90_v2.bmp", diff_vertical(img))
for i, kernel in edgeList:
    cv2.imwrite(loc+"{i}_v2.bmp".format(i=i), kernel_conv_op(img, kernel))
# cv2.imshow("test", kernel_conv_op(img, lap_kernel))
cv2.waitKey(0)


