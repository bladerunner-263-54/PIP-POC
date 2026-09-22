draw_set_colour(c_black);
draw_set_alpha(0.4);

draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 0);

draw_self();

draw_set_colour($093F68);     
draw_set_alpha(1);

draw_set_font(fnt_falas);

draw_text(x + 0, y + -80, string("\n\n\n Você sabia que existem mais de seis\n tipos de milho? E até de cores diferentes!\n\nPara a nossa primeira fase, vamos\n coletar algumas espigas diferentes!") + "");

//draw_sprite(spr_decal, 0, x, y - 10);