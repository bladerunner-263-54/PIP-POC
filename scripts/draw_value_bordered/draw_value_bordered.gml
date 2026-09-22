function draw_value_bordered(caption, value, x, y) 
{
	draw_set_colour($FF093F68 & $ffffff);draw_set_alpha(1);

	for(i = 0; i < 360; i += 36) {
		var _x = lengthdir_x(4, i);
		var _y = lengthdir_y(4, i);
	
		draw_text(x + _x, y + _y, string(caption) + string(value));
	}

	draw_set_colour($FFFFFFFF & $ffffff);draw_set_alpha(1);

	draw_text(x, y, string(caption) + string(value));
}