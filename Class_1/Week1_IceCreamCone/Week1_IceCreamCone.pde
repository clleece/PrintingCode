import processing.pdf.*;

void setup(){
  size (500, 650);
  beginRecord(PDF, "Week1.pdf"); 
  background (0);
  smooth();
  strokeWeight(8);
  stroke(0);
  fill (255);
  
  ellipse(width/2, height/3, 200, 200);
  
  triangle(width-345, height/2.6, width-155, height/2.6, width/2, height-80);
  
  noFill();
  translate(width/2.5, height/4.5);
  rotate(PI/7);
  rect(0, 130, 300, 100);

  endRecord();
}


