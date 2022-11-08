"Homework 11-8-2022" by Radha



The player is in the Nether Fortress.

The timeToEscape is a number variable. The timeToEscape is 20.

Every turn:
	say "There [if timeToEscape is 1]is[else]are[end if] [timeToEscape] minutes to escape!";

Every turn when the player is carrying the Chest Key:	now the timeToEscape is timeToEscape - 1;
			
Every turn when timeToEscape is less than 0:
	say "You didn't make it to the portal. The curse of the golden key consumes you!";
	end the story;
	
Every turn when the player is in the Overworld:
	say "You made it through the portal to the Overworld. You are safe... for now.";
	end the story;

[ROOMS AND LAYOUT]

The Nether Fortress is a room. 

The Bastion is a room.

The Bastion is north of the Nether Fortress.

The Overworld is a room.

The Nether Portal is a locked door. The Nether Portal is east of the Nether Fortress and west of the Overworld.

[Nether Fortress]

The description of the Nether Fortress is "The Nether Fortress is hot. There are  dead Blazes and Wither Skeletons on the floor. There is a Chest in front of you. There is a Bastion in the north of you. Your portal needs a Fire Charge.[if timeToEscape is less than 8]TIME IS RUNNING OUT![end if]"

The Wither Skeleton Corpse is a thing. It is in the Nether Fortress.
 



The Wither Skull is a thing. It is in the Wither Skeleton Corpse. It unlocks the Unfinished Wither.

The Blaze Corpse is a thing. It is in the Nether Fortress.

The Blaze Rod is a thing. It is in the Blaze Corpse. 

The Chest Key is a thing. It unlocks the Nether Fortress Chest.

The Nether Fortress Chest is a locked container in the Nether Fortress.

The Fire Charge is a thing. The Fire Charge is inside the Nether Fortress chest. It unlocks the Nether Portal.

[bastion]

The Bastion is dark.

Every turn when the Bastion is dark and the player is in the Bastion:
		say "You see a faint glow coming from a redstone torch.".

The description of the Bastion is "There is a strange redstone contraption in the Bastion. If you use the Wither skull on the Unfinished Wither, you may get something important!"



Before opening the Unfinished Wither when the portal is locked:
	say "The portal is locked you fool!";
	
[LIVING ROOM - LIGHT SWITCH]
The Redstone Torch  is a switched off device in the Bastion. It is fixed in place.

Carry out switching off the Redstone Torch: 
	now the Bastion is dark.

Carry out switching on the Redstone Torch: 
	now the Bastion is lighted.
	
After deciding the scope of the player when the location is the Bastion:
	place the Redstone Torch in scope.
	
Understand "flip [something switched off]" as switching on. Understand "flip [something switched on]" as switching off. Understand "flip [something]" as switching on.

[LIVING ROOM - HAPPY CLOWN]

The Unfinished Wither is a locked container. It is in the Bastion.

Instead of unlocking the Unfinished Wither with the Wither Skull:
		say "The Wither activates. Destruction quickly awaits the nether. A Chest Key is dropped for you to pick up";
		say "Use the Fire Charge to unlock the Nether Portal and escape!";
		now the timeToEscape is 8;
		now the player is carrying the Chest Key.


[TESTS]
Test win with "take Wither Skull / go north / turn on restone torch / unlock Unfinished Wither with Wither Skull/ go south/ unlock Nether Fortress Chest with Chest Key/ Open Nether Fortress/ Open Portal with Fire Charge/Enter nether Portal".