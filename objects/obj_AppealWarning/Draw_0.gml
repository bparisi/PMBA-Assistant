/// @description 


if (m_mpwarning_hover) {
	draw_sprite(sprite_index, 1, x, y);
	
	draw_set_color(c_blue);
	draw_rectangle(mouse_x, mouse_y, mouse_x+300, mouse_y+300, false);
	
	draw_set_font(font_TextInput); //set the font
	draw_set_halign(fa_left); //set text alignment
	draw_set_color(c_white); //set text color
	draw_text_ext(mouse_x + 20, mouse_y + 20, 
	"The negotiation has been marked as an appeal, but the original payment for this CPT Code was never specified.", 
					32, 260);
	
}
else draw_sprite(sprite_index, 0, x, y);