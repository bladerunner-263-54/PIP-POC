with(obj_objectives) {
	if(type_0 == argument0)
	{
		amount_0 += -1;
	}

	if(type_1 == argument0)
	{
		amount_1 += -1;
	}

	if(type_2 == argument0)
	{
		amount_2 += -1;
	}

	if(amount_0 <= 0 && amount_1 <= 0 && amount_2 <= 0)
	{
		var _game_over = instance_exists(obj_game_over_win);
		if(!_game_over)
		{
			// Create the Sequence which shows a window telling the user they have completed the level.
			if(room != rm_level_3)
			{
				
				if (global.score_total >= global.score_target){
					layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_pontuacao_alta);
				} else if (global.score_total >= global.score_target *0.5 ){
					layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_pontuacao_media);
				}else if (global.score_total > 0){
					layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_pontuacao_baixa);
				}
			}
			else
			{
				layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_fim_mvp);
			}
		}
	}
}