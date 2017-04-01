/// @description 

if (!m_cptcode_hover)
	draw_sprite(sprite_index, 2, x, y);
else
	draw_sprite(sprite_index, 3, x, y);
	
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_set_color(c_black);

draw_text(x + 80, y + 5, "Add New CPT Code...");