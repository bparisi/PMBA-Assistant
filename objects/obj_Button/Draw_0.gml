/// @description


if (m_button_sprite_state == button_sprite.initial)
	draw_sprite(sprite_index, 0, x, y);
else if (m_button_sprite_state == button_sprite.pressed)
	draw_sprite(sprite_index, 1, x, y);
	
