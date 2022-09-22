import cv2
import numpy as np
import sys
import math

# part 1
def upsideDown(img):
    imgTrans = np.zeros(img.shape,np.uint8)
    for i in range(img.shape[0]):
        imgTrans[i,:] = img[img.shape[0]-i-1,:]
    return imgTrans
def rightSideLeft(img):
    imgTrans = np.zeros(img.shape,np.uint8)
    for i in range(img.shape[1]):
        imgTrans[:,i] = img[:,img.shape[0]-i-1]
    return imgTrans
def diagFlip(img):
    return upsideDown(rightSideLeft(img))
def rotate(img):
    #rotate 45 degree clockwise
    # hey why cannot use getRotationMatrix
    # [ 1/2^(1/2)  1/2^(1/2) ]
    #   -1/2^(1/2) 1/2^(1/2)
    # corner: (img.shape[0],img.shape[1]), (img.shape[0],0), (0,img.shape[1]), (0,0)
    # cornerPoint = np.array([[0,0],
    #                         [img.shape[1],0],
    #                         [img.shape[1],img.shape[1]],
    #                         [0,img.shape[0]]])
    # angle = math.pi/4
    # rotationMatrix = np.array( [[math.cos(angle),math.sin(angle)],
    #                             [-math.sin(angle), math.cos(angle)]] )
    # cornerPointRotated = np.matmul(cornerPoint,rotationMatrix)
    # rotationShape = np.array([abs(round(math.sin(angle)*img.shape[1]))+abs(round(math.cos(angle)*img.shape[0])),abs(round(math.sin(angle)*img.shape[0]))+abs(round(math.cos(angle)*img.shape[1]))])
    # imgTrans = np.zeros(rotationShape,np.uint8)
    # offset = (rotationShape/2).astype(np.uint16)
    # offsetOrigin = np.array([img.shape[1]/2,img.shape[0]/2]).astype(np.uint16)
    # for i in range(img.shape[0]):
    #     for j in range(img.shape[1]):
    #         newPoint = np.matmul(np.array([j,i])-offsetOrigin,rotationMatrix) 
    #         newPoint = np.array([round(newPoint[0]),round(newPoint[1])])
    #         newPoint = newPoint + offset
    #         if newPoint[0] >= rotationShape[0] or newPoint[1] >= rotationShape[1] or newPoint[0] < 0 or newPoint[1] < 0:
    #             continue
    #         else:
    #             imgTrans[newPoint[1],newPoint[0]] = img[i,j]
    # smooth
    # for i in range(rotationShape[0]):
    #     for j in range(rotationShape[1]):
    #         if imgTrans[i][j] == 0:
    #             try:
    #                 if imgTrans[i+1][j] != 0 and imgTrans[i-1][j] != 0:
    #                     imgTrans[i][j] = np.uint8((int(imgTrans[i+1][j]) + int(imgTrans[i-1][j]))/2)
    #             except:
    #                 continue
    # return imgTrans
    (h,w) = img.shape[:2]
    center = (int(w/2), int(h/2))
    M = cv2.getRotationMatrix2D(center,-45,1)
    imgTrans = cv2.warpAffine(img,M,(w,h))
    return imgTrans
   
def shrink(img):
    imgTrans = cv2.resize(img,(int(img.shape[0]/2),int(img.shape[1]/2)), interpolation=cv2.INTER_NEAREST)
    return imgTrans
def binarize(img):
    imgTrans = np.where(img < 128,np.uint8(0),np.uint8(255))
    return imgTrans
    
def imageShow(img):
    return
    cv2.namedWindow('test',cv2.WINDOW_NORMAL)
    cv2.imshow('test',img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
def main():
    assert len(sys.argv) ==2
    assert int(sys.argv[1]) > 0 and int(sys.argv[1]) < 7
    img = cv2.imread("lena.bmp",0)
    # img = cv2.imread("lenaPhoto.jpeg",0)

    arg = int(sys.argv[1])
    if arg == 1:
        img_ans = upsideDown(img)
        cv2.imwrite("1.upsideDown.bmp",img_ans)
        imageShow(img_ans)
    elif arg == 2:
        img_ans = rightSideLeft(img)
        cv2.imwrite("2.rightSideLeft.bmp",img_ans)
        imageShow(img_ans)
    elif arg == 3:
        img_ans = diagFlip(img)
        cv2.imwrite("3.diagFlip.bmp",img_ans)
        imageShow(img_ans)
    elif arg == 4:
        img_ans = rotate(img)
        cv2.imwrite("4.rotate.bmp",img_ans)
        imageShow(img_ans)
    elif arg == 5:
        img_ans = shrink(img)
        cv2.imwrite("5.shrink.bmp",img_ans)
        imageShow(img_ans)
    elif arg == 6:
        img_ans = binarize(img)
        cv2.imwrite("6.binarize.bmp",img_ans)
        imageShow(img_ans)
if __name__ == "__main__":
    main()