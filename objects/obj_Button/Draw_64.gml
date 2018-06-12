/// @description draw the label

draw_set_font(m_button_label_font);
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text((x - sprite_width/2) + m_button_x_labeloffset, (y - sprite_height/2) + m_button_y_labeloffset, m_button_label_text);


/*
//debugging:
draw_set_font(-1);
draw_set_color(c_white);

draw_text(100, 810, "game state " + string(controller.game_state));
*/
