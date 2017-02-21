/* *-*-*-*-*-* GET THE POSITION OF ANY SKELETON JOINT *-*-*-*-*-*

 * Return a 3 dimensionnal PVector, values are already mapped to fullscreen
 
 */

 PVector getJoint(int userId, int jointID) {
  
  PVector joint = new PVector();
  float confidence = kinect.getJointPositionSkeleton(userId, jointID, joint);

  PVector convertedJoint = new PVector();
  kinect.convertRealWorldToProjective(joint, convertedJoint);

// * Translation of kinect proportion to fullscreen proportions
  convertedJoint.x = map(convertedJoint.x, 0, 640, 0, width);
  convertedJoint.y = map(convertedJoint.y, 0, 480, 0, height);
  
  return convertedJoint;

} 
