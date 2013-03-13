/* Import libraries
 ----------------------------------------------------------- */

import geomerative.*;
import processing.pdf.*;
import toxi.color.*;
import toxi.util.datatypes.*;


/* Global variables
 ----------------------------------------------------------- */

float print_width = 5.5;
float print_height = 8;
float make_bigger = 70;
float gutterSize = 5;
float margin = 30;
float rows;
float columns;
int ellipseSize = 2;


RShape title;
RShape spaceship;
RShape author;
RShape smallcraft;

/* Setup
 ----------------------------------------------------------- */

void setup()
{

  size(round(print_width * make_bigger), round(print_height * make_bigger));
  setupShapes();
  smooth();
  ellipseMode(CORNER);
  noStroke();

  ModularGrid grid = new ModularGrid(4, 5, 5, 30);
  beginRecord(PDF, "test.pdf");
  colorMode(HSB, 1, 1, 1);
  background(0.5527, 0.91, 0.3);



  TColor[] colors = {
    TColor.newHSV(0.5527, 0.91, 0.2), TColor.newHSV(0.5527, 0.91, 0.2), TColor.newHSV(0.5527, 0.91, 0.2), TColor.newHSV(0.5527, 0.91, 0.2)
  };
//
  for(int i = 0; i < grid.modules.length; i++)
  {
    TColor col = colors[i];

    for(int j = 0; j < grid.modules[i].length; j++)
    {
      for(int k = 0; k < 30; k++)
      {
        Module mod = grid.modules[i][j];
        fill(col.hue(), col.saturation(), col.brightness());
        noStroke();
        float x = random(mod.x, mod.x + mod.w - ellipseSize);
        float y = random(mod.y, mod.y + mod.h - ellipseSize);
        arc(x, y, ellipseSize, ellipseSize, 0, PI);
      }

      col.lighten(.4);
    }
  }

  //grid.display();
  noStroke();
  Module zero = grid.modules[0][0];
  Module zeroone = grid.modules[0][1];
  Module zerotwo = grid.modules [0][2];
  Module zerothree = grid.modules [0][3];
  Module zerofour = grid.modules[0][4];
  Module onezero = grid.modules[1][0];
  Module oneone = grid.modules[1][1];
  Module onetwo = grid.modules[1][2];
  Module onethree = grid.modules[1][3];
  Module onefour = grid.modules[1][4];
  Module twozero = grid.modules[2][0];
  Module twoone = grid.modules[2][1];
  Module twotwo = grid.modules[2][2];
  Module twothree = grid.modules[2][3];
  Module twofour = grid.modules[2][4];
  Module threezero = grid.modules[3][0];
  Module threeone = grid.modules[3][1];
  Module threetwo = grid.modules[3][2];
  Module threethree = grid.modules[3][3];
  Module threefour = grid.modules[3][4];
  //Module fourzero = grid.modules[4][0];
  //Module fourone = grid.modules[4][1];
  //Module fourtwo = grid.modules[4][2];
  //Module fourthree = grid.modules[4][3];
  //Module fourfour = grid.modules[4][4];

  /* 
   	SECOND.....
   	Now place the shapes in the grid.
   	Try to place them, size them, overlay them, color them. Think about scale.
   	You will need to translate and scale the shapes to fit the modules. Here's how you do that:
   	
   			// first get a module
   			Module first = grid.modules[0][0];
   			
   			// then translate to the module position
   			translate(first.x, first.y);
   
   			// then scale the shape beto the module before drawing it
   			head.scale(first.w / head.width);
   
   			// remember, that you can make the shape span 2 modules by doing this:
   			head.scale(first.w / ((head.width * 2) + gutterSize));
   
   			// then draw the shape
   			head.draw();
   */


  //_________________________________________________________________
  beginShape();
  stroke(.025, .06, .83);
  noFill();
  //ellipseMode(CENTER);
  curveVertex(zero.x, zero.y);
  curveVertex(zero.x, zero.y);

  curveVertex(oneone.x, oneone.y);
  curveVertex(width/2-gutterSize, height/2);
  curveVertex(onefour.x, onefour.y);
  curveVertex(margin, height-margin);  
  curveVertex(margin, height-margin);  

  endShape();
  beginShape();
  stroke(.025, .06, .83);
  noFill();
  //ellipseMode(CENTER);
  curveVertex(width-margin, margin);
  curveVertex(width-margin, margin);

  curveVertex(threeone.x, threeone.y);
  curveVertex(width/2+gutterSize, height/2);
  curveVertex(threefour.x, threefour.y);
  curveVertex(width-margin, height-margin);  
  curveVertex(width-margin, height-margin);  

  endShape();

  ellipseMode(CENTER);
  ellipse(width/2, height/2, 60, 60);
  pushMatrix();
resetMatrix();
     

  translate (width/2, height/2);
  rotate(PI/5.0);
  ellipse(0, 0, 400, 200);
  ellipse(0, 0, 40, 70);
  // draw the spaceship in -150, 0
  float ranDegree = random(360);
  float spaceX = cos(radians(ranDegree)) * 200;
  float spaceY = sin(radians(ranDegree)) * 100;
  fill(0, 1, 1);
  stroke(0, 1, 1);
  //ellipse(spaceX, spaceY, 25, 25);
//    smallcraft.scale(.4);
//smallcraft.rotate (PI/-5);
//  smallcraft.translate (zero.x, zero.y);
//  smallcraft.draw();
//  

  //smallcraft.scale (.5);

  //smallcraft.scale(spaceX* smallcraft.width, spaceY *smallcraft.height);

  popMatrix();
  //__________________________

  // draw a title
  pushMatrix();
  // first get a module
  TColor newColor = TColor.newHSV(.53, .91, .70);
  fill(newColor.hue(), newColor.saturation(), newColor.brightness());
  noStroke();
  Module first = grid.modules[0][1];

  // then translate to the module position
  translate(zero.x+ 10, zero.y*3.3);

  // then scale the shape beto the module before drawing it
  float r = (first.w*4/ title.width);
  title.scale(r, r) ;


  // then draw the shape
  title.draw();
  popMatrix();


  // ______________________________________________________ 


 
  //___________________________________
  //draw the author
  pushMatrix();
  // first get a module
  noStroke();
  fill(.025, .06, .83);

  // then translate to the module position
  translate(onefour.x+5, onefour.y);

  // then scale the shape beto the module before drawing it
  author.scale((onefour.w*2/ author.width), (onefour.h/3/author.height)) ;


  // then draw the shape
  author.draw();
  popMatrix();
  // stroke(1, 1, 1);


  //________________________________________

//  //draw the smallcraft
  pushMatrix();
  resetMatrix();
  // first get a module
  stroke(.025, .06, .83);
  fill(.025, .06, .83);
smallcraft.scale(.2);

  // then translate to the module position
 smallcraft.translate(threetwo.x, threetwo.y-15);

//  // then draw the shape
//  smallcraft.translate(spaceX, spaceY);
//smallcraft.rotate(.3);
smallcraft.draw();
 popMatrix();

  endRecord();
}




/* Stuff you don't need to worry about unless you want to
 ---------------------------------------------------- */

/*
	Some fun methods you can try to use in the RShape objects
 
 	shape.draw(); // always draws in 0,0
 	shape.translate(); // alternate translate just for this shape
 	shape.scale(float); // scale the shape by a percentage
 	shape.transform(x, y, width, height); // fit the shape inside a rectangle width this x,y,width,height
 	shape.getX();
 	shape.getY();
 	shape.getWidth();
 	shape.getHeight();
 */

void setupShapes()
{
  RG.init(this);
  RG.ignoreStyles(true);


  title = RG.loadShape("title.svg");
  spaceship = RG.loadShape("spaceship.svg");
  author = RG.loadShape("author.svg");
  smallcraft= RG.loadShape("smallcraft.svg");
}

