/// @description

draw_set_color(c_black);
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_sprite(sprite_index, image_index, x, y);
draw_text_ext(x + 10, y + 10, m_err_text, 32, 160);