
// Homographic Projection (Projective Geometry)
// See: https://www.particleincell.com/2012/quad-interpolation/

class HomographicQuad2Quad implements Mapping {

  Homography homo;

  HomographicQuad2Quad(Quad q1, Quad q2) {
    homo = new Homography(q1.v1, q1.v2, q1.v3, q1.v4, q2.v1, q2.v2, q2.v3, q2.v4);
  }

  PVector map(PVector p) {
    return homo.transform(p);
  }

  PVector unmap(PVector p) {
    return homo.transformInverse(p);
  }
}

class HomographicUnit2Quad extends HomographicQuad2Quad {
  HomographicUnit2Quad(Quad q) {
    super(createUnitQuad(), q);
  }
}


class HomographicQuad2Unit extends HomographicQuad2Quad {
  HomographicQuad2Unit(Quad q) {
    super(q, createUnitQuad());
  }
}
