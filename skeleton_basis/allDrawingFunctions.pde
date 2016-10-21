/* *-*-*-*-*-* DRAWING THE SKELETON *-*-*-*-*-* */
// Note : drawLimbs & drawJoint are designed for drawing each joint indivdually, drawSkeleton is the function which draw all the limbs/joints



/* ----------------------------*-*-*- drawLimbs function -*-*-*---------------------------- 

* Create a line between two joints

* /!\ BE CAREFUL !
* This is NOT the 'kinect.drawLimb' BUILT-IN function from SimpleOpenNI
* I re-create the 'kinect.drawLimb' function for fullscreen purpose
* That's why it is called : 'drawLimbs' (with an 's') 

*/

  
// * 3 arguments --> userId, 1st limb and 2nd limb
void drawLimbs(int userId, int limbID1, int limbID2) {

  PVector joint1 = new PVector();
  PVector joint2 = new PVector();
  float limb1 = kinect.getJointPositionSkeleton(userId, limbID1, joint1);
  float limb2 = kinect.getJointPositionSkeleton(userId, limbID2, joint2);

  PVector convertedJoint1 = new PVector();
  PVector convertedJoint2 = new PVector();
  kinect.convertRealWorldToProjective(joint1, convertedJoint1);
  kinect.convertRealWorldToProjective(joint2, convertedJoint2);


  // * Translation of kinect proportion to fullscreen proportions
  float limb1X = map(convertedJoint1.x, 0, 640, width, 0);
  float limb1Y = map(convertedJoint1.y, 0, 480, 0, height);
  float limb2X = map(convertedJoint2.x, 0, 640, width, 0);
  float limb2Y = map(convertedJoint2.y, 0, 480, 0, height);
  

/* Graphic stuff (actually, draw the line from a joint to another)
 * To define the stroke color, go check the main draw function, we set the stroke before the drawSkeleton function  */  
  strokeWeight(5);
  line(limb1X, limb1Y, limb2X, limb2Y);

}


 
/* ----------------------------*-*-*- drawJoint function -*-*-*---------------------------- 

 * Get each joint position, create an ellipse at this position 

 */

void drawJoint(int userId, int jointID) {

  PVector joint = new PVector();
  float confidence = kinect.getJointPositionSkeleton(userId, jointID, joint);
  if (confidence < 0.5) {
    return;
  }

  PVector convertedJoint = new PVector();
  kinect.convertRealWorldToProjective(joint, convertedJoint);

// * Translation of kinect proportion to fullscreen proportions
  float jointX = map(convertedJoint.x, 0, 640, 0, width);
  float jointY = map(convertedJoint.y, 0, 480, 0, height);

// * Graphic stuff 
  noStroke();
  fill(255);
  ellipse(jointX, jointY, 25, 25);

}



/* ----------------------------*-*-*- drawSkeleton function -*-*-*---------------------------- 

* Draw every joint and limbs with drawLimbs & drawJoint functions

*/

void drawSkeleton(int userId) {
  
  // * DRAW EACH LIMBS INDVIDUALLY

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
  
  drawHead(userId);

  /* * DRAW EACH JOINTS INDIVIDUALLY

   * By default, I comment these because I only want my limbs drawed */

/*  drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
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
*/

}


 /* ----------------------------*-*-*- drawHeadfunction -*-*-*---------------------------- 

* Display the head with an ellipse (you can change it by whatever you want) 

*/

 void drawHead(int userId) {
   
// * Track the head
  PVector head = new PVector();
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, head);
  PVector convertedHead = new PVector();
  kinect.convertRealWorldToProjective(head, convertedHead);

// * Translation of kinect proportion to fullscreen proportions
  float headx = map(convertedHead.x, 0, 640, width, 0);
  float heady = map(convertedHead.y, 0, 480, 0, height);

// * Graphic stuff 
  strokeWeight(5);
  noFill();
  ellipseMode(CENTER);
  ellipse(headx, heady, 70, 70);
}




