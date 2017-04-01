/// @description

if (!m_cpt_hover)
	draw_sprite(sprite_index, 0, x, y);
else
	draw_sprite(sprite_index, 1, x, y);
	
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_set_color(c_black);

draw_text(x + 320, y + 3, m_cpt_code);
draw_text(x + 480, y + 3, "$ " + m_cpt_charge);