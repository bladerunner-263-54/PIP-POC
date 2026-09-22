// Start playing the music for the main menu.
audio_play_sound(snd_music_menu, 0, 1);

// The randomize action means that all random actions in the
// game - such as generating colored matching pieces - will 
// always feel truly random.
randomize();

// Set the audio volume to the last master gain to begin with. The user
// can toggle this on the menu to mute sounds.
global.audio_volume = audio_get_master_gain(0);