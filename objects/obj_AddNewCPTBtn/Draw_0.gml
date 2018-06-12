/// @description 

//could be changed to have common ancestry with obj_cptCode and obj_copyCPTBtn

//the same sprite as a real CPT code is used for the add new button, but different frames
if (!m_cpt_hover)
	draw_sprite(sprite_index, 2, x, y);
else
	draw_sprite(sprite_index, 3, x, y);
	
draw_set_font(font_CPTCodeItem);
draw_set_halign(fa_left);
draw_set_color(c_black);

draw_text(x + 80, y + 12, "Add New CPT Code...");