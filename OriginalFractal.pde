float x=0, y=0;
int step=10;
ArrayList<String> o1 = new ArrayList(String);
ArrayList<String> f1 = new ArrayList(String);

void setup(){
	size(800, 800);
	strokeWeight(3);
}
void draw(){
	background(255);
	drawDragon(o1, f1);
}
void dragon(int len){
	if(len == 0)   //do something
	else //do something else
}

//allows for each layer of dragon to increment itself
void O1andF1toO2(ArrayList O1, ArrayList F1){
	ArrayList<String> temp;
	for(String s:F1)
		temp.add(reverseDir(s));
	for(String s:O1)
		temp.add(s);
	o1 = temp;
}

//also creates F1 based on O1
ArrayList rotateDir(ArrayList O1){
	ArrayList<String> temp = new ArrayList(String);
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

void drawDragon(ArrayList o1, ArrayList f1){
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