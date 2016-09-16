//-------------- CALLBACK (check if users are calibrated) -----------------


/*---------------------------------------------------------------
When a new user is found, print new user detected along with
userID and start pose detection. Input is userID
----------------------------------------------------------------*/
void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("start tracking skeleton");

  kinect.startTrackingSkeleton(userId);
}

/*---------------------------------------------------------------
Print when user is lost. Input is int userId of user lost
----------------------------------------------------------------*/
void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
  visibleUser = false;
}

/*---------------------------------------------------------------
Called when a user is tracked.
----------------------------------------------------------------*/
void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  println("visibleUser with userID :  " + userId);
  visibleUser = true;
}
