let targetX = 300;
let targetY = 200;
let targetSpeed = 3
let targetDirectionX = 1
let targetDirectionY = 1
let score = 0;
var star = [];
let boom = 0
let boomX = 0
let boomY = 0
let boomSpeed = .2
	


function setup() {
	createCanvas(windowWidth, windowHeight);
	angleMode(DEGREES);
	for (var i = 0; i < 50; i++)
  {
    star[i] = new Stars();
  }

}

function draw() {
	// Clear the background
	background(0);
	
	// Move the target
	fill("black");
		for (var i = 0; i < 50; i++)
  {
    star[i].animate();
    star[i].star();
  }
	

	targetX = targetX + targetSpeed*targetDirectionX;
	targetY = targetY + targetSpeed*targetDirectionY;
	// if(targetX > width - 50){
	// 	targetDirectionX= -1}
	// if(targetY > height - 50){
	// 	targetDirectionY= -1}
	// if(targetX <  50){
	// 	targetDirectionX= 1}
	// if(targetY < 50){
	// 	targetDirectionY= 1}
	//let v1 = vector(
	
	//Targeting computer
	

	push();
	// Draw the target
	strokeWeight(0);
	
	rotate(30*(((width/2)-targetX)/(width/2)));
	
	if(targetX > width - 50){
		targetDirectionX= -1}
	if(targetY > height - 50){
		targetDirectionY= -1}
	if(targetX <  50){
		targetDirectionX= 1}
	if(targetY < 50){
		targetDirectionY= 1}
	//explosion
	if(boom > 4){
		fill("red");
		circle(boomX, boomY, 100);
		boom-=boomSpeed;}
	else if(boom/1 > 3){
		fill("orange");
		circle(boomX-20, boomY-20, 50);
		circle(boomX+20, boomY+20, 50);
		boom-=boomSpeed;}
	else if(boom > 2){
		fill("orange");
		circle(boomX+20, boomY-20, 50);
		circle(boomX-20, boomY+20, 50);
		boom-=boomSpeed;}
	else if(boom > 1){
		fill("red");
		circle(boomX-20, boomY-20, 50);
		circle(boomX-20, boomY-20, 50);
		boom-=boomSpeed;}
	else if(boom> 0){
		fill("red");
		circle(boomX, boomY, 100);
		boom-=boomSpeed;}
	
	
	
		
	
	fill("grey");
	ellipse(targetX, targetY, 100, 100);
	fill("black");
	ellipse(targetX, targetY, 80, 80);
	fill("grey");
	stroke("grey");
	strokeWeight(4);
	line(targetX, targetY-40, targetX, targetY+40);
	line(targetX-40, targetY, targetX+40, targetY);
	line(targetX-24, targetY-32, targetX+24, targetY+32)
	line(targetX-24, targetY+32, targetX+24, targetY-32)
	fill("black");
	ellipse(targetX, targetY, 30, 30);
	fill("grey");
	strokeWeight(10);
	line(targetX-50, targetY,targetX-90, targetY); 
	line(targetX+50, targetY,targetX+90, targetY);
	strokeWeight(3);
	line(targetX-90, targetY-55,targetX-90, targetY+55);
	line(targetX+90, targetY-55,targetX+90, targetY+55);
	
	pop();
	rotate(0)
	rectMode(CENTER);
	strokeWeight(3);
	stroke("red");
	noFill();
	circle(mouseX, mouseY, 120);
	line(mouseX+20, mouseY, mouseX+60, mouseY);
	line(mouseX-20, mouseY, mouseX-60, mouseY);
	line(mouseX, mouseY+20, mouseX, mouseY+60);
	line(mouseX, mouseY-20, mouseX, mouseY-60);

	// Draw the score on the screen
	rotate(0);
	fill(62, 255, 48);
	strokeWeight(0);
	textSize(40);
	textFont("Verdana");
	text(score, 100, 100);
}

function mousePressed() {
	// Use the dist function to compute the distance from the mouse
	// to the center of the target (the ellipse we draw in draw)
	// After this, the variable 'd' contains that numerical distance.
	let d = dist(targetX, targetY, mouseX, mouseY);
	
	// If the distance from the mouse to the center of the target is less
	// than half the diameter of the circle, increment the score variable
	// and reposition the target to a random position.
	if (d < 80) {
		score = score + 1;
		boomX = targetX;
		boomY = targetY;
		targetX = random(0, width);
		targetY = random(-50, 0);
		targetSpeed += .5;
		boom = 5
		
		
	}
}
function Stars() {
	this.x = random(windowWidth);
	this.y = random(windowHeight);
	this.size = random(3,6)
	
	this.star = function() {
		fill(255, 255, 255);
		noStroke();
		circle(this.x, this.y, this.size);
	}
	
		this.animate = function() {
		this.y += random(5, 20);
	
		if (this.y > height) {
    		this.y = 0;
  	}}
}