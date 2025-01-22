/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR torches = 0
VAR pet_name = ""
VAR base_torches = 3
VAR swimmer = ""

-> memory

== memory ==
Before you stands the grand cavern. You wish your childhood pet was with you now. The cave might be less intimidating if they were here. What was their name again?

* [Charlie]
    ~ pet_name = "Charlie"
    -> question
* [Susan]
    ~ pet_name = "Susan"
    -> question
* [Sparky]
    ~ pet_name = "Sparky"
    -> question
    
== question ==
Were you ever a swimmer?
* [Yes]
    ~ swimmer = "Y"
    -> cave_mouth
* [No]
    ~ swimmer = "N"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {base_torches > 0: There are {base_torches} torches on the floor} The cave extends to the east and west.

You made it in the cave. If only {pet_name} could see you now!

You currently have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
+ {base_torches > 0} [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west, it's way too dark to see anything.
{pet_name == "Sparky": Sparky would've loved the west}
+ {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel_lit ==
~ torches = torches - 1
The west tunnel lights up to reveal a small pond in the cave. {swimmer == "Y": It might be refreshing to take a dip}
* {swimmer == "Y"} [Go for a swim] -> swim
+ [Go Back] -> cave_mouth

== swim ==
The water is cool but very tranquil, you might stay here for a while.
-> END

=== torch_pickup ===
~ torches = torches + 1
~ base_torches = base_torches - 1
You now have a torch. May it light the way.
+ [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
~ torches = torches - 1
The light of your torch glints off of the thousands of coins in the room.
+ [Stay here]
-> END