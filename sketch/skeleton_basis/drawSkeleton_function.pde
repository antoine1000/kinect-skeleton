// ----- DRAW SKELETON FUNCTION -----

void drawSkeleton(int userId) {

  // *** DRAW EACH LIMBS INDVIDUALLY ***

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
