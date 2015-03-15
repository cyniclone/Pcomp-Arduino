class LineGraph {
 //Data buffer.
 private float[] _data;
 
 //number of array elements that are actually valid data.
 private int _validDataCount = 0; 
 
 //Index into _data where we will store the next value.
 private int _next = 0;
 
 //Min and Max expected input values.
 private float _min = 0;
 private float _max = 1023;
 
 
 private float _localPeak = -1;
 private float _direction = -1;
 
 //Rectangle used for drawing
 private float _top = 0;
 private float _left = 0;
 private float _width = width;
 private float _height = height;
 
 //Colors and fonts
 private color _lineColor = color(255);
 private color _textColor = color(0);
 private PFont _font;
 
 //Create a new LineGraph.
 //  size: number of data points to keep around.
 //  min, max: the minimum and maximum expected input values.
 public LineGraph(int size, float min, float max) {
   _data = new float[size];
   _min = min;
   _max = max;
   _font = createFont("Georgia", 24);
 }
 
 // Set the font to use for the value display.
 public void setFont(PFont font) {
   _font = font;
 }
 
 // Set the area on the window where you want the graph to be displayed. For example,
 //   setRect(0, 0, 100, 120) will place the graph in the upper left-hand corner, and it will be 100 by 120 pixels.
 public void setRect(float left, float top, float w, float h) {
   _left = left;
   _top = top;
   _width = w;
   _height = h; 
 }
 
 // Set the color of the line.
 public void setLineColor(color c) {
   _lineColor = c; 
 }
 
 // Push a new input value onto the graph. Normally you will call this in your draw() function.
 public void push(float value) {
   int prev = (_next - 1) % _data.length;
   _data[_next] = value;   
   _next = (_next + 1) % _data.length;
   _validDataCount = min(_validDataCount + 1, _data.length);
 }
 
 //Sets the minimum expected input value. You can also set this in the constructor.
 public void setMinInput(float min) {
   _min = min;
 }
 
 //Sets the maximum expected input value. You can also set this in the constructor.
 public void setMaxInput(float max) {
   _max = max; 
 }
 
 //Draw the graph. You should call this in your draw() function.
 public void draw() {
  pushStyle();
  
  textFont(_font);
  
  int index=0;
  float x = 0;
  float y = 0;
  float lastX = -1, lastY = -1;
  fill(255);
  for (int i = 0; i < _validDataCount; i++) {
    // _next is the next place to write, and thus is the oldest element in the array.
    index = (_next + i) % _validDataCount;
    x = _left + i * (_width / _data.length);
    y = map(_data[index], _min, _max, _top, _top + _height);
    if (lastX >= 0.0 && lastY >= 0.0) {
      stroke(_lineColor);
      strokeWeight(3);
      line(lastX, lastY, x, y);
    }
    
    lastX = x;
    lastY = y;
  }
  
  noStroke();
  fill(_lineColor, 128);
  rect(x-60, y-20, 60, 40);
  
  fill(_textColor);
  textAlign(RIGHT);
  text((int) round(_data[index]), x-10, y);

  popStyle();
 } 
  
  
}
