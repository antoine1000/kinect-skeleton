// ----- drawLimbs function 
// *** Create a line between two joints ***

// *** /!\ BE CAREFUL ! ***
// This is NOT the 'kinect.drawLimb' BUILT-IN function from SimpleOpenNI
// I re-create the 'kinect.drawLimb' function for fullscreen purpose
// That's why it is called : 'drawLimbs' (with an 's')

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
