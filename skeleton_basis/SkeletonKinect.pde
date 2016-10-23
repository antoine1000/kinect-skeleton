/* *-*-*-*-*-* SkeletonKinect *-*-*-*-*-* */
// A SimpleOpenNI Class Extension
// Gather all my custom drawing functions in a class extension of SimpleOpenNI
// Why ? --> cleaner and more intuitive for using in future new sketches

private class SkeletonKinect extends SimpleOpenNI{
	PApplet parent;
	SkeletonKinect(PApplet parent){
		super(parent);
		this.parent = parent;
		if(!this.isInit()){
			println("no kinect found");
			exit();
		}
		// this.setMirror(true);
		// this.enableDepth();
		// this.alternativeViewPointDepthToImage();
		// this.setDepthColorSyncEnabled(true);
	}

//------------------------------
/*
	Basic Methods
*/



}