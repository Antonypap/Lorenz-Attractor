import java.util.*;

float x = 0.01;
float y = 0;
float z = 0;

// When rho =28, sigma =10, and beta =8/3, the Lorenz system has chaotic solutions (but not all solutions are chaotic). (Source: Wikipedia)
float rho = 28;
float sigma = 10;
float beta = 8.0/3.0;

ArrayList<Point> points = new ArrayList<Point>();

float red = 0;
float blue = 0;
float green = 0;

class Point {
  float x;
  float y;
  float z;
  float a;

  public Point(float new_x, float new_y, float new_z) {
    this.x = new_x;
    this.y = new_y;
    this.z = new_z;
    this.a = 255;
  }
}

void setup() {
  size(500, 500, P3D);
  //colorMode(HSB);
  //background(0);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (sigma * (y - x))*dt;
  float dy = (x * (rho - z) - y)*dt;
  float dz = (x * y - beta * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new Point(x, y, z));

  translate(width/2, height/2 + height/4);
  scale(5);
  rotateX(PI/2);
  //rotateZ(-PI/8);
  
  //Iterator<Point> iter = points.iterator();

  //while (iter.hasNext()) {
  //  Point p = iter.next();
  
  for (int i = points.size()-1; i >= 0; i--){
    
    Point p = points.get(i);
    
    red = 255;
    stroke(red, blue, green, p.a);
    point(p.x, p.y, p.z);

    if (p.a > 0) {
      p.a -= 0.2;
    } else {
      points.remove(p);
    }
  }
}
