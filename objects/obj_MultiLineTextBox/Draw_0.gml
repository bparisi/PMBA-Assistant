/// @description

/// draw textbox
var frame = m_tab_selected ? 1 : 0;
frame += m_textbox_state * 2;
draw_sprite(sprite_index, frame, x, y);

//draw text
draw_set_font(font_TextInput); //set the font
draw_set_halign(m_textbox_fa); //set text alignment
draw_set_color(c_black); //set text color

if (m_textbox_fa == fa_center) //draw text
	draw_text_ext( x +20+ sprite_width/2, y + 12, string(m_textbox_text), m_textbox_lineBreakSize, sprite_width-42);
else if (m_textbox_fa == fa_right)
	draw_text_ext( x + sprite_width, y + 12, string(m_textbox_text), m_textbox_lineBreakSize, sprite_width-42);
else
	draw_text_ext( x + 25, y + 12, string(m_textbox_text), m_textbox_lineBreakSize, sprite_width-42);

//draw the label
draw_set_color(c_white);
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_text( x + 8, y + 166, string(m_textbox_label));
