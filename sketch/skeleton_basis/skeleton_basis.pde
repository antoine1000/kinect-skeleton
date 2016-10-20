import SimpleOpenNI.*;
SimpleOpenNI  kinect;

public static final int undefined = 0;
boolean visibleUser;
float textPosition;

// *** ENABLE FULL SCREEN ***
boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight, P3D);
  kinect = new SimpleOpenNI(this);
  // ----- kinect.setMirror MUST BE BEFORE enableDepth and enableUser functions !!! -----
  // set to false because it interferates with fullscreen mapping
  kinect.setMirror(false);
  kinect.enableDepth();
  // turn on user tracking
  kinect.enableUser();

// Choose the x position you want to display the debbuging informations
  textPosition = width/1.5;
  
  smooth();  
}

void draw() {

  kinect.update();
  background(0);
// Display the depth image (Great for debugging purpose)
  image(kinect.depthImage(), 0, 0);

  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  
// Search for an user and give him a UserId
  for (int i=0; i < userList.size(); i++) {
    int userId = userList.get(i);
    
    if ( kinect.isTrackingSkeleton(userId)) {
      drawSkeleton(userId);
      textSize(32);
      fill(0, 255, 0);
      text("Someone is tracked!", textPosition, 150); 
    }
     else {
      textSize(32);
      fill(255, 0, 0);
      text("Nobody is tracked...", textPosition, 150);    
    }
  }
  
// ----- DEBUGGING MODE : tell the number of users (not necessarly tracked but at least detect by the kinect)
  int howMany = kinect.getNumberOfUsers();
  textSize(32);
  fill(255);
  text("Number of users = " + howMany, textPosition, 50);  
  
  if(visibleUser) {
  textSize(32);
  fill(200, 200, 0);
  text("Someone is in front of the Kinect", textPosition, 100);
  }
  
  
}


