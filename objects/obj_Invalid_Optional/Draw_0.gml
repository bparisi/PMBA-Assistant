/// @description

draw_set_color(c_black);
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_sprite(sprite_index, image_index, x, y);
draw_text_ext(x + 10, y + 10, "Some optional fields do not look right, " +
							"but they will still be saved as is if you click again", 32, 190);