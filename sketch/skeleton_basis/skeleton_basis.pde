import SimpleOpenNI.*;
SimpleOpenNI  kinect;

public static final int undefined = 0;
boolean visibleUser;

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
  
  smooth();
  }

void draw() {
  kinect.update();
  background(0);
  image(kinect.depthImage(), 0, 0);

  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  // Search for an user and give him a UserId
  for (int i=0; i < userList.size(); i++) {
    int userId = userList.get(i);
    
    if ( kinect.isTrackingSkeleton(userId)) {
      drawSkeleton(userId); 
    }
     else {
      textSize(32);
      fill(255, 255, 0);
      text("personne n'est tracké", width/2, height/2);    }
  }
  
// ----- DEBBUGING MODE : tell the number of users (not necessarly tracked but at least detect by the kinect)
  int howMany = kinect.getNumberOfUsers();
  textSize(32);
  fill(255, 0, 0);
  text(howMany, width - 100, 100);  
  
  if(visibleUser) {
  textSize(32);
  fill(255, 0, 0);
  text("someone's here", width/3, height/3);
  }
}


