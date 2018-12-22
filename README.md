
![Black&White](https://github.com/matthewfala/laser-cutter-thresholder/blob/master/processed-images/LaserFriendly_Akoko_Edited.jpg
)
# laser-cutter-thresholder
#### Thresholds images for clear laser cuts. Originally written for Apiary Club by Matthew Fala (co-founder)
Thresholder converts images to pure black and white photos

## Apiary Club laser-cutter-thresholder
##### by Matthew Fala
_________

# Laser Cutter Thresholder consists of one section:
> 1) Thresholding software for engraving plant photos into signs

_________


# Build Requirements:
##### Install Processing 3+
Download and install from https://processing.org/download/

# Setup:
#### Place input image in a subfolder of LaserCutterThresholder
> 1) Open LaserCutterThresholder.pde
> 2) Modify dir = "" to point to the subfolder containing the target image
> 3) Modify fileName = "" to the target image file
#### If local threshold is desired:
> 1) Adjust noiseReduction. Noise reduction will lower the local threshold makeing the output image contain less black pixels
> 2) Adjust brushSize. Brush size will set a neighborhood radius for each pixel used in thresholding. Runtime is O(n^2) where n is radius
#### If global threshold is desired:
> 1) Adjust blacken. Blacken raises an autodetermined threshold to make the resulting image contain more black pixels

# Usage:
#### After setting up the software
> 1) Press the Processing build button
> 2) Choose 1 of the 4 thresholding types
>    #### Options: Grayscale, Global, Local, Edge
> 3) Wait. this may take some time
> 4) The thresholded laserfriendly image will be exported to the LaserCutterThreshold/output folder
> 5) To revert to the original color image and run annother threshold, click the thresholded image

#### Local Thresholding:
![Black&White](https://github.com/matthewfala/laser-cutter-thresholder/blob/master/raw-images/Akoko_Edited.png)
![Black&White](https://github.com/matthewfala/laser-cutter-thresholder/blob/master/processed-images/LaserFriendly_Akoko_Edited.jpg
)

#### Shadow Removal Example:
![Black&White](https://github.com/matthewfala/laser-cutter-thresholder/blob/master/LaserCutterThresholder/textures/book.JPG)
![Black&White](https://github.com/matthewfala/laser-cutter-thresholder/blob/master/LaserCutterThresholder/output/LaserFriendly_book.JPG)
