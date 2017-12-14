/// @description

if (m_searchbox_selected) draw_sprite(sprite_index, 1, x, y);
else draw_sprite(sprite_index, 0, x, y);
draw_set_font(font_DGV_28); //set the font
draw_set_halign(fa_left); //set text alignment
draw_set_color(c_black); //set text color	
draw_text( x + 50, y + 40, string(m_searchbox_text));