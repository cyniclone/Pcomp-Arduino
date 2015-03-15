//This is a very basic sketch for drawing a LineGraph of data from the 
//X-axis of an accelerometer. You need to add the LineGraph file that
//was provided in class to your project. (Choose Sketch->Add File... from the menu.)

//Import the Serial library. You can also add this through the menu under
//Sketch->Import Library...
import processing.serial.*;

//Set the number of data points that we will keep in our buffer.
int _numDataPoints = 500;

//A LineGraph variable for our X-axis values. You can have as many LineGraphs in 
//your window as you'd like, you just need a separate variable for each one.
LineGraph _mx;
LineGraph _my;
LineGraph _mz;

//These are variables that will hold the values from the accelerometer.
float _xIn = 0;
float _yIn = 0;
float _zIn = 0;

//This is our serial port.
Serial _port;
int _baudRate = 9600; //I was using 115200 for bluetooth

void setup() {
  size(800, 1000);

  //We'll start with a low frame rate so the data won't scroll so fast. Experiment with
  //different values.
  frameRate(10);

  //Create a LineGraph for the data. The parameters are:
  //   number of data points to keep around
  //   minimum expected value for the data
  //   maximum expected value for the data
  _mx = new LineGraph(_numDataPoints, 0, 1023);
  _my = new LineGraph(_numDataPoints, 0, 1023);
  _mz = new LineGraph(_numDataPoints, 0, 1023);

  //Set the boundaries of the line graph within the window. The parameters are
  // x, y, width, height
  _mx.setRect(0, 0, width, height/3.0);
  _my.setRect(0, height/3, width, height/3.0);
  _mz.setRect(0, 2.0*height/3.0, width, height/3.0);

  //Set the color used to draw the line. These are RGB values.
  _mx.setLineColor(color(255, 64, 64));
  _my.setLineColor(color(64, 255, 64));
  _mz.setLineColor(color(64, 64, 255));

  //Try to find a serial port.
  findSerialPort();
  

}

void draw() {
  //Fill the background.
  background(51); 
  
  //Add our latest values to the appropriate LineGraph.
  _mx.push(_xIn);
  _my.push(_yIn);
  _mz.push(_zIn);
    
  //Tell each LineGraph to draw itself.
  _mx.draw();
  _my.draw();
  _mz.draw();
}

//The serialEvent function will be called every time a line of data is available on the
//serial port.
void serialEvent(Serial port) {
  try
  {
    //Read a line of text from the Serial Port. '\n' means "newline".
    //s should have a value like "360 360 480"
    String s = port.readStringUntil('\n');
    
    if (s == null) {
      println("readStringUntil returned null.");
      return;
    }
    
    //Now split our line of text into an array of numbers.
    //The " \r\n\t," tells splitTokens to split the string on any white space character
    //or a comma. That's not essential but makes our code more robust.
    String[] xyz = splitTokens(s, " \r\n\t,");
    
    //Now we will assign our array values to our global variables so we can use
    //them in the draw() function. First, we double check to make sure that
    //we have at least 3 values. This is more "robustness".
    if ( xyz.length >= 3) {
      _xIn = Integer.parseInt(xyz[0]);
      _yIn = Integer.parseInt(xyz[1]);
      _zIn = Integer.parseInt(xyz[2]);
      
      println(str(_xIn) + " " + _yIn + " " + _zIn);
    }
    else if (xyz.length == 2) {
      _xIn = Integer.parseInt(xyz[0]);
      _yIn = Integer.parseInt(xyz[1]);
      _zIn = 0;      
    }
    else if (xyz.length == 1) {
      _xIn = Integer.parseInt(xyz[0]);
      _yIn = 0;
      _zIn = 0;      
    }
    else {
      println("No data received.");
    }
    
    //print the array for debugging purposes.
    //println(xyz);
  }
  catch (Exception ex) {
    println(ex); 
  }
}

void findSerialPort() {
  // List all the available serial ports:
  String[] serialPorts = Serial.list();
  println(serialPorts);
  String portName = null;
  for (int i = 0; i < serialPorts.length; i++) {
    if (/*serialPorts[i].startsWith("/dev/tty.RNBT") || */ serialPorts[i].startsWith("/dev/tty.usbmodem")) {
      portName = serialPorts[i];
      break;
    }
  }

  if (portName == null) {
    println("Could not find port.");
    exit();
  }
  else {
    println("Opening port " + portName + "...");
    _port = new Serial(this, portName, _baudRate);
    _port.bufferUntil('\n');
  }

}


