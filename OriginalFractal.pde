float x=0, y=0;
int step=10;
void setup(){
	size(800, 800);
	strokeWeight(3);
}
void draw(){
	background(255);
	dragon(20);

}
String[] dragon(int len){
	if(len<1) return new String[]{"LEFT"};
	else{
		drawDragon(
			//make a function that RETURNS AN ARRAY which describes how the dragon moves from one layer to another
			O1andF1toO2(
				dragon(len-1), rotateDir(dragon(len-1))
				), 
				rotateDir(
					O1andF1toO2(
						dragon(len-1), 
						rotateDir(dragon(len-1))
					)
			)
		);
	}
	return new String[]{""};
}

//allows for each layer of dragon to increment itself
String[] O1andF1toO2(String[] O1, String[] F1){
	String[] temp  = new String[O1.length+F1.length];
	for(int i=0; i<F1.length;i++)
		temp[i]=reverseDir(F1[F1.length-i-1]);
	for(int i=0; i<O1.length; i++)
		temp[i+F1.length-1]=O1[i];
	return (temp);
}

//also creates F1 based on O1
String[] rotateDir(String[] O1){
	String[] temp = new String[O1.length];
	for(int i = 0; i<O1.length; i++){
		if ("LEFT".equals("LEFT")) {temp[i] = "UP";}
		if ("LEFT".equals("LEFT")) {temp[i] = "DOWN";}
		if ("LEFT".equals("LEFT")) {temp[i] = "RIGHT";}
		if ("LEFT".equals("LEFT")) {temp[i] = "LEFT";}
	}
	return temp;
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

void drawDragon(String[] o1, String[] f1){
	float origX=x, origY=y;
	for(String dir:o1)
		go(dir);
	x=origX;
	y=origY;
	for(String dir:f1)
		go(dir);
}

//accessory function for O1andF1toO2
String reverseDir(String dir){
	switch(dir){
		case "LEFT": return "RIGHT";
		case "RIGHT": return "LEFT";
		case "UP": return "DOWN";
		case "DOWN":  return "UP";
	}
	return "";
}