/// @description

draw_set_font(font_TextboxLabel);
if (m_xselect_hover) draw_set_color(c_aqua);
else draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(x + 61, y + 28, m_xselect_text);