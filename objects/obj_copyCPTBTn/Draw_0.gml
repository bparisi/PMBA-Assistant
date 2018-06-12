/// @description

//could be changed to have common ancestry with obj_cptCode and obj_AddNewCPTBtn

if (!m_cpt_hover)
	draw_sprite(sprite_index, 0, x, y);
else
	draw_sprite(sprite_index, 1, x, y);
	
draw_set_font(font_CPTCodeItem);
draw_set_halign(fa_left);
draw_set_color(c_black);


draw_text(x + 64, y + 12, "Copy original CPT optional details");