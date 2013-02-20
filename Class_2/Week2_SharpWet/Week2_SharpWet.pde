/* Write a Processing sketch that outputs 2 shapes on a page. 
 The first shape should be inspired by the word “wet”. 
 The second shape should be inspired by the word “sharp”. 
 Use only black and white. You have to use beginShape(), and all vertex points 
 have to be created in a for loop. No manual plotting. */
import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 15;
float print_height = 22;

// This will help make the sketch window bigger
float make_bigger = 40;
int circleSize = 2;

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "whiteprint8.pdf");
  smooth();
  background(255);
  noStroke();
  fill(255);
  float numVertices = 7;
//____________
//  gradient circle variables
//  color c = color (255, 255, 255, random (255));
//  float value = alpha (c);
//  for (int r = 20; r> 0; --r) {
//    fill(value, c);
//    ellipse(width/3, height/4, r, r);
//    value = (value +1) %360;
//  }


  //start a shape at the edge of the round
  translate(width/3, height/4);
  float x = cos(radians(50)) * (circleSize / 2);
  float y = sin(radians(50)) * (circleSize / 2);
  //begin sharp shape
  beginShape();
  stroke(0);
  fill(0);
  for (int i = 0; i< numVertices; i++) {
    vertex ( x, y);
    vertex (random (x, width), random (y, height));
    //vertex (random (x, width), random (y, height));
    vertex (x, y);
    bezierVertex (random(100, 150), random(height), random (200, 250), random (height), random (600, 800), random (500, height));
  }
  endShape();
  endRecord();
}


