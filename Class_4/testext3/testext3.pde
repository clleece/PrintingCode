import geomerative.*;

import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 15;
float print_height = 8.5;

// This will help make the sketch window bigger
float make_bigger = 80;

void setup()
{
 //size (1280, 500);
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "xray.pdf");
  background(10, 10, 10);
  
  colorMode(HSB, 1, 1, 1);
  smooth();
  noFill();
  strokeWeight(.3);
  // noStroke();
  translate (30, height/2+135);

  int fontSize = 380;
  RG.init(this);
  RFont font = new RFont ("FreeSans.ttf", fontSize, RFont.LEFT);

  RCommand.setSegmentLength(15);
  RGroup group= font.toGroup("X").toPolygonGroup();
  RPoint[] points1 = group.getPoints();

  RGroup group2= font.toGroup("-").toPolygonGroup();
  RPoint[] points2 = group2.getPoints();

  RGroup group3 = font.toGroup("R").toPolygonGroup();
  RPoint[] points3 = group3.getPoints();

  RGroup group4 = font.toGroup("A").toPolygonGroup();
  RPoint[] points4 = group4.getPoints();

  RGroup group5 = font.toGroup("Y").toPolygonGroup();
  RPoint[] points5 = group5.getPoints();
  //____________________________________________________________________________ 
  TColor newColor = TColor.newHSV(1, 0, 1);
  stroke(newColor.hue(), newColor.saturation(), newColor.brightness());

  beginShape();
  //loop through polygons going to the group
  for (int k = 0; k < group.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group.elements [k];

    //loop through to get all the contours
    for (int i = 0; i <polygon.contours.length; i ++)
    {

      //loop through all the points 
      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {
        //and return a shape for each RPoint
        RPoint curPoint = curContour.points[j];

        vertex(points1[k].x, points1[k].y);
        bezierVertex(points1[k].x, points1[k].y, points1[i].x, points1[i].y, points1[j].x, points1[j].y);
        bezierVertex(points1[j].x, points1[i].y, points1[i].x, points1[k].y, points1[i].x, points1[k].y);
      }
    }
  }
  endShape();

  //____________________________________________________________________________ 
  //GROUP 2!


  translate(250, 0);
  beginShape();
  //loop through polygons going to the group
  for (int k = 0; k < group2.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group2.elements [k];

    //loop through to get all the contours
    for (int i = 0; i <polygon.contours.length; i ++)
    {

      //loop through all the points 
      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {
        //and return a shape for each RPoint
        RPoint curPoint = curContour.points[j];


        vertex(points2[k].x, points2[k].y);
        bezierVertex(points2[k].x, points2[k].y, points2[i].x, points2[i].y, points2[j].x, points2[j].y);
        bezierVertex(points2[j].x, points2[i].y, points2[i].x, points2[k].y, points2[i].x, points2[k].y);
      }
    }
  }
  endShape();

  //____________________________________________________________________________ 

  //GROUP 3!!
  translate(125, 0);
  beginShape();
  //loop through polygons going to the group
  for (int k = 0; k < group3.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group3.elements [k];

    //loop through to get all the contours
    for (int i = 0; i <polygon.contours.length; i ++)
    {

      //loop through all the points 
      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {
        //and return a shape for each RPoint
        RPoint curPoint = curContour.points[j];
        vertex(points3[k].x, points3[k].y);
        bezierVertex(points3[k].x, points3[k].y, points3[i].x, points3[i].y, points3[j].x, points3[j].y);
        bezierVertex(points3[j].x, points3[i].y, points3[i].x, points3[k].y, points3[i].x, points3[k].y);
      }
    }
  }
  endShape();
  //____________________________________________________________________________ 

  //GROUP 4!!
  translate(275, 0);
  beginShape();
  //loop through polygons going to the group
  for (int k = 0; k < group4.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group4.elements [k];

    //loop through to get all the contours
    for (int i = 0; i <polygon.contours.length; i ++)
    {

      //loop through all the points 
      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {
        //and return a shape for each RPoint
        RPoint curPoint = curContour.points[j];
        vertex(points4[k].x, points4[k].y);
        bezierVertex(points4[k].x, points4[k].y, points4[i].x, points4[i].y, points4[j].x, points4[j].y);
        bezierVertex(points4[j].x, points4[i].y, points4[i].x, points4[k].y, points4[i].x, points4[k].y);
      }
    }
  }
  endShape();
  //_______________  

  //GROUP 5!!
  translate(220, 0);
  beginShape();
  //loop through polygons going to the group
  for (int k = 0; k < group5.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group5.elements [k];

    //loop through to get all the contours
    for (int i = 0; i <polygon.contours.length; i ++)
    {

      //loop through all the points 
      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {
        //and return a shape for each RPoint
        RPoint curPoint = curContour.points[j];
        vertex(points5[k].x, points5[k].y);
        bezierVertex(points5[k].x, points5[k].y, points5[i].x, points5[i].y, points5[j].x, points5[j].y);
        bezierVertex(points5[j].x, points5[i].y, points5[i].x, points5[k].y, points5[i].x, points5[k].y);
      }
    }
  }
  endShape();
    endRecord();
}







