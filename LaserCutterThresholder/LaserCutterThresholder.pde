// Sofware written for Apiary Club
// by Matthew Fala (Apiary Club co-founder)

// FILE NAME///////////////
String dir = "textures";
String fileName = "Akoko.jpg";
String file = dir + "/" + fileName;
///////////////////////////

// LOCAL SETTINGs /////////
// for plant set -7, 50
// for book set 30, 10
int noiseReduction = -15;
int brushSize = 20;

// GLOBAL SETTINGs ///////
int blacken = 0;
///////////////////////////

// Global Variable Setup
int phase = 100;
PImage sample;

// Img 
int imgWidth = 4032;
int imgHeight = 3024;

// Size
int scrWidth = 3000;
int scrHeight = 1500;

// Setup Buttons)
button b0= new button("GRAYSCALE", scrWidth/6,  scrHeight/20 * 4 - scrHeight/12, scrWidth/5, scrHeight/6, #ed7a3c, 1 );
button b1= new button( "GLOBAL", scrWidth/6,  scrHeight/20 * 8 - scrHeight/12, scrWidth/5, scrHeight/6, #ed7a3c, 2 );
button b2= new button( "LOCAL", scrWidth/6,  scrHeight/20 * 12 - scrHeight/12, scrWidth/5, scrHeight/6, #ed7a3c, 3 );
button b3= new button( "EDGE", scrWidth/6,  scrHeight/20 * 16 - scrHeight/12, scrWidth/5, scrHeight/6, #ed7a3c, 4 );
  
//Globalize grayscale image array
int[] gPixels;

// Various Histograms

// Histogram of the percent ouccurance of each level of grey
double[] hPg = new double[256];

// Cumulative Histogram 
long[] hCumul = new long[256];



void setup() {
  size(3000,1500);
  
  // Set sample image
  sample = loadImage(file);
  imgWidth = sample.width;
  imgHeight = sample.height;

}

void draw() {

 // rect(0,0, width/2, height);
 scr2();
 scr3();
 scr4();
 scr5();
 scrRESET();
 
 // Main Screen Last for Draw Priority
 scr1();

}

void scrRESET() {
  if (mousePressed) {
    if ( mouseX > scrWidth/2) {
       // Set sample image
      sample = loadImage(file);
    }

  }
}

void scr1() {
  if (phase == 100) {
      //image(sample,0,0);
        background(235);
        
       b0.hex = #ed7a3c;
       b0.render(); 
       
       b1.hex = #ed7a3c;
       b1.render();
       
       b2.hex = #ed7a3c;
       b2.render();
       
       b3.hex = #ed7a3c;
       b3.render();
       
       phase = 0;
           
  }
  
  if (phase == 0) {
    
    b0.update();
    b1.update();
    b2.update();
    b3.update();
    
    // Make sure that image height is in relation to width.
    image(sample, scrWidth/7 * 3, scrHeight/9, scrWidth/2, scrWidth/2 * imgHeight / imgWidth);
  }
}

// Gray Scale
void scr2() {
  if (phase == 1 ) {  
    // Set sample image
    sample = loadImage(file);
    sample.loadPixels();
    
    // Create Blank Grayscale Pixel Array
    gPixels = new int[sample.pixels.length];
  
    // loat pixel array
    loadGPixels();
    
    updateSamplePx(); // with gPixels
    sample.save("output/LaserFriendly_" + fileName);

    phase = 100;
  }
}

// Global Threshold
void scr3() {
  if (phase == 2 ) {
     // Set sample image
    sample = loadImage(file);
    sample.loadPixels();
    
    // Create Blank Grayscale Pixel Array
    gPixels = new int[sample.pixels.length];
  
    // loat pixel array
    loadGPixels();
    
    // FTFD(.1)
    gPixels = toBW(gPixels, threshold(gPixels, blacken));

    updateSamplePx(); // with gPixels
    sample.save("output/LaserFriendly_" + fileName);
    phase = 100;
  }
}


// LOCAL THRESHOLD
void scr4() {
  if (phase == 3 ) {
    delay(100);
    // Set sample image
    sample = loadImage(file);
    sample.loadPixels();
    
    // Create Blank Grayscale Pixel Array
    gPixels = new int[sample.pixels.length];
  
    // loat pixel array
    loadGPixels();

    // array, image width, image height, sample size, noise reduction;
    gPixels = localThreshold(gPixels, imgWidth, imgHeight, brushSize, noiseReduction);
    updateSamplePx(); // with gPixels
    sample.save("output/LaserFriendly_" + fileName);
    phase = 100;
  }
}

// Edge Threshold
void scr5() {
  if (phase == 4 ) {
     // Set sample image
    sample = loadImage(file);
    sample.loadPixels();
    
    // Create Blank Grayscale Pixel Array
    gPixels = new int[sample.pixels.length];
  
    // loat pixel array
    loadGPixels();
    
    // Both Global then Local thresholding
    gPixels = toBW(gPixels, threshold(gPixels, blacken));
    gPixels = localThreshold(gPixels, imgWidth, imgHeight, brushSize, noiseReduction);

    updateSamplePx(); // with gPixels
    sample.save("output/LaserFriendly_" + fileName);
    phase = 100;
  }
}

class button {
  int x, y, bWidth, bHeight, newPhase;
  color hex;
  String bText;
  
  button(String tText, int tx, int ty, int tbWidth, int tbHeight, color thex, int tnewPhase) {
    bText = tText;
    x = tx;
    y = ty;
    bWidth = tbWidth;
    bHeight = tbHeight;
    hex = thex;
    newPhase = tnewPhase;
  }
  
  void render() {
    fill(hex);
    stroke(hex);
    rect(x, y, bWidth, bHeight, 9);
    textSize(76);
    stroke(255);
    fill(255);
    text(bText, x + bWidth/7, y + bHeight/3 * 2);
  }
  void update() {
    if (mousePressed && (mouseButton == LEFT ) ){
      if (mouseX < (x+bWidth) && mouseX > x) {
        if (mouseY < (y + bHeight) && mouseY > y) {

           // Change button to Clicked color
           hex = #E9573F;
           render();
           phase = newPhase;
           
        } 
      }
    }  
  }
  
}



float red, green, blue, gray;

int mem=0;
void loadGPixels() {
  for (int i = 0; i< sample.pixels.length; i++ ) {
    red = red(sample.pixels[i]);
    green = green(sample.pixels[i]);
    blue = blue(sample.pixels[i]);
    
    gray = ( red + green + blue ) / 3;
    gPixels[i] = int(gray);

  }
  
  for ( int i = 0; i< gPixels.length; i++ ){
    if (gPixels[i] < 1) {
      mem ++;
    } 
  }
  print("mem = " + mem);
}

int[] toBW(int[] grayArray, int bwThreshold) {
  
  int[] BW = new int[grayArray.length];
  
  for (int i = 0; i < grayArray.length; i++ ) {

    if (grayArray[i] <= bwThreshold) {
      BW[i] = 0;
    }
    else {
      BW[i] = int(255); 
    }
  }
 // delay(10000);
  
  return BW;  
}

void updateSamplePx() {
  for (int i = 0; i < sample.pixels.length; i++) {
    sample.pixels[i] = color(int(gPixels[i]), int(gPixels[i]), int(gPixels[i]));
  }
  sample.updatePixels();
}

void setHPG() {
  // Variables
  int counter = 0;
  for (int t = 0; t < 256; t++){
     for (int p = 0; p < pixels.length; p++) {
        if ( pixels[p] == t) {
          counter++;
        }
     }
     hPg[t] = float(counter)/float(pixels.length);
  }  
}
