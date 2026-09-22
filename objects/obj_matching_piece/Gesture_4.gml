// Check if player is in any kind of menu and ends event if it is
if((instance_exists(obj_game_pause)) || (instance_exists(obj_game_over_lose)) || (instance_exists(obj_game_over_win)) || (instance_exists(obj_no_valid_matches)))
exit;

// Check if the player is allowed to swap the pieces.
// They are not allowed while the game is calculating
// the result of their previous move, for example.
if(global.can_swap == 1)
{
	// The "Drag End" event generates a map containing information
	// about the "Drag" gesture the user just made on this
	// object.
	// Here we assign "viewstartposX", the starting X position of the
	// drag gesture, to a temporary variable _touch_start_x to use later.
	var _touch_start_x = ds_map_find_value(event_data, "viewstartposX");

	// Here we assign "posX", the ending X position of the
	// drag gesture, to a temporary variable _touch_end_x to use later
	var _touch_end_x = ds_map_find_value(event_data, "posX");

	// Here we assign "viewstartposY", the starting Y position of the
	// drag gesture, to a temporary variable _touch_start_y to use later
	var _touch_start_y = ds_map_find_value(event_data, "viewstartposY");

	// Here we assign "posY", the ending Y position of the
	// drag gesture, to a temporary variable _touch_end_y to use later
	var _touch_end_y = ds_map_find_value(event_data, "posY");

	// Here we calculate the difference between the starting X position
	// and ending X position of the drag gesture to tell us if the player
	// dragged the matching piece horizontally, and in which direction.
	// We assign this value to a temporary variable called _drag_horiztonal
	var _drag_horiztonal = _touch_end_x-_touch_start_x;

	// Here we calculate the difference between the starting Y position
	// and ending Y position of the drag gesture to tell us if the player
	// dragged the matching piece vertically, and in which direction.
	// We assign this value to a temporary variable called _drag_vertical
	var _drag_vertical = _touch_end_y-_touch_start_y;

	// The player dragged this matching piece one square to the right
	if(_drag_horiztonal > sprite_width / 2)
	{
		// Check if there is a piece on the playfield
		// one square to the right of the piece currently
		// being dragged.
		// If yes, assign the id of the piece we want to
		// swap with to a temporary variable called
		// _piece_to_swap.
		var _piece_to_swap = collision_point(x + sprite_width, y, obj_matching_piece, true, 1);
		if((_piece_to_swap))
		{
			// Play a sound effect indicating that the
			// pieces are being swapped.
			audio_play_sound(snd_piece_swap, 0, 0);
		
			// Set the current piece to move to the right
			// by updating the target_x variable which
			// the piece will approach in the step event
			target_x += sprite_width;
		
			// Tell the piece we're swapping with to move
			// to the left by updating the target_x variable which
			// the piece will approach in its step event
			_piece_to_swap.target_x -= _piece_to_swap.sprite_width;
		
			// Tell the piece we're swapping with which piece
			// forced it to swap by changing its swap_parent
			// variable to the id of this instance
			_piece_to_swap.swap_parent = id;
		
			// For this piece, set the variable swap_parent to the id
			// of the _piece_to_swap so that we can use it later
			swap_parent = _piece_to_swap;
		
			// The player performed a valid move and the game will
			// now need to calculate the result of that move before
			// we let the player move again.
			// Here we set the global variable can_swap to 0.
			global.can_swap = 0;
		
			// Wait 15 steps for the current move to animate before
			// checking for matches. If you change the speed at which
			// the pieces move in the step event, you will also need
			// to change this value.
			var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
			time_source_start(_ts_check_for_matches);
		
			// Apply the following code to the _piece_to_swap
			with(_piece_to_swap) 
			{
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
			}
		
			// Since we have already started processing a valid move, exit the
			// current event so that no more drags are processed.
			exit;
		}
	}

	// The player dragged this matching piece one square to the left
	if(_drag_horiztonal < -sprite_width / 2)
	{
		// Check if there is a piece on the playfield
		// one square to the left of the piece currently
		// being dragged.
		// If yes, assign the id of the piece we want to
		// swap with to a temporary variable called
		// _piece_to_swap.
		var _piece_to_swap = collision_point(x - sprite_width, y, obj_matching_piece, true, 1);
		if((_piece_to_swap))
		{
			// Play a sound effect indicating that the
			// pieces are being swapped.
			audio_play_sound(snd_piece_swap, 0, 0);
		
			// Set the current piece to move to the left
			// by updating the target_x variable which
			// the piece will approach in the step event
			target_x -= sprite_width;
		
			// Tell the piece we're swapping with to move
			// to the right by updating the target_x variable which
			// the piece will approach in its step event
			_piece_to_swap.target_x += _piece_to_swap.sprite_width;
		
			// Tell the piece we're swapping with which piece
			// forced it to swap by changing its swap_parent
			// variable to the id of this instance
			_piece_to_swap.swap_parent = id;
		
			// For this piece, set the variable swap_parent to the id
			// of the _piece_to_swap so that we can use it later
			swap_parent = _piece_to_swap;
		
			// The player performed a valid move and the game will
			// now need to calculate the result of that move before
			// we let the player move again.
			// Here we set the global variable can_swap to 0.
			global.can_swap = 0;
		
			// Wait 15 steps for the current move to animate before
			// checking for matches. If you change the speed at which
			// the pieces move in the step event, you will also need
			// to change this value.
			var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
			time_source_start(_ts_check_for_matches);
		
			// Apply the following code to the _piece_to_swap
			with(_piece_to_swap) 
			{
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
			}
		
			// Since we have already started processing a valid move, exit the
			// current event so that no more drags are processed.
			exit;
		}
	}

	// The player dragged this matching piece one square downwards
	if(_drag_vertical > sprite_height / 2)
	{
		// Check if there is a piece on the playfield
		// one square below the piece currently
		// being dragged.
		// If yes, assign the id of the piece we want to
		// swap with to a temporary variable called
		// _piece_to_swap.
		var _piece_to_swap = collision_point(x, y + sprite_height, obj_matching_piece, true, 1);
		if((_piece_to_swap))
		{
			// Play a sound effect indicating that the
			// pieces are being swapped.
			audio_play_sound(snd_piece_swap, 0, 0, 1.0, undefined, 1.0);
		
			// Set the current piece to move downwards
			// by updating the target_y variable which
			// the piece will approach in the step event
			target_y += sprite_height;
		
			// Tell the piece we're swapping with to move
			// upwards by updating the target_y variable which
			// the piece will approach in its step event
			_piece_to_swap.target_y -= _piece_to_swap.sprite_height;
		
			// Tell the piece we're swapping with which piece
			// forced it to swap by changing its swap_parent
			// variable to the id of this instance
			_piece_to_swap.swap_parent = id;
		
			// For this piece, set the variable swap_parent to the id
			// of the _piece_to_swap so that we can use it later
			swap_parent = _piece_to_swap;
		
			// The player performed a valid move and the game will
			// now need to calculate the result of that move before
			// we let the player move again.
			// Here we set the global variable can_swap to 0.
			global.can_swap = 0;
		
			// Wait 15 steps for the current move to animate before
			// checking for matches. If you change the speed at which
			// the pieces move in the step event, you will also need
			// to change this value.
			var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
			time_source_start(_ts_check_for_matches);
		
			// Apply the following code to the _piece_to_swap
			with(_piece_to_swap) 
			{
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
			}
		
			// Since we have already started processing a valid move, exit the
			// current event so that no more drags are processed.
			exit;
		}
	}

	// The player dragged this matching piece one square upwards
	if(_drag_vertical < -sprite_height / 2)
	{
		// Check if there is a piece on the playfield
		// one square above the piece currently
		// being dragged.
		// If yes, assign the id of the piece we want to
		// swap with to a temporary variable called
		// _piece_to_swap.
		var _piece_to_swap = collision_point(x, y - sprite_height, obj_matching_piece, true, 1);
		if((_piece_to_swap))
		{
			// Play a sound effect indicating that the
			// pieces are being swapped.
			audio_play_sound(snd_piece_swap, 0, 0, 1.0, undefined, 1.0);
		
			// Set the current piece to move upwards
			// by updating the target_y variable which
			// the piece will approach in the step event
			target_y -= sprite_height;
		
			// Tell the piece we're swapping with to move
			// downwards by updating the target_y variable which
			// the piece will approach in its step event
			_piece_to_swap.target_y += _piece_to_swap.sprite_height;
		
			// Tell the piece we're swapping with which piece
			// forced it to swap by changing its swap_parent
			// variable to the id of this instance
			_piece_to_swap.swap_parent = id;
		
			// For this piece, set the variable swap_parent to the id
			// of the _piece_to_swap so that we can use it later
			swap_parent = _piece_to_swap;
		
			// The player performed a valid move and the game will
			// now need to calculate the result of that move before
			// we let the player move again.
			// Here we set the global variable can_swap to 0.
			global.can_swap = 0;
		
			// Wait 15 steps for the current move to animate before
			// checking for matches. If you change the speed at which
			// the pieces move in the step event, you will also need
			// to change this value.
			var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
			time_source_start(_ts_check_for_matches);
		
			// Apply the following code to the _piece_to_swap
			with(_piece_to_swap) 
			{
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
			}
		
			// Since we have already started processing a valid move, exit the
			// current event so that no more drags are processed.
			exit;
		}
	}
}