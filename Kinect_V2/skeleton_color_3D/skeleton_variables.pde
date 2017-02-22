// Create constants variables for easier usage of joints

// * Skeleton joints

// Base
int SPINE_BASE = KinectPV2.JointType_SpineBase; // #0
int SPINE_MID = KinectPV2.JointType_SpineMid; // #1

// Head
int NECK = KinectPV2.JointType_Neck; // #2
int HEAD = KinectPV2.JointType_Head; // #3

// Left arm
int SHOULDER_LEFT = KinectPV2.JointType_ShoulderLeft; // #4
int ELBOW_LEFT = KinectPV2.JointType_ElbowLeft; // #5
int WRIST_LEFT = KinectPV2.JointType_WristLeft; // #6
int HAND_LEFT = KinectPV2.JointType_HandLeft; // #7

// Right arm
int SHOULDER_RIGHT = KinectPV2.JointType_ShoulderRight; // #8
int ELBOW_RIGHT = KinectPV2.JointType_ElbowRight; // #9
int WRIST_RIGHT = KinectPV2.JointType_WristRight; // #10
int HAND_RIGHT = KinectPV2.JointType_HandRight; // #11

// Left leg
int HIP_LEFT = KinectPV2.JointType_HipLeft; // #12
int KNEE_LEFT = KinectPV2.JointType_KneeLeft; // #13
int ANKLE_LEFT = KinectPV2.JointType_AnkleLeft; // #14
int FOOT_LEFT = KinectPV2.JointType_FootLeft; // #15

// Right Leg
int HIP_RIGHT = KinectPV2.JointType_HipRight; // #16
int KNEE_RIGHT = KinectPV2.JointType_KneeRight; // #17
int ANKLE_RIGHT = KinectPV2.JointType_AnkleRight; // #18
int FOOT_RIGHT = KinectPV2.JointType_FootRight; // #19

// Bonus
int SPINE_SHOULDER = KinectPV2.JointType_SpineShoulder; // #20

// Left Hand details
int HAND_TIP_LEFT = KinectPV2.JointType_HandTipLeft; // #21
int THUMB_LEFT = KinectPV2.JointType_ThumbLeft; // #22

// Right Hand details
int HAND_TIP_RIGHT = KinectPV2.JointType_HandTipRight; // #23
int THUMB_RIGHT = KinectPV2.JointType_ThumbRight; // #24

// * Skeleton tracking state
int SKELETON_NOT_TRACKED = KinectPV2.TrackingState_NotTracked; // 0
int SKELETON_INFERRED = KinectPV2.TrackingState_Inferred; // 1
int SKELETON_TRACKED = KinectPV2.TrackingState_Tracked; // 2

// * Handstate
int HAND_UNKNOWN = KinectPV2.HandState_Unknown; // 0
int HAND_NOT_TRACKED = KinectPV2.HandState_NotTracked; // 1
int HAND_OPEN = KinectPV2.HandState_Open; // 2
int HAND_CLOSED = KinectPV2.HandState_Closed; // 3
int HAND_LASSO = KinectPV2.HandState_Lasso; // 4
