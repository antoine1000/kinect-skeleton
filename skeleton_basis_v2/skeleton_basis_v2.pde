/*
Based on Thomas Sanchez Lengeling KINECT PV2 library
See http://codigogenerativo.com/
*/

import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
PImage rawDepth;


void setup() {
  size(1920, 1080, P3D);
// If you prefer fullscreen mode    
  //fullScreen(P3D);

// Instantiate the Kinect object
  kinect = new KinectPV2(this);

//Enables depth and Body tracking (mask image)
  kinect.enableDepthImg(true);
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableColorImg(true);


  kinect.init();
}

void draw() {
//background(0);

// Draw the color image from the Kinect
  image(kinect.getColorImage(), 0, 0, width, height);
// Draw the DEPTH MASK IMAGE from the Kinect
  image(kinect.getDepthMaskImage(), 0, 0);

// Get the depth image data
  rawDepth = kinect.getDepthMaskImage();


  int dimension = rawDepth.width * rawDepth.height;
  rawDepth.loadPixels();
// For every pixels of the depth image, get its Z position
  for (int i = 0; i < dimension; i++) {
  // I want to retrieve the Z index of each pixel, put it in an array
    //float[] depthZ;
    //depthZ = rawDepth.pixels[i].get();
  } 
  rawDepth.updatePixels();

// getRawDepth return an array of ints, values from 0 - 4500 in mm
  int [] rawData = kinect.getRawDepthData();

// Get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

// For every skeleton, get skeleton points, put them in an array
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
// If the skeleton is being tracked, get and draw the skeleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);

      drawBody(joints);
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);

      PVector head = new PVector(joints[KinectPV2.JointType_Head].getX(), joints[KinectPV2.JointType_Head].getY(), joints[KinectPV2.JointType_Head].getZ());
      textSize(40);
      fill(255, 0, 0);
      text("X = " + head.x + " & Y = " + head.y + " & Z = " + head.z, width/4, height/2);
    }

  }

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}