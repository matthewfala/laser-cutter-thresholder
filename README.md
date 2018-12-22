# laser-cutter-thresholder
Thresholds images for readability and clear laser cuts. Originally written for Apiary Club by Matthew Fala (co-founder)

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