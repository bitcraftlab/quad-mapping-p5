/*

 # Quad-Mapping-p5
 
 Processing demo to demonstrate algorithms for mapping between two quads:
 
 - using a perspective transform (homography / projective geometry)
 - using bilineaer interpolation (rubber-sheet / lerping between quads)
 
 This technique is used in projection mapping, laser projections etc.
 It re-uses some code from Benjamin Maus' laserschein project for calculating the perspective transform / homographic projections.
 
 ## Mouse Interaction
 
 Move the mouse to see how the mouse position maps from one quad to the other.
 - The blue dot shows what happens to the mouse position when mapped from blue quad onto the red one.
 - The red dot shows what happens to the mouse position when mapped from the red quad to the blue one.
 
 ## Keyboard Interaction
 
 - `[SPACE]` to switch between perspective and bilinear mappings
 - `[r]` to reset / randomize
 - `[LEFT]` and `[RIGHT]` to change the number of columns in a grid
 - `[UP]` and `[DOWN]` to change the number of rows in a grid
 
 ## License
 
 Benjamin Maus' laserschein code is LGPL licensed.  
 Everything else in this sketch MIT licensed.
 
 ## Links
 
 The two mappings are also available via the JAI (Java Advanced Imaging):
 
 - [Perspective Transform](https://download.java.net/media/jai/javadoc/1.1.3/jai-apidocs/javax/media/jai/PerspectiveTransform.html)
 - [InterpolationBilinear](https://download.java.net/media/jai/javadoc/1.1.3/jai-apidocs/javax/media/jai/InterpolationBilinear.html)
 
 Projection Mapping Libraries for Processing:
 
 - [keystone](https://github.com/davidbouchard/keystone)
 - [sketchmapper](https://github.com/josephtaylor/sketch-mapper)
 
 */

Quad unit, quad1, quad2;
Grid grid1, grid2;
Mapping mapping;

int cols = 5;
int rows = 5;
float r = 15;

color c0 = color(0, 50);
color c1 = color(255, 100, 100, 100);
color c2 = color(100, 100, 255, 100);

void setup() {
  size(900, 900);
  strokeWeight(1);
  noStroke();
  reset();
}

void reset() {

  quad1 = createRandomQuad();
  quad2 = createRandomQuad();
  mapping = createMapping(quad1, quad2);

  grid1 = new Grid(quad1);
  grid2 = new Grid(quad2);
}

void draw() {

  background(255);

  drawModeLabel();

  // 1st quad
  fill(c1, 100);
  quad1.draw();
  fill(c1);
  grid1.draw();

  // 2nd quad
  fill(c2, 100);
  quad2.draw();
  fill(c2);
  grid2.draw();

  // mouse cursor 
  fill(c0);
  ellipse(mouseX, mouseY, r, r);

  // 1st cursor
  fill(c1);
  PVector v1 = mapping.map(new PVector(mouseX, mouseY));
  ellipse(v1.x, v1.y, r, r);


  // 2nd cursor
  fill(c2);
  PVector v2 = mapping.unmap(new PVector(mouseX, mouseY));
  ellipse(v2.x, v2.y, r, r);
}
