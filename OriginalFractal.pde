float x=0, y=0;
int step=10;
void setup(){
	size(800, 800);
	strokeWeight(3);
}
void draw(){
	background(255);
	dragon(0, 0, 20);

}
void dragon(int x, int y, int len){
	if(len<2) go("LEFT");
	else{
		dragon(x, y, len-1);
	}
}
void go(String dir){
	switch(dir){
		case "LEFT":
			line(x, y, x+step, y);
			x+=step;
			break;
		case "RIGHT":
			line(x, y, x-step, y);
			x-=step;
			break;
		case "UP":
			line(x, y, x, y-step);
			y-=step;
			break;
		case "DOWN":
			line(x, y, x, y+step);
			y+=step;
			break;
	}
}