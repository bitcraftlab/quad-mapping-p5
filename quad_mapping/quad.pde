

class Quad {

  PVector v1, v2, v3, v4;

  Quad(PVector v1, PVector v2, PVector v3, PVector v4) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
    this.v4 = v4;
  }

  void draw() {
    beginShape();
    v(v1); 
    v(v2); 
    v(v3); 
    v(v4);
    endShape(CLOSE);
  }

  private void v(PVector v) {
    vertex(v.x, v.y);
  }

  float[] getX() {
    return new float[] { v1.x, v2.x, v3.x, v4.x };
  }

  float[] getY() {
    return new float[] { v1.y, v2.y, v3.y, v4.y };
  }
}
