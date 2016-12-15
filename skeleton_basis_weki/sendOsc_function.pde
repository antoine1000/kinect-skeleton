// Make these variables public for full accessiblity
float leftHandX;
float leftHandY;
float leftHandZ;

float rightHandX;
float rightHandY;
float rightHandZ;

float headX;
float headY;
float headZ;


// Sending OSC messages function
void sendOsc(int userId) {
  
  PVector leftHand = getJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
  leftHandX = leftHand.x;
  leftHandY = leftHand.y;
  leftHandZ = leftHand.z;

  PVector rightHand = getJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
  rightHandX = rightHand.x;
  rightHandY = rightHand.y;
  rightHandZ = rightHand.z;

  PVector head = getJoint(userId, SimpleOpenNI.SKEL_HEAD);
  headX = head.x;
  headY = head.y;
  headZ = head.z;



// On instancie un objet OscMessage, l'argument String "/wek/inputs" est le nom du message (par défaut sur Wekinator)
  OscMessage msg = new OscMessage(inputMessage); 

// On ajoute une ou plusieurs valeurs (inputs) au message OSC avec la fonction .add()
  msg.add((float)leftHandX); 
  msg.add((float)leftHandY);
  //msg.add((float)leftHandZ);
  msg.add((float)rightHandX);
  msg.add((float)rightHandY);
  //msg.add((float)rightHandZ);
  msg.add((float)headX);
  msg.add((float)headY);
  //msg.add((float)headZ);
  
  oscP5.send(msg, dest);
}

int TIMEOUT = 3000;
float lastTextDisplay = -TIMEOUT;


//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/cercle")==true) {
    if(millis() - lastTextDisplay <= TIMEOUT) {
        textSize(32);
        fill(255, 0, 0);
        text("Le geste = cercle", width/2, height/2); 
      }

 } else if (theOscMessage.checkAddrPattern("/clap")==true) {
     textSize(32);
     fill(255, 255, 0);
     text("Le geste = clap", width/2, height/2); 
     println("clap");
 } else if (theOscMessage.checkAddrPattern("/coucou") == true) {
     textSize(32);
     fill(0, 255, 255);
     text("Le geste = coucou", width/2, height/2); 
     println("coucou");
 } else {
    println("Unknown OSC message received");
 }
}




// Start and stop recording gesture with DTW algorithm
void startDTW(){
  OscMessage start = new OscMessage("/wekinator/control/startDtwRecording");
  start.add((int)2);
  oscP5.send(start, dest);
}

void stopDTW() {
  OscMessage stop = new OscMessage("/wekinator/control/stopDtwRecording");
  oscP5.send(stop, dest2);
}


