
final int BILINEAR = 0;
final int HOMOGRAPHIC = 1;
int mode = BILINEAR;

String[] modeLabel = { "bilinear", "homographic" };

void drawModeLabel() {
  fill(0);
  text(modeLabel[mode], 20, 20);
}

void keyPressed() {

  switch(key) {
  case 'r':
    reset();
    break;
  case ' ':
    // switch modes
    mode = (mode + 1) % 2;
    break;
  case CODED:
    // select columns and rows
    switch(keyCode) {
    case RIGHT:
      cols++;
      break;
    case LEFT:
      cols--;
      break;
    case UP:
      rows++;
      break;
    case DOWN:
      rows--;
      break;
    };
    cols = constrain(cols, 1, 20);
    rows = constrain(rows, 1, 20);
  }

  // update mappings
  mapping = createMapping(quad1, quad2);
  grid1.mapping = createMapping(quad1);
  grid2.mapping = createMapping(quad2);
}

Mapping createMapping(Quad quad) {
  Mapping m = null;
  if (mode == BILINEAR ) m = new BilinearUnit2Quad(quad);
  if (mode == HOMOGRAPHIC) m = new HomographicUnit2Quad(quad);
  return m;
}

Mapping createMapping(Quad quad1, Quad quad2) {
  Mapping m = null;
  if (mode == BILINEAR ) m = new BilinearQuad2Quad(quad1, quad2);
  if (mode == HOMOGRAPHIC) m = new HomographicQuad2Quad(quad1, quad2);
  return m;
}
