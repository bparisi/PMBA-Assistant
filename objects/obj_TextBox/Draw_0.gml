/// @description

/// draw text box and text
if (!m_textbox_selected) draw_sprite(sprite_index,0,x,y); //draw inactive sprite (frame 0)
else draw_sprite(sprite_index,1,x,y) //draw active sprite (frame 1)

draw_set_font(font_TextInput); //set the font
draw_set_halign(m_textbox_fa); //set text alignment
draw_set_color(c_white); //set text color
if (m_textbox_fa == fa_center) //draw text
	draw_text( x + sprite_width/2, y - 6 + sprite_height/2, string(m_textbox_text));
else
	draw_text( x + 20, y - 6 + sprite_height/2, string(m_textbox_text));

//draw the label
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_text( x + 20, y + sprite_height + 10, string(m_textbox_label));
