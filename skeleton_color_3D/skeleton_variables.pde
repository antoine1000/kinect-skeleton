
int spine_base = KinectPV2.JointType_SpineBase;
int spine_mid = KinectPV2.JointType_SpineMid;

int neck = KinectPV2.JointType_Neck;
int head = KinectPV2.JointType_Head;

int shoulder_left = KinectPV2.JointType_ShoulderLeft;
int elbow_left = KinectPV2.JointType_ElbowLeft;
int wrist_left = KinectPV2.JointType_WristLeft;
int hand_left = KinectPV2.JointType_HandLeft;

int shoulder_right = KinectPV2.JointType_ShoulderRight;
int elbow_right = KinectPV2.JointType_ElbowRight;
int wrist_right = KinectPV2.JointType_WristRight;
int hand_right = KinectPV2.JointType_HandRight;

int hip_left = KinectPV2.JointType_HipLeft;
int knee_left = KinectPV2.JointType_KneeLeft;
int ankle_left = KinectPV2.JointType_AnkleLeft;
int foot_left = KinectPV2.JointType_FootLeft;

int hip_right = KinectPV2.JointType_HipRight;
int knee_right = KinectPV2.JointType_KneeRight;
int ankle_right = KinectPV2.JointType_AnkleRight;
int foot_right = KinectPV2.JointType_FootRight;

int spine_shoulder = KinectPV2.JointType_SpineShoulder;
int hand_tip_left = KinectPV2.JointType_HandTipLeft;
int thumb_left = KinectPV2.JointType_ThumbLeft;
int hand_tip_right = KinectPV2.JointType_HandTipRight;
int thumb_right = KinectPV2.JointType_ThumbRight;


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