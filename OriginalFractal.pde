float x=0, y=0;
int step=10;

void setup(){
	size(800, 800);
	strokeWeight(3);
}
void draw(){
	background(255);
	drawDragon(dragon(20), rotateDir(dragon(20)));
}
ArrayList<String> dragon(int len){
	if(len == 0){   
    ArrayList<String> temp = new ArrayList<String>();
    temp.add("LEFT");
    return temp;
  }
	else{
    return dragon(len-1);
  }
}

//allows for each layer of dragon to increment itself
ArrayList<String> O1andF1toO2(ArrayList<String> O1, ArrayList<String> F1){
	ArrayList<String> temp = new ArrayList<String>();
	for(String s:F1)
		temp.add(reverseDir(s));
	for(String s:O1)
		temp.add(s);
	return temp;
}

//also creates F1 based on O1
ArrayList<String> rotateDir(ArrayList<String> O1){
	ArrayList<String> temp = new ArrayList<String>();
	for(String s:O1){
		if (s.equals("LEFT")) {temp.add("UP");}
		if (s.equals("LEFT")) {temp.add("DOWN");}
		if (s.equals("LEFT")) {temp.add("RIGHT");}
		if (s.equals("LEFT")) {temp.add("LEFT");}
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

void drawDragon(ArrayList<String> o1, ArrayList<String> f1){
  //I could probably make it so this function finds f1 by itself...
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