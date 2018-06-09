/// @description set persistences

m_button_sprite_state = button_sprite.initial;

//we need this button bc it has the grids
with (obj_Button_pickImportData) {
	persistent = true;
	visible = false;
	
}
room_persistent = true;
changeGameState(m_button_state_dest, m_button_room_dest);