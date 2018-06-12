/// @description

var frame = m_xselect_selected ? 1 : 0;

draw_sprite(sprite_index, frame, x, y);

if (m_xselect_hover) {
	var img_xscale = m_xselect_width / 100;
	draw_sprite_ext(spr_Link_Underline, image_index, x+60, y+55, img_xscale, image_yscale, 0, c_white, 1);
}