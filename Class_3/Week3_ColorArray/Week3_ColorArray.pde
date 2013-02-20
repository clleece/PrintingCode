/*This week you’ll create an abstract representation (examples) of your identity.
Pick one of the color schemes from today’s lecture and write a Processing 
sketch that outputs abstract forms in colors using your chosen scheme. 
The only constraint - besides that it needs to as simple as possible - 
is that the colors have to be different every time you run your sketch. 
This means that you will need to use “random()”. This is an exercise in writing
code that is generative, but within constraints. Every output should be 
different, but still effectively communicate who you are. 
You can write your own color code or use the Toxiclibs library. Print the 
result that you like the most, and bring to class a poster that you feel 
expresses who you are as a person.
*/

import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;
float print_width = 15;
float print_height = 22;

// This will help make the sketch window bigger
float make_bigger = 40;

boolean savePDF = false;


float [][] distances;
float maxDist;
int space;
FloatRange h = new FloatRange(0, 0.12);
FloatRange s = new FloatRange(0.78, .9);
FloatRange b = new FloatRange(0.8, 1);
ColorRange range = new ColorRange(h, s, b, "My range");

void setup() 
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  colorMode(HSB, 1, 1, 1);

  maxDist = dist(width/2, height/2, width, height);
  distances = new float [width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x ++) {
      float distance = dist(width/3, height/2.5, x, y);
      distances [x][y] = maxDist/distance*10;
    }
  }
  space = 10;
}
void draw()
{
  if (savePDF)
  {
    println("Saving PDF");
  }

  background(HSB, 0, 1, 1);
  smooth();
  noStroke();
  for (int y= 0; y<height; y+= space) {
    for (int x=0; x<width; x+= space) {
      TColor ranColor = range.getColor();
      fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness(), random (distances [x][y]));
      ellipse (x+ space/2, y+ space/2, random (1, 150), random (1, 150));
      if (savePDF)
      {
        endRecord();
        println("Saved PDF");
        savePDF = false;
      }
    }
  }
}
void keyPressed()
{
  if (key == 's')
  {  
    savePDF = true;
    save("prettyPicture"+minute()+"2.tif");
  }
}

