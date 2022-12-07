let things = [];
let resetCount = 0;
let n;

function setup() {
	createCanvas(windowWidth, windowHeight);
	background(100);

	noStroke();
	colorMode(HSB);

	// Add 100 thing objects into an array
	for (let i = 0; i < 10000; i = i + 1) {
		let x = i * 5;
		let y = 20;
		let s = random(25, 40);
		things[i] = createThing(x, y, s);
	}
}

function draw() {
	background("purple");

	// Loop through each thing object in the array and call the updateThing function.
	// This function will update the inner variables of each thing object and draw it.
	for (let i = 0; i < things.length; i = i + 1) {
		updateThing(things[i]);
	}
	resetCount++;
}

// This function is where we define what variables each thing has inside of it. Note
// how this function returns the thing object it creates. In the setup function we store
// each returned thing object in a spot in the things array.
function createThing(x, y, size) {
	let thing = {};
	thing.x = x;
	thing.y = y;
	thing.size = size
	thing.velX = random(-10, 10);
	thing.velY = random(-10, 10);
	thing.sizeVel = random(-.1, .1);
	thing.hue = random(0, 360);
	return thing;
}

// This function is called in draw for each of the thing objects in the things array.
// It updates various values, and draws the thing on the canvas. The ways that we are
// updating the thing object (t) should be familiar as we were doing this for individual
// objects using variables in the past.
function updateThing(t) {
	t.x = t.x + t.velX;
	t.y = t.y + t.velY;
	if (t.x > width || t.x < 0) {
		t.velX = t.velX * -1;
	}
	if (t.y > height || t.y < 0) {
		things.splice(t, 1);
		n = things.length;
		things = append(things, createThing(width / 2, height / 2, (t.size / 2)));
		t.velY = t.velY * -1;
	}
	fill(t.hue, 30, 70);
	ellipse(t.x, t.y, t.size, t.size);
	if (things.length <= 0) {
		resetThings();
	}


}

function splitThing(t) {
	things.splice(things.length - 1, 1, createThing(t.x, t.y, t.size / 2));


}

function resetThings() {
	things = [];
	for (let i = 0; i < 100; i = i + 1) {
		let x = i * 20;
		let y = random(25, height);
		let s = random(25, 40);
		things[i] = createThing(x, y, s);
		resetCount = 0;

	}



}