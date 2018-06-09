
with (obj_cptCode) {
	x = -420;	
	y = -420;
}

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 6;	
}

if (controller.game_state == gm_state.CPTEntry_Edit) {
	var cpt;
	with (obj_cptCode) {
		if (m_cpt_selected_for_edit) cpt = id;
	}
	
	with (cpt) {
		inst_textbox_cptCode.m_textbox_text = m_cpt_code;
		inst_textbox_charge.m_textbox_text = m_cpt_charge;
		inst_textbox_units.m_textbox_text = m_cpt_units;
		inst_textbox_placeCode.m_textbox_text = m_cpt_placeCode;
		inst_textbox_modifiers.m_textbox_text = m_cpt_modifiers;
		inst_textbox_provID.m_textbox_text = m_cpt_provID;
	}
}