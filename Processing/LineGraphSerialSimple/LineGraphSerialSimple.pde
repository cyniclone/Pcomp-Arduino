
import processing.serial.*;

//this is used by the LineGraph class. This is the number of data points that
//we will keep track of.
int numDataPoints = 500;

//You need one LineGraph variable for each line.
LineGraph mx;
LineGraph my;
LineGraph mz;

float xIn = 0;
float yIn = 0;
float zIn = 0;

Serial port;  // Create object from Serial class


void setup() {
  size(800, 640);

  //the frameRate will dictate how fast the line gets drawn.
  frameRate(10);

  //findSerialPort();
  port = new Serial(this, "/dev/tty.usbmodem1421", 9600);
  port.bufferUntil('\n');
  
  //Create our three lines.
  mx = new LineGraph(numDataPoints, 0, 1023);
  my = new LineGraph(numDataPoints, 0, 1023);
  mz = new LineGraph(numDataPoints, 0, 1023);

  //Set where we want each line to appear.
  mx.setRect(0, 0, width, height / 3.0);
  my.setRect(0, height / 3.0, width, height / 3.0);
  mz.setRect(0, 2 * height / 3.0, width, height / 3.0);

  //Set the color of each line.
  mx.setLineColor(color(255, 64, 64));
  my.setLineColor(color(64, 255, 64));
  mz.setLineColor(color(64, 64, 255));

}

void draw() {
  background(51); 
  mx.push(xIn);
  my.push(yIn);
  mz.push(zIn);
    
  mx.draw();
  my.draw();
  mz.draw();
}

void serialEvent(Serial port) {
  try {
    String s = port.readStringUntil('\n');
    String[] xyz = splitTokens(s, " \r\n\t,");
    println(xyz);
    if ( xyz.length >= 1) {
      xIn = Integer.parseInt(xyz[0]);
    }
    if (xyz.length >= 2) {
      yIn = Integer.parseInt(xyz[1]);
    }
    if (xyz.length >= 3) {
      zIn = Integer.parseInt(xyz[2]);
      //println(zIn);
    }
  }
  catch (Exception ex) {
    println(ex);
  }
}

