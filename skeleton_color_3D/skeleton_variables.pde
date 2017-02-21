// Create constants variables for easier usage of joints

// Skeleton joints
int SPINE_BASE = KinectPV2.JointType_SpineBase;
int SPINE_MID = KinectPV2.JointType_SpineMid;

int NECK = KinectPV2.JointType_Neck;
int HEAD = KinectPV2.JointType_Head;

int SHOULDER_LEFT = KinectPV2.JointType_ShoulderLeft;
int ELBOW_LEFT = KinectPV2.JointType_ElbowLeft;
int WRIST_LEFT = KinectPV2.JointType_WristLeft;
int HAND_LEFT = KinectPV2.JointType_HandLeft;

int SHOULDER_RIGHT = KinectPV2.JointType_ShoulderRight;
int ELBOW_RIGHT = KinectPV2.JointType_ElbowRight;
int WRIST_RIGHT = KinectPV2.JointType_WristRight;
int HAND_RIGHT = KinectPV2.JointType_HandRight;

int HIP_LEFT = KinectPV2.JointType_HipLeft;
int KNEE_LEFT = KinectPV2.JointType_KneeLeft;
int ANKLE_LEFT = KinectPV2.JointType_AnkleLeft;
int FOOT_LEFT = KinectPV2.JointType_FootLeft;

int HIP_RIGHT = KinectPV2.JointType_HipRight;
int KNEE_RIGHT = KinectPV2.JointType_KneeRight;
int ANKLE_RIGHT = KinectPV2.JointType_AnkleRight;
int FOOT_RIGHT = KinectPV2.JointType_FootRight;

int SPINE_SHOULDER = KinectPV2.JointType_SpineShoulder;
int HAND_TIP_LEFT = KinectPV2.JointType_HandTipLeft;
int THUMB_LEFT = KinectPV2.JointType_ThumbLeft;
int HAND_TIP_RIGHT = KinectPV2.JointType_HandTipRight;
int THUMB_RIGHT = KinectPV2.JointType_ThumbRight;

// Handstate
int HAND_UNKNOWN = KinectPV2.HandState_Unknown;
int HAND_NOT_TRACKED = KinectPV2.HandState_NotTracked;
int HAND_OPEN = KinectPV2.HandState_Open;
int HAND_CLOSED = KinectPV2.HandState_Closed;
int HAND_LASSO = KinectPV2.HandState_Lasso;


/* For Reference (from library source)

public interface SkeletonProperties extends Constants{
	public final static int JointType_SpineBase		= 0;
	public final static int JointType_SpineMid		= 1;
	public final static int JointType_Neck			= 2;
	public final static int JointType_Head			= 3;
	public final static int JointType_ShoulderLeft  = 4;
	public final static int JointType_ElbowLeft		= 5;
	public final static int JointType_WristLeft	    = 6;
	public final static int JointType_HandLeft		= 7;
	public final static int JointType_ShoulderRight	= 8;
	public final static int JointType_ElbowRight	= 9;
	public final static int JointType_WristRight	= 10;
	public final static int JointType_HandRight		= 11;
	public final static int JointType_HipLeft		= 12;
	public final static int JointType_KneeLeft		= 13;
	public final static int JointType_AnkleLeft		= 14;
	public final static int JointType_FootLeft		= 15;
	public final static int JointType_HipRight		= 16;
	public final static int JointType_KneeRight		= 17;
	public final static int JointType_AnkleRight	= 18;
	public final static int JointType_FootRight		= 19;
	public final static int JointType_SpineShoulder	= 20;
	public final static int JointType_HandTipLeft	= 21;
	public final static int JointType_ThumbLeft		= 22;
	public final static int JointType_HandTipRight	= 23;
	public final static int JointType_ThumbRight	= 24;
	public final static int JointType_Count	= ( JointType_ThumbRight + 1 );
	
	public final static int JOINTSIZE = BODY_COUNT * (JointType_Count + 1) * 9;
	
	public final static int TrackingState_NotTracked = 0;
	public final static int TrackingState_Inferred	 = 1;
	public final static int TrackingState_Tracked	 = 2;
	
	
	public final static int HandState_Unknown		= 0;
    public final static int HandState_NotTracked	= 1;
    public final static int HandState_Open			= 2;
    public final static int HandState_Closed		= 3;
    public final static int HandState_Lasso			= 4;
}




*/