/* 

- Project by Antoine Puel (http:/antoine.cool)  
- Based on the SimpleOpenNi and oscP5 libraries
- Big thanks to Greg Borenstein and his book Making Things See
- & to Rebecca Fiebrink for Wekinator and Wekinator's examples.
- Credits for the font : Alte DIN 1451 by Peter Wiegel 

*/

import SimpleOpenNI.*;

SimpleOpenNI  kinect;

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
  return true;
}

void setup() {

  f = loadFont("AlteDIN1451.vlw");
  textFont(f);

  size(displayWidth, displayHeight, P3D);

  kinect = new SimpleOpenNI(this);
// * kinect.setMirror MUST BE BEFORE enableDepth and enableUser functions!!!
// * Set to false because it interferates with fullscreen mapping */
  kinect.setMirror(false);
  kinect.enableDepth();
// * Turn on user tracking
  kinect.enableUser();

// * Choose the x position you want to display the debbuging informations
  textPosition = width/1.5;
  
  smooth();

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
      drawSkeleton(userId);
// * Set to false to turn off success tracking message      
      displaySuccess(true);
    } else {      
// * Set to false to turn off error tracking message
      displayError(false);         
// * Each time the tracking is lost, change the random color value for the next tracking   
      randomColor = (int)random(0, userColor.length); 
    }
 }
 
// * Set to false to turn off the debugging informations
 displayInfo(true);
 
}

