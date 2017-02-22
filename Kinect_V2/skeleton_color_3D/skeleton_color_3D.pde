/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;


void setup() {

  //size(1920, 1080, P3D);
  fullScreen(P3D);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

// Enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
}

void draw() {
  background(0);

// If you want to see the RGB image from HD Camera
  //image(kinect.getColorImage(), 0, 0, width, height);

// Get the depth image data
  //rawDepth = kinect.getDepthMaskImage();

// Get the 2D array data points from the Skeleton Color Map  
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

// Get the Skeleton data joints (X & Y only)

  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      printSkeleton(joints);

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);

      //draw different color for each hand state
      drawHandState(joints[HAND_LEFT]);
      drawHandState(joints[HAND_RIGHT]);
    }
  }


// Get the 3D data points from the 3D skeleton (access to Z point)
  ArrayList<KSkeleton> skeleton3DArray =  kinect.getSkeleton3d();

  for (int i = 0; i < skeleton3DArray.size(); i++) {
    KSkeleton skeleton3D = (KSkeleton) skeleton3DArray.get(i);
    if (skeleton3D.isTracked()) {
      KJoint[] joints3D = skeleton3D.getJoints();

      float zzz = getZJoint(joints3D, HAND_RIGHT);

// Print the X, Y, Z positions of Skeleton 3D
      float zpos = joints3D[HAND_RIGHT].getZ();
      float convertZ = map(zpos, 0.5, 4, 0, 100);

      textSize(60);

      fill(255);
      text("3D Z = " + zpos , 50, height/4);
      fill(0, 255, 0);
      text("new Z = " + zzz, 50, height/5);

      println("number of Z = " + getSkeletonZ(joints3D)[2]);

    }
  }

  fill(255, 0, 0);
  textSize(10);
  text(frameRate, 50, 50);
}

// * Print informations text functions

// Print the X & Y positions next of a particular joint
    void printXY(KJoint[] joints, int jointType) { 
      float xpos = joints[jointType].getX();
      float ypos = joints[jointType].getY();
      textSize(20);
      fill(0, 255, 0);
      text("X = " + xpos, xpos+50, ypos);
      text("Y = " + ypos, xpos+50, ypos+50);
    } 

// Print the X & Y positions of all the skeleton, next to each joint
    void printSkeleton(KJoint[] joints) { 
      for(int i = 0; i <= 25; i++) {
        printXY(joints, i);
      }
    }

  float[] getSkeletonZ(KJoint[] joints3D) {
    int joints_number = 25;
    float[] z_values = new float[joints_number];
// For every joints, get the z value, store it in an array 
     for(int i = 0; i < joints_number; i++) {
        z_values[i] = joints3D[i].getZ();
      }
      return z_values;
  }
