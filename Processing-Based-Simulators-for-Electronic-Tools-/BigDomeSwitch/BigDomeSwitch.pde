//Author : Ram 
//Tenet Technetronics

/*****************************************/
// The processing code mainly forms as a simulation to test a BIG dome Push button
// Very handy while we were testing the BIG dome for one of our installation
/***************/

import processing.serial.*;

Serial myPort;
int val;

float x, y;
float xt, yt;
float r=150;

boolean locked = false;

PFont font;
PFont push;

void setup() {
size(500, 500);
println(Serial.list());

// Open whatever port is the one you're using.
myPort = new Serial(this, Serial.list()[1], 9600);
// don't generate a serialEvent() unless you get a newline character:
myPort.bufferUntil('\n');
frameRate(30);
textAlign(CENTER, CENTER);
background(255, 204, 0);
smooth();
noStroke();
x = 250;
y = 250;
xt = 250;
yt = 100;
}

void draw() {
fill(255,0,0,50);
ellipse(x, y,r,r);
fill(0,0,0,50);
ellipse(x, y,r+25,r+25);
fill(0, 20);
if ( myPort.available() > 0) {
val = myPort.read();
}
if (val == 0) {

fill(0);
text("R E L E A S E D", x, y);
}

if (val == 1) {
fill(0);
text("P U S H E D", x, y);

}

fill(255,0,0,50);
ellipse(x, y,r,r);

}
