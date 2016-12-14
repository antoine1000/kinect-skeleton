/* 

- Project by Antoine Puel (http:/antoine.cool)  
- Based on the SimpleOpenNi and oscP5 libraries
- Big thanks to Greg Borenstein and his book Making Things See
- & to Rebecca Fiebrink for Wekinator and Wekinator's examples.
- Credits for the font : Alte DIN 1451 by Peter Wiegel 

*/

import SimpleOpenNI.*;
import oscP5.*;
import netP5.*;

SkeletonKinect  kinect;
OscP5 oscP5;
NetAddress dest;
NetAddress dest2;

boolean visibleUser;
float textPosition;

// * Array of color (put as many color as you want)
color[] userColor = new color[]{ color(255, 0, 0),
                                 color(109, 57, 255),
                                 color(0,255,0),
                                 color(0,0,255)
                                }; 
 
// * Start at the 0 value 
int randomColor = 0;
PFont f;

// * Enable FullScreen 
boolean sketchFullScreen() {
  return false;
}

// Creation of a variable which define the message we send to Wekinator (default : "/wek/inputs")
String inputMessage = "/wek/inputs";

void setup() {

  f = loadFont("AlteDIN1451.vlw");
  textFont(f);

  size(displayWidth, displayHeight, P3D);

  kinect = new SkeletonKinect(this);
// * kinect.setMirror MUST BE BEFORE enableDepth and enableUser functions!!!
  kinect.setMirror(true);
  kinect.enableDepth();
// * Turn on user tracking
  kinect.enableUser();

// * Choose the x position you want to display the debbuging informations
  textPosition = width/1.5;
  
  smooth();

  /* instantiating oscP5, listening to OSC messages *coming* from port 9000 */
  oscP5 = new OscP5(this, 9000);
// Parameter #1 = your local IP adress (kinda like the postal adress of your computer) by default --> "127.0.0.1"
// Parameter #2 = the port we *send* the message on (kinda like a specific mailbox at your postal adress)
  dest = new NetAddress("127.0.0.1", 6448);
  dest2 = new NetAddress("127.0.0.1", 6449);

}

void draw() { 

  kinect.update();
  background(0);

// * Put detected users in an IntVector
  IntVector userList = new IntVector();
  kinect.getUsers(userList);
                                   
// * Search for an user and give him a UserId
  for (int i=0; i < userList.size(); i++) {
    int userId = userList.get(i);

// * For every user, draw the skeleton
    if ( kinect.isTrackingSkeleton(userId)) {
      stroke(userColor[ randomColor ] );
      kinect.drawSkeleton(userId);
// * Set to false to turn off success tracking message      
      displaySuccess(true);
    } else {      
// * Set to false to turn off error tracking message
      displayError(true);         
// * Each time the tracking is lost, change the random color value for the next tracking   
      randomColor = (int)random(0, userColor.length); 
    }
// Sending a message every two frames (if 30 images/s, it sends 15 OSC message a second)
      if(frameCount % 2 == 0) {
        sendOsc(userId);
        startDTW();
      }
 }
 
// * Set to false to turn off the debugging informations
 displayInfo(true);
 }

