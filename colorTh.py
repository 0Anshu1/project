import matplotlib.image as mpimg
import matplotlib.pyplot as plt 
import numpy as np
import math

image= 'file/path/image.jpg'

#RGB(3 streams) matrix representation of the image
labrat = mpimg.imread(image)
print(labrat)

'''

Write the script wrt the given instruction here.

'''



imgplot = plt.imshow(labrat)

plt.show()
