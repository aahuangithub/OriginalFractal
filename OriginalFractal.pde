float x,y;
float step=30;
int q = 0;
boolean t = false;
//preload the direction set in setup so that draw doesnt take too long
ArrayList<Character> n=new ArrayList<Character>();

void setup(){
	size(800, 900);
	strokeWeight(5);
	fill(0);
	textAlign(CENTER);
	textSize(20);

	//set where the fractal starts at
	x=width/2;
	y=height/2;

	text("Loading... \nIt might take a while...", width/2, height/2);
	
	//preload direction set to draw
    n=dragon(q);
}

void draw(){
	background(250);
	n=dragon(q);
	drawDragon(n);
	text(q+" recursions",100, 100);
	if(t && frameCount%15==0) q++;
}
void mousePressed(){
	//step++;
	//n=dragon(17);
	t=true;
	x=width/2;
	y=height/2;
}
void keyPressed(){
	step=1;
	n=dragon(17);
}	
ArrayList<Character> dragon(int len){
	if(len <= 0){   
	    ArrayList<Character> temp = new ArrayList<Character>();
	    temp.add('L');
	    return temp;
  	}
	else
    	return O1andF1toO2(createF1(dragon(len-1)));
}

//allows for each layer of dragon to increment itself
ArrayList<Character> O1andF1toO2(ArrayList<Character> O1){
	ArrayList<Character> temp = new ArrayList<Character>();
	for(Character s:createF1(O1))
		temp.add(reverseDir(s));
	for(Character s:O1)
		temp.add(s);
	return temp;
}

//also creates F1 based on O1
ArrayList<Character> createF1(ArrayList<Character> O1){
	ArrayList<Character> temp = new ArrayList<Character>();
	for(Character s:O1){
		if (s==('R')) temp.add('D');
		if (s==('L')) temp.add('U');
		if (s==('U')) temp.add('R');
		if (s==('D')) temp.add('L');
	}
	return temp;
}

//draws fractal based on direction array
void go(Character dir){
	switch(dir){
		case 'L':
			line(x, y, x+step, y);
			x+=step;
			break;
		case 'R':
			line(x, y, x-step, y);
			x-=step;
			break;
		case 'U':
			line(x, y, x, y-step);
			y-=step;
			break;
		case 'D':
			line(x, y, x, y+step);
			y+=step;
			break;
	}
}
void drawDragon(ArrayList<Character> o1){
	float origX=x, origY=y;
	for(Character dir:o1)
		go(dir);
	x=origX;
	y=origY;
}

//accessory for O1andF1toO2
Character reverseDir(Character dir){
	switch(dir){
		case 'L': return 'R';
		case 'R': return 'L';
		case 'U': return 'D';
		case 'D': return 'U';
	}
	return ' ';
}