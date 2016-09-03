// ----- draw Joint function -----
// *** Get each joint position, create an ellipse at this position ***

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
  
  // *** Display userId of each skeleton
//  fill(0, 255, 0);
//  textSize(60);
//  text(userId, headx, heady);

}


