with (obj_cptCode) {
	x = -420;	
	y = -420;
	m_cpt_hover = false;
}

var negtype;
with (obj_PatientDetail) {
	negtype = m_pd_negtype;
	
	if (m_pd_cptcode_count < 1) {
		instance_destroy(obj_copyCPTBtn);
		instance_destroy(inst_alwaysShowCopyHint);
	}
	
}
if (negtype != ntype.appeal) {
	with (inst_textbox_origpay2) {
		x = -420;
		y = -420;
		m_textbox_state = 3;
		m_textbox_hint_text.x = -420;
		m_textbox_hint_text.y = -420;
	}
}


with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 7;
	if (negtype == ntype.appeal) {
		m_tab_room_max_tabs = 8;
		inst_textbox_origpay2.m_tab_order = 6;
		inst_textbox_maxpay.m_tab_order = 7;
	}
}

if (controller.game_state == gm_state.CPTEntry_EditSettled) {
	var cpt;
	with (obj_cptCode) {
		if (m_cpt_selected_for_edit) cpt = id;
	}
	
	with (cpt) {
		inst_textbox_cptCode2.m_textbox_text = m_cpt_code;
		inst_textbox_charge2.m_textbox_text = m_cpt_charge;
		inst_textbox_units2.m_textbox_text = m_cpt_units;
		inst_textbox_placeCode2.m_textbox_text = m_cpt_placeCode;
		inst_textbox_modifiers2.m_textbox_text = m_cpt_modifiers;
		inst_textbox_provID2.m_textbox_text = m_cpt_provID;
		inst_textbox_maxpay.m_textbox_text = m_cpt_max_payment;
		if (m_cpt_max_payment == -404)
			inst_textbox_maxpay.m_textbox_text = "";
		if (negtype == ntype.appeal) inst_textbox_origpay2.m_textbox_text = m_cpt_orig_payment;
		
	}
}

with(obj_StaticTextDisplay) visible = false;
