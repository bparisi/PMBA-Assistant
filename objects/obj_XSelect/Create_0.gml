/// @description non-exposed variables

m_xselect_hover = false;
m_xselect_selected = false;

//since we overrode the draw event with a draw_sprite without xscale, this only affects the mask
image_xscale = (m_xselect_width + 64) / sprite_get_width(spr_XSelect_Mask);
