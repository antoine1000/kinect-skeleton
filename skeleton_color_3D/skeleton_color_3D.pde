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
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

// Enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
}

void draw() {
  background(0);

  //image(kinect.getColorImage(), 0, 0, width, height);


// Get the 2D data points from the Skeleton Color Map  
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

// Print the X, Y, Z positions of Skeleton Color
      float xpos = joints[KinectPV2.JointType_HandRight].getX();
      float ypos = joints[KinectPV2.JointType_HandRight].getY();
      float zpos = joints[KinectPV2.JointType_HandRight].getZ();
      textSize(40);
      fill(0, 255, 0);
      text("COLOR X = " + xpos + "/ COLOR Y = " + ypos + "/ COLOR Z = " + zpos , 50, height/2);

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);

      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
    }
  }

// Get the 3D data points from the 3D skeleton
  ArrayList<KSkeleton> skeleton3DArray =  kinect.getSkeleton3d();

  for (int i = 0; i < skeleton3DArray.size(); i++) {
    KSkeleton skeleton3D = (KSkeleton) skeleton3DArray.get(i);
    if (skeleton3D.isTracked()) {
      KJoint[] joints3D = skeleton3D.getJoints();

      int hand_right = KinectPV2.JointType_HandRight;
      float zzz = getZJoint(joints3D, hand_right);

// Print the X, Y, Z positions of Skeleton 3D
      float xpos = joints3D[KinectPV2.JointType_HandRight].getX();
      float ypos = joints3D[KinectPV2.JointType_HandRight].getY();
      float zpos = joints3D[KinectPV2.JointType_HandRight].getZ();
      float convertZ = map(zpos, 0.5, 4, 0, 100);
      float convertX = map(xpos, -1.5, 1.5, 0, width);
      textSize(80);
      fill(255);
      text("3D X = " + convertX + "3D Z = " + zpos , 50, height/4);
      fill(0, 255, 0);
      text("new Z = " + zzz, 50, height/5);

      

    }
  }

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}