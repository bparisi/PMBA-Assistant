with (obj_cptCode) {
	x = -420;	
	y = -420;
	m_cpt_hover = false;
}

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 9;	
}

if (controller.game_state == gm_state.CPTEntry_EditSettled) {
	var cpt;
	with (obj_cptCode) {
		if (m_cpt_selected_for_edit) cpt = id;
	}
	
	with (cpt) {
		inst_textbox_fromDate2.m_textbox_text = m_cpt_fromDate;
		inst_textbox_toDate2.m_textbox_text = m_cpt_toDate;
		inst_textbox_cptCode2.m_textbox_text = m_cpt_code;
		inst_textbox_charge2.m_textbox_text = m_cpt_charge;
		inst_textbox_units2.m_textbox_text = m_cpt_units;
		inst_textbox_placeCode2.m_textbox_text = m_cpt_placeCode;
		inst_textbox_modifiers2.m_textbox_text = m_cpt_modifiers;
		inst_textbox_provID2.m_textbox_text = m_cpt_provID;
		inst_textbox_maxpay.m_textbox_text = m_cpt_max_payment;
		if (m_cpt_max_payment == -404)
			inst_textbox_maxpay.m_textbox_text = "";
	}
}