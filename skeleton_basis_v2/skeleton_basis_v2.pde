/*
Based on Thomas Sanchez Lengeling KINECT PV2 library
See http://codigogenerativo.com/
*/

import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;


void setup() {
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);

//Enables depth and Body tracking (mask image)
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableColorImg(true);

  kinect.init();
}

void draw() {
//background(0);

// Draw the color image from the Kinect
  image(kinect.getColorImage(), 0, 0, width, height);
// Draw the depth image from the Kinect
  image(kinect.getDepthMaskImage(), 0, 0);

// Get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

// Individual joints
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    //if the skeleton is being tracked compute the skeleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);

      drawBody(joints);
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
    }
  }

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}