//DRAW BODY
void drawBody(KJoint[] joints) {
  drawBone(joints, HEAD, NECK);
  drawBone(joints, NECK, SPINE_SHOULDER);
  drawBone(joints, SPINE_SHOULDER, SPINE_MID);
  drawBone(joints, SPINE_MID, SPINE_BASE);
  drawBone(joints, SPINE_SHOULDER, SHOULDER_RIGHT);
  drawBone(joints, SPINE_SHOULDER, SHOULDER_LEFT);
  drawBone(joints, SPINE_BASE, HIP_RIGHT);
  drawBone(joints, SPINE_BASE, HIP_LEFT);

  // Right Arm
  drawBone(joints, SHOULDER_RIGHT, ELBOW_RIGHT);
  drawBone(joints, ELBOW_RIGHT, WRIST_RIGHT);
  drawBone(joints, WRIST_RIGHT, HAND_RIGHT);
  drawBone(joints, HAND_RIGHT, HAND_TIP_RIGHT);
  drawBone(joints, WRIST_RIGHT, THUMB_RIGHT);

  // Left Arm
  drawBone(joints, SHOULDER_LEFT, ELBOW_LEFT);
  drawBone(joints, ELBOW_LEFT, WRIST_LEFT);
  drawBone(joints, WRIST_LEFT, HAND_LEFT);
  drawBone(joints, HAND_LEFT, HAND_TIP_LEFT);
  drawBone(joints, WRIST_LEFT, THUMB_LEFT);

  // Right Leg
  drawBone(joints, HIP_RIGHT, KNEE_RIGHT);
  drawBone(joints, KNEE_RIGHT, ANKLE_RIGHT);
  drawBone(joints, ANKLE_RIGHT, FOOT_RIGHT);

  // Left Leg
  drawBone(joints, HIP_LEFT, KNEE_LEFT);
  drawBone(joints, KNEE_LEFT, ANKLE_LEFT);
  drawBone(joints, ANKLE_LEFT, FOOT_LEFT);

  drawJoint(joints, HAND_TIP_LEFT);
  drawJoint(joints, HAND_TIP_RIGHT);
  drawJoint(joints, FOOT_LEFT);
  drawJoint(joints, FOOT_RIGHT);

  drawJoint(joints, THUMB_LEFT);
  drawJoint(joints, THUMB_RIGHT);

  drawJoint(joints, HEAD);
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}

/*
Different hand state
 KinectPV2.HandState_Open
 KinectPV2.HandState_Closed
 KinectPV2.HandState_Lasso
 KinectPV2.HandState_NotTracked
 */
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}

float getZJoint(KJoint[] joints3D, int jointType) {
  float zpos = joints3D[jointType].getZ();
/* Convert from 0.5 and 4.5 because 0.5 meter is the minimum distance 
for the Kinect to get data and 4.5 meters is the maximum distance */
  float convertZ = map(zpos, 0.57, 4.5, 0, 100);
  return convertZ;
}

/* 
  It also happens that the value of the Z value from
  the getSkeleton3d() function is between 0.5 and 4.5 (magic, no ?)
*/