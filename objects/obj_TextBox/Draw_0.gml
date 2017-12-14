/// @description

/// draw textbox
var frame = m_tab_selected ? 1 : 0;
frame += m_textbox_state * 2;
draw_sprite(spr_Textbox_End_Left, frame, x, y);
image_xscale = m_textbox_width / 50;
draw_sprite_ext(sprite_index, frame, x+20, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite(spr_Textbox_End_Right, frame, x+20+sprite_width, y);

//draw text
draw_set_font(font_TextInput); //set the font
draw_set_halign(m_textbox_fa); //set text alignment
draw_set_color(c_white); //set text color

if (m_textbox_fa == fa_center) //draw text
	draw_text( x +20+ sprite_width/2, y + 12, string(m_textbox_text));
else if (m_textbox_fa == fa_right)
	draw_text( x + sprite_width, y + 12, string(m_textbox_text));
else
	draw_text( x + 25, y + 12, string(m_textbox_text));

//draw the label
draw_set_font(font_TextboxLabel);
draw_set_halign(fa_left);
draw_text( x + 8, y + 56, string(m_textbox_label));
