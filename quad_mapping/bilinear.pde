
// Bilinear Interpolation (Rubber-Sheet Interpolation)
// See: https://www.particleincell.com/2012/quad-interpolation/

class BilinearUnit2Quad implements Mapping {

  PMatrix m;
  float[] mx = new float[4];
  float[] my = new float[4];

  BilinearUnit2Quad(Quad q) {
    m = new PMatrix3D(1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0);
    m.invert();
    m.mult( q.getX(), mx );
    m.mult( q.getY(), my );
  }

  PVector map(PVector p) {
    return new PVector(mapX(p.x, p.y), mapY(p.x, p.y));
  }

  float mapX(float x, float y) {
    return mx[0] + mx[1]*x + mx[2]*y + mx[3]*x*y;
  }

  float mapY(float x, float y) {
    return my[0] + my[1]*x + my[2]*y + my[3]*x*y;
  }

  PVector unmap(PVector v) {
    float x = v.x;
    float y = v.y;
    float a = mx[3] * my[2] - mx[2] * my[3];
    float b = mx[3] * my[0] - mx[0] * my[3] + mx[1] * my[2] - mx[2] * my[1] + x * my[3] - y *mx[3];
    float c = mx[1] * my[0] - mx[0] * my[1] + x * my[1] - y * mx[1];
    float det = sqrt(b*b - 4*a*c);
    float y2 = (-b+det) / (2*a);
    float x2 = (x - mx[0] - mx[2] * y2) / ( mx[1] + mx[3] * y2);
    return new PVector(x2, y2);
  }
}


class BilinearQuad2Unit implements Mapping {

  Mapping inverse;

  BilinearQuad2Unit(Quad q) {
    inverse = new BilinearUnit2Quad(q);
  }

  PVector map(PVector v) {
    return inverse.unmap(v);
  }

  PVector unmap(PVector v) {
    return inverse.map(v);
  }
}

class BilinearQuad2Quad implements Mapping {

  Mapping m1, m2;

  BilinearQuad2Quad(Quad q1, Quad q2) {
    m1 = new BilinearQuad2Unit(q1);
    m2 = new BilinearUnit2Quad(q2);
  }

  PVector map(PVector p) {
    return m2.map(m1.map(p));
  }

  PVector unmap(PVector p) {
    return m1.unmap(m2.unmap(p));
  }
}
