/* *-*-*-*-*-* DEBUGGING INFORMATIONS *-*-*-*-*-* 

* Display all informations you need in order to try and debug your code

*/
 
void displayInfo(boolean active) {

  if(active == true) {

/* * Display the depth image (great for debugging purpose, but the image is mirrored!)
 * (except if you set.mirror(true), but the skeleton will be mirrored instead!)
*/
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

void displaySuccess(boolean active) {
if(active == true) {
  textSize(32);
  fill(0, 255, 0);
  text("Tracking successful !", textPosition, 150);
  }
}

void displayError(boolean active) {
if(active == true) {
  textSize(32);
  fill(255, 0, 0);
  text("Nobody is tracked...", textPosition, 150);
  }
}
