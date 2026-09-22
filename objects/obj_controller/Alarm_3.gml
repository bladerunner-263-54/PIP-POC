// Apply the following code to obj_playfield_parent
with(obj_playfield_parent) 
{
	// Call User Event 0 of obj_playfield_parent, which
	// re-populates empty squares with matching pieces
	event_user(0);
}

// Set alarm 1 of this object, obj_controller, to 15 frames.
// When the alarm is triggered the player will be free to take
// their next turn.
alarm_set(1, 15);