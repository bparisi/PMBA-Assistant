/// @description calls changeGameState

if (controller.game_state == gm_state.NewRecord) {
	with (obj_cptCode) instance_destroy();
	with (obj_PatientDetail) instance_destroy();
}

changeGameState(m_button_state_dest, m_button_room_dest);


