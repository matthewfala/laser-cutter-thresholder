
int[] localThreshold(int[] pArray, int imgWidth, int imgHeight, int windowSize, int c) {

  // Brush Window Index
  int wPX = 0;
  int wPY = 0;
  int tempPY = 0;
  int tempPX = 0;
  
  // Threshold Values
  int max = 0;
  int min = 255;
  int thresholdVal = 0;
  
  int[] windowPix = new int[windowSize * windowSize];
  int[] newPArray = new int[imgWidth*imgHeight];
  
  // Y - last Y
  for(int winY = 0; winY < imgHeight; winY++) {
    for(int winX = 0; winX < imgWidth; winX ++) {
      
      // Reset min and Max with window
      min = 255;
      max = 0;
      // Load pixels into window
      wPY = 0;
      for(int pY = winY - windowSize/2; pY < (winY + windowSize/2); pY ++ ) {
        wPX = 0;
        for(int pX = winX - windowSize/2; pX < (winX + windowSize/2); pX ++ ) {
          
          
          // Deal with out of bounds
          tempPY = abs(pY);
          tempPX = abs(pX);
          
          if (tempPY > imgHeight-1) {
            tempPY = 2*(imgHeight-1) - tempPY;
          }
          if (tempPX > imgWidth-1) {
            tempPX = 2*(imgWidth-1) - tempPX;
          }
          
          windowPix[pixelPos(wPX, wPY, windowSize)] = pArray[pixelPos(tempPX, tempPY, imgWidth)];          
          
          wPX++;
        }
        wPY++;
      }
      
      
      // Compute threshold
      thresholdVal = (max + min) / 2 - c;
      // Threshold Window
      windowPix = toBW(windowPix, thresholdVal);
      
      // Load center pixel back   // PROBLEM EDITED IMAGE AFFECTS 
      newPArray[pixelPos(winX, winY, imgWidth)] = windowPix[pixelPos(windowSize/2+1, windowSize/2+1, windowSize)];
      
    }
  }
  return newPArray;
}

// Return pixel location in array
int pixelPos( int pX, int pY, int imgWidth) {
   return imgWidth * pY + pX;

}
