//On ITP’s laser printer, print a PDF file generated via a Processing sketch. 
//A few rules about your code: You can only use black (0) and white (255). 
//You are only allowed to use triangle(), rect() and ellipse() once each, 
//and no other drawing functions are allowed (no beginShape or images). 
//Bring to class a design of an ice cream cone. Yes, and ice cream cone.
void setup(){
  size (500, 500);
  background (0);
  smooth();
  strokeWeight(8);
  stroke(0);
  fill (255);
  
  ellipse(width/2, height/3, 200, 200);
  
  fill(255);
  triangle(width-350, height/2.6, width-150, height/2.6, width/2, height-50);
 
  noFill();
  stroke(0);
  translate(width/2.5, height/5.5);
  rotate(PI/7);
  rect(0, 130, 300, 90);

}


