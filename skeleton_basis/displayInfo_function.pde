/* *-*-*-*-*-* DEBUGGING INFORMATIONS *-*-*-*-*-* */
// Note : Display all informations you need in order to try and debug your code
 
void displayInfo(boolean active) {

  if(active == true) {

// Display the depth image (great for debugging purpose, but the image is mirrored!)
// (except if you set.mirror(true), but it will be the skeleton which will be mirrored!)
  image(kinect.depthImage(), 0, 0);
  
  int howMany = kinect.getNumberOfUsers();
  textSize(32);
  fill(255);
  text("Number of users = " + howMany, textPosition, 50);  
  
  if(visibleUser) {
  textSize(32);
  fill(175, 200, 255);
  text("Someone is in front of the Kinect", textPosition, 100);
  } else {
    textSize(32);
    fill(255, 100, 0);
    text("Nobody is in front of the Kinect...", textPosition, 100);
    }
  }
}
