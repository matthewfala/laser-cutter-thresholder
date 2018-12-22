

//Use itteration to find threshold
int threshold(int[] pArray, int blacken) {
  float t = 150;
  long u1 = 0;
  long u1Ct = 0;
  long u2 = 0;
  long u2Ct = 0;
  float step = 2;
  
  while (step >= 1) {
     u1 = 0;
     u1Ct = 0;
     u2 = 0;
     u2Ct = 0;
    
    // Average Pixels Before and after T into G1 and G2
    for (int p=0; p< pArray.length; p++) {
      if ( pArray[p] <= t ) {
        u1 += pArray[p];
        u1Ct ++;

      }
      else {
        u2 += pArray[p];
        u2Ct++;
      }
    }

    // Calculations for T adjustment
    u1 = u1 / u1Ct;
    u2 = u2 / u2Ct;
    println(" average u1 " + u1 );
    println( " u1Ct = "  + u1Ct );
    
    println(" average u2 " + u2 );
    println(" u2Ct = " + u2Ct );
    step = abs( t - (u1 + u2)/2 );
    println("step = " + step);
    t = (u1 + u2)/2;
    println( "new t = " +t + " ");
  }
  
  return int(t) + blacken;
}