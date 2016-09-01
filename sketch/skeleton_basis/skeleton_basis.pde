import SimpleOpenNI.*;
SimpleOpenNI  kinect;

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
  kinect.enableUser();
}

void draw() {
  kinect.update();
  //image(kinect.depthImage(), 0, 0);
  background(0);

  IntVector userList = new IntVector();
  kinect.getUsers(userList);

  //  if (userList.size() > 0) {
  //  int userId = userList.get(0);

  // Search for an user and give him a UserId
  for (int i=0; i<userList.size (); i++) {
    int userId = userList.get(i);

    if ( kinect.isTrackingSkeleton(userId)) {
      drawSkeleton(userId);
    }
  }
}

// ----- DRAW SKELETON FUNCTION -----

void drawSkeleton(int userId) {

  // *** DRAW EACH LIMBS INDVIDUALLY ***
  
  strokeWeight(5);
  drawLimbs(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  drawLimbs(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  drawLimbs(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  drawLimbs(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  drawLimbs(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  drawLimbs(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  drawLimbs(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  drawLimbs(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawLimbs(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  drawLimbs(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  drawLimbs(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);


  // *** DRAW EACH JOINTS INDIVIDUALLY ***

  //drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
  drawJoint(userId, SimpleOpenNI.SKEL_NECK);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
  drawJoint(userId, SimpleOpenNI.SKEL_NECK);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);  
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);  
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_FOOT);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);  
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_FOOT);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
}

// ----- "draw Joint" FUNCTION ---> get each joint position -----
void drawJoint(int userId, int jointID) {
  PVector joint = new PVector();
  float confidence = kinect.getJointPositionSkeleton(userId, jointID, joint);
  if (confidence < 0.5) {
    return;
  }

  PVector convertedJoint = new PVector();
  kinect.convertRealWorldToProjective(joint, convertedJoint);

  // *** Translation of kinect proportion to fullscreen proportions ***
  float jointX = map(convertedJoint.x, 0, 640, width, 0);
  float jointY = map(convertedJoint.y, 0, 480, 0, height);

  // *** Graphic stuff ***
  noStroke();
  fill(109, 57, 255);
  ellipse(jointX, jointY, 10, 10);

  // ----- TRACK THE HEAD -----
  PVector head = new PVector();
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, head);
  PVector convertedHead = new PVector();
  kinect.convertRealWorldToProjective(head, convertedHead);

  // *** Translation of kinect proportion to fullscreen proportions ***
  float headx = map(convertedHead.x, 0, 640, width, 0);
  float heady = map(convertedHead.y, 0, 480, 0, height);

  // *** Graphic stuff ***
  strokeWeight(5);
  stroke(109, 57, 255);
  noFill();
  ellipseMode(CENTER);
  ellipse(headx, heady, 70, 70);
}



// ----- "drawLimbs" FUNCTION -----
// *** (I re-create the buit-in "drawLimb" function from SimpleOpenNI (for fullscreen purpose) ***
void drawLimbs(int userId, int limbID1, int limbID2) {
  PVector joint1 = new PVector();
  PVector joint2 = new PVector();
  float limb1 = kinect.getJointPositionSkeleton(userId, limbID1, joint1);
  float limb2 = kinect.getJointPositionSkeleton(userId, limbID2, joint2);

  PVector convertedJoint1 = new PVector();
  PVector convertedJoint2 = new PVector();
  kinect.convertRealWorldToProjective(joint1, convertedJoint1);
  kinect.convertRealWorldToProjective(joint2, convertedJoint2);


  // *** Translation of kinect proportion to fullscreen proportions ***
  float limb1X = map(convertedJoint1.x, 0, 640, width, 0);
  float limb1Y = map(convertedJoint1.y, 0, 480, 0, height);
  float limb2X = map(convertedJoint2.x, 0, 640, width, 0);
  float limb2Y = map(convertedJoint2.y, 0, 480, 0, height);
  

  // *** Graphic stuff (actually, draw the line from a joint to another) ***
  stroke(109, 57, 255);
  strokeWeight(5);
  line(limb1X, limb1Y, limb2X, limb2Y);

}


//-------------- CALLBACK -----------------

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("start tracking skeleton");

  kinect.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}

