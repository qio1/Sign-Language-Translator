# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import os
import cv2


def tograyscale(path):
    files = os.listdir(path)
    for file in files:
        pathf = path+"/"+file
        image = cv2.imread(pathf)
        gray = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
        cv2.imwrite(pathf,gray)

path = "C:/Users/qiao/Downloads/asl_test"                
tograyscale(path)