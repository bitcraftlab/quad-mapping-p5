
class Grid {

  float r = 5;
  Mapping mapping;

  Grid(Quad quad) {
    mapping = createMapping(quad);
  }

  void draw() {
    pushStyle();
    stroke(g.fillColor);
    for (int row = 0; row <= rows; row++) {
      for (int col = 0; col <= cols; col++) {
        point(col, row);
        if (col > 0) edge(col, row, col - 1, row);
        if (row > 0) edge(col, row - 1, col, row);
        if (col > 0 && row > 0) edge(col, row, col - 1, row - 1);
      }
    }
    popStyle();
  }

  void point(int col, int row) {
    PVector v = map(col, row);
    pushStyle();
    noStroke();
    ellipse(v.x, v.y, r, r);
    popStyle();
  }

  void edge(int c1, int r1, int c2, int r2) {
    PVector v1 = map(c1, r1);
    PVector v2 = map(c2, r2);
    line(v1.x, v1.y, v2.x, v2.y);
  }

  PVector map(int col, int row) {
    float x = norm(row, 0, rows);
    float y = norm(col, 0, cols);
    return mapping.map(new PVector(x, y));
  }
}
