import java.awt.Point;
import java.awt.Rectangle;
import java.awt.Polygon;
import java.util.List;
import java.util.ArrayList;

import processing.serial.*;

import krister.Ess.*;

import java.awt.AWTException;
import java.awt.Robot;

// Globals for Debugging
boolean noSound = false;	// Turn off sounds
boolean noHit = false;		// Turn off hit testing 

// input variables from arduino
int data;
int currShootInput, currLeftInput, currRightInput, currMoveInput = 0;
int prevShootInput, prevLeftInput, prevRightInput, prevMoveInput;
int turnedRight = 0;
int firstShoot = 0;

Serial port_xbee, port_arduino;

Robot r;

/**
 * TODO
 * o Character Generator for Asteroid Font
 * o High Scores
 */
void setup() {
	//size(500, 375);   // blog
        size(620, 450);   // projector
        //size(640, 480); // decent
	//size(800, 675); // nice
        //size(1024, 768); // big
	frameRate(30);
	smooth();

	fontA = loadFont("CourierNew36.vlw");
    
	// Start sound
	Ess.start(this); // Start Ess
	sounds = new Sounds();

	game = new Game();
	game.init(true);
	
	println("Game Started");
	println("Size = (" + width + ", " + height + ")");

        println(Serial.list());

        // set serial port
        port_xbee = new Serial(this, "/dev/tty.usbserial-A100RZK8", 9600);
        port_xbee.bufferUntil('\n');
        //port_arduino = new Serial(this, "/dev/tty.usbmodemfd141", 9600);
        port_arduino = new Serial(this, "/dev/tty.usbmodem1a12", 9600);
        port_arduino.bufferUntil('\n');
        
        /*
        try{
          r = new Robot();
        }catch(AWTException a){}*/
}

void draw() {
	try {
		game.draw();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}

void serialEvent(Serial thisPort){ 
      int X_KEY_LEFT    = 37;
      
      // Read XBee port
      String XBeeString = port_xbee.readStringUntil('\n');
      if(XBeeString != null)
      {
        println(XBeeString);

        XBeeString = trim(XBeeString);
        int[] val = int(split(XBeeString, '-'));
        
        // start the game with a first shot
        if(val[0]==5 && val[1]==1 && firstShoot==0){ 
          game = new Game();
	  game.init(false);
          firstShoot=1;
        }
        
        // ------------------------------------
        
        // turn left - 2
        if(val[0]==2 && val[1]==1 && turnedRight==1){ game.controller.checkUSB(int(21)); }
        
        // turn right - 3
        if(val[0]==3 && val[1]==1){  game.controller.checkUSB(int(31)); turnedRight=1; }
        
        
        // shoot - 5
        if(val[0]==5 && val[1]==1 && firstShoot==1){  game.controller.checkUSB(int(51)); }
      }
      
      // Read Arduino Mega port
      String inString = port_arduino.readStringUntil('\n');
      if(inString != null)
      {
        println(inString);

        inString = trim(inString);
        int[] val = int(split(inString, '-'));
        
        
        
        
        
        
        
        // move front - 7   or back - 8
        if(val[0] == 7 && val[1]==1){  game.controller.checkUSB(int(71)); } // front
        if(val[0] == 8 && val[1]==1){  game.controller.checkUSB(int(81)); } // back
      }
}

void keyPressed() {
	game.controller.keyPressed();
}

void keyReleased() {
	game.controller.keyReleased();
}

void mousePressed() {
	game.controller.mousePressed();
}


Game game = null;
PFont fontA;
Sounds sounds;

public final int EXPLODE_BIG = 2;
public final int EXPLODE_MEDIUM = 1;
public final int EXPLODE_SMALL = 0;

