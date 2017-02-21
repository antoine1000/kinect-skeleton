/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 
 KinectPV2, Kinect for Windows v2 library for processing
 
 3D Skeleton.
 Some features a not implemented, such as orientation
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

/*
float zVal = 300;
float rotX = PI;*/

void setup() {
  size(1024, 768, P3D);

  kinect = new KinectPV2(this);

  kinect.enableColorImg(true);
// Enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

// Enable Depth Image, Mask Image and Skeleton Depth Map
  kinect.enableDepthImg(true);
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  

  kinect.init();
}

void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, 320, 240);

  //translate the scene to the center 
  /*pushMatrix();
  translate(width/2, height/2, 0);
  scale(zVal);
  rotateX(rotX);*/

  int [] rawData = kinect.getRawBodyTrack();
  

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state
      /*drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);*/

      //Draw body
      color col  = skeleton.getIndexColor();
      stroke(col);
      drawBody(joints);
    }
  }
/*  popMatrix();
*/

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}