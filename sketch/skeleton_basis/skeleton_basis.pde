import SimpleOpenNI.*;
SimpleOpenNI  kinect;

public static final int undefined = 0;
boolean visibleUser;
// make this arrayList public
ArrayList<IntVector> p_positions;

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
  
// instantiate the arrayList
  p_positions = new ArrayList<intVector>();
}

void draw() {
  kinect.update();
  background(0);
  image(kinect.depthImage(), 0, 0);

  IntVector pPos = p_positions.get(userID); // currentPos de la frame précédente


  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  
// Search for an user and give him a UserId
  for (int i=0; i < userList.size(); i++) {
    int userId = userList.get(i);
    PVector position = new PVector(); 
    intVector currentUserPos = kinect.getCoM(userId, position);
    p_positions.set(userId, currentUserPos);
    
    if ( kinect.isTrackingSkeleton(userId)) {
      drawSkeleton(userId); 
    }
     else {
      textSize(32);
      fill(255, 255, 0);
      text("Nobody is tracked!", width/2, height/2);    }
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


