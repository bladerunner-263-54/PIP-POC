// To make smooth animations later on we are setting up a variable called target_x.
// The object will always approach this position in the step event.
target_x = x;

// As above, we also need to set a target_y variable.
// target_x and target_y start at the same values as the
// object's x and y positions in the room.
target_y = y;

// This variable tells the object if it's currently part of
// a matching set. It will be updated and reset each time
// a player makes a move.
currently_matched = 0;

// This variable keeps track of whether or not the object
// fell into an empty space this turn. We keep track of this
// so we can check for matches and the player can build combos
// when falling blocks also make groups of three.
fell_this_turn = 0;

// Created a variable to store the id of a piece which swaps
// with this one. The variable starts with the value "noone"
// which is a keyword in GameMaker that will never match
// a real instance's id.
swap_parent = noone;

// We are using the same sprite for all matching pieces,
// but using different subimages. We set the 
// animation speed to 0 to stop the object from cycling
// through each image.
image_speed = 0;

// Set the available piece types depending on the room.
switch(room)
{
	case rm_level_1:
		image_index = floor(random_range(0, 6));
		break;

	case rm_level_2:
		image_index = floor(random_range(0, 7));
		break;

	case rm_level_3:
		image_index = floor(random_range(0, 8));
		break;
}

// Set the instance alpha to 0, we will gradually increase it
// in the step event.
image_alpha = 0;

// Create a variable called draw_squish.
// We use this to draw the effect of the pieces "squishing" when
// they fall into place.
draw_squish = 1;

// Create a variable called draw_squish_target.
// We use this to draw the effect of the pieces "squishing" when
// they fall into place.
draw_squish_target = 1;

// Create a random number and assign it to a temporary variable
// called _y_offset_randomiser. We will multiply this by -10
// in the next action and assign it to the variable draw_y_offset.
// Adding this random element to the y offset will make the
// pieces appear to fall into place more naturally.
var _y_offset_randomiser = floor(random_range(1, 10 + 1));

// Create a variable called draw_y_offset.
// We use this to offset the y at which the object is drawn when it
// is first created.
draw_y_offset = -10*_y_offset_randomiser;

// See scripts >> check_on_startup
// This function checks to see if this piece would create
// a line of three at the start of the game, and if so it
// changes the type of piece until it will no longer create a match.
// NOTE: This script would permanently freeze the game if
// you were using too few types of matching pieces.
check_on_startup();

check_for_matches = function()
{
	// When triggered we call user event 0
	// which checks for matches.
	// They take place in a user event because they 
	// are sometimes called from obj_controller.
	event_user(0);	
}