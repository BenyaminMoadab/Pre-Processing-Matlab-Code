# -*- coding: utf-8 -*-
"""
Created on Sun Sep 11 16:50:08 2022

@author: Asus
"""

import cv2


image = cv2.imread(r'C:\Users\Asus\Desktop\b.png')
cv2.imshow('original', image)
cv2.waitKey(0)


# Instead of box filter, gaussian kernel
Gaussian1 = cv2.GaussianBlur(image, (3,3), 0)
Gaussian2 = Gaussian1 * image

Gaussian3 = cv2.GaussianBlur(image, (5,5), 0)
Gaussian4 = Gaussian3 * image

Gaussian5 =  Gaussian4 - Gaussian2;

cv2.imshow('Gaussian Blurring3', Gaussian5)
cv2.waitKey(0)



# Bilateral is very effective in noise removal while keeping edges sharp
bilateral = cv2.bilateralFilter(Gaussian5, 109, 175, 175)
cv2.imshow('Bilateral Blurring', bilateral)
cv2.waitKey(0)
cv2.destroyAllWindows()
cv2.imwrite('savedimage.jpg', bilateral)  