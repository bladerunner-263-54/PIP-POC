var _no_matches = function()
{
	// Apply the following code to all instances of obj_matching_piece
	with(obj_matching_piece) {
		// Create an instance of obj_effect_game_won at the current
		// position. This is the object that looks like a regular piece
		// but is "falling" from the board (It doesn't mean the player has
		// actually won).
		var _effect_piece = instance_create_layer(x + 0, y + 0, "Pieces", obj_effect_game_won);
	
		// Set the image_index of the falling piece to match that of 
		// the current piece so they will have the same appearance.
		_effect_piece.image_index = image_index;
	
		// Destroy the instances of obj_matching_piece
		instance_destroy();
	}

	// Apply the following code to obj_controller
	with(obj_controller) 
	{
		// Set Alarm[3] to 0.
		// Alarm[3] repopulates the board with pieces.
		alarm_set(3, 60);
	}

	// Destroy the message
	instance_destroy();

	with(obj_no_valid_matches_title) {
		// Destroy the message
		instance_destroy();
	}	
}

var _ts_no_matches = time_source_create(time_source_game, 180, time_source_units_frames, _no_matches);

time_source_start(_ts_no_matches);