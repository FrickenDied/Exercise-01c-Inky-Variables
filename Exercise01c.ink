/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR score = 0
VAR pet_name = ""
VAR torches = 0
VAR food = 0

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west. If only {pet_name} could see you now!
You have {torches} torches



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== cave_mouth_lit ==
Torch in hand, you can either trek to the east tunnel or the west tunnel.
+ [Go East] -> east_tunnel_lit
+ [Go West] -> west_tunnel_lit

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. It is very dark, you can't see anything.
{pet_name == "Spot":Spot would love it here in the west.}
{torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel_lit ==
The light of the torch reveals 2 paths stretching off to the north and the south.
+ [Go North] -> north_tunnel
+ [Go South] -> south_tunnel
+ [Go Back] -> cave_mouth_lit

== north_tunnel ==
{food == 1: You took the sandwich. You now have {food} food.} The room is small. {food != 1: In the center rests a sandwich.}
* [Take Sandwich]
    ~ food = food + 1
    -> north_tunnel
+ [Go Back] -> west_tunnel_lit

== south_tunnel ==
{score != 50:There is a golden nugget lying in the center of this room.} This is a bland and uninteresting room.
* [Take Golden Nugget]
    ~ score = score + 50
    -> south_tunnel
+ [Go Back] -> west_tunnel_lit
    
=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
* {pet_name == "Susan"} [Leave Fortune Behind] -> Greedless
-> END

== Greedless ==
While looking at the vast array of gold, you end up drifting into thought about Susan, and before you knew it. You had decided to leave the fortune behind.
-> END