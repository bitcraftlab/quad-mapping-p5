
final int d = 50;
final int d2 = 400;

Quad createRandomQuad() {
  return new Quad(
    new PVector(rnd(), rnd()), 
    new PVector(width - rnd(), rnd()), 
    new PVector(width - rnd(), height - rnd()), 
    new PVector(rnd(), height - rnd())
    );
}

float rnd() {
  return random(d, d2);
}

Quad createUnitQuad() {
  return new Quad(new PVector(0, 0), new PVector(1, 0), new PVector(1, 1), new PVector(0, 1));
}
