draw_set_color(m_statictext_color);
draw_set_font(m_statictext_font);
draw_set_halign(m_statictext_halign);
draw_sprite(sprite_index, image_index, x, y);
draw_text_ext(x + m_statictext_xoffset, y + m_statictext_yoffset, m_statictext_text, m_statictext_lineheight, m_statictext_linewidth);


/* tooltip_mode (draw at mouse), use_sprite, bg_height, bg_width, bg_color object variables?
pseudo-code:
draw_set_color(bg_color);
if (tooltip_mode)
	draw_rectangle(mouse_x, mouse_y, mouse_x+bg_width, mouse_y+bg_height, false);
else draw_sprite
*/