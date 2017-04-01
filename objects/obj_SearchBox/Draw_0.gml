/// @description

draw_sprite(spr_Searchbox, 0, x, y);
draw_set_font(font_DGV_28); //set the font
draw_set_halign(fa_left); //set text alignment
draw_set_color(c_black); //set text color	
draw_text( x + 50, y + 40, string(m_searchbox_text));