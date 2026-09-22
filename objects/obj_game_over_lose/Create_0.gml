// Stop the game music from playing.
audio_stop_sound(snd_music_game);

// Play a music effect for losing the game.
audio_play_sound(snd_game_lose, 0, 0, 1.0, undefined, 1.0);