/// @description

if (!m_cpt_hover)
	draw_sprite(sprite_index, 0, x, y);
else
	draw_sprite(sprite_index, 1, x, y);
	
draw_set_font(font_CPTCodeItem);
draw_set_halign(fa_left);
draw_set_color(c_black);

var ymargin = 12;

draw_text(x + 64, y + ymargin, m_cpt_code);
draw_set_halign(fa_right);
draw_text(x + 350, y + ymargin, "$ " + m_cpt_charge);
draw_set_halign(fa_left);

if (controller.game_state == gm_state.NewRecordSettled) {
	draw_set_font(font_Arrow);
	draw_set_color(c_green);
	var arrows = chr(187) + chr(187);
	draw_text(x + 366, y + ymargin, arrows);
	draw_set_font(font_CPTCodeItem);
	draw_set_color(c_black);
	draw_text(x + 412, y + ymargin, "$ " + m_cpt_max_payment);
}