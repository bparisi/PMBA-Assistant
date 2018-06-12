/// @description

with (obj_XSelect) {
	if (m_xselect_grouping == other.m_xselect_grouping) {
		m_xselect_selected = false;	
	}
}

m_xselect_selected = true;
//redraw cpt codes for appeals warning
with (obj_PatientDetail) {
	pd2("Fired", "");
	m_pd_negtype = other.m_xselect_select_id;
	drawCPTCodes(id);
}

//setting origpay textbox state in Edit Room
if (m_xselect_grouping == 0) {
	if (controller.game_state == gm_state.EditRecord) {
		var origpay_state = inst_textbox_origpay3.m_textbox_state;
		//appeal was clicked on, go from optional to mandatory
		if (m_xselect_select_id == ntype.appeal) {
			if (origpay_state == 3) inst_textbox_origpay3.m_textbox_state = 0;
			else if (origpay_state == 4) inst_textbox_origpay3.m_textbox_state = 1;
			else if (origpay_state == 5) inst_textbox_origpay3.m_textbox_state = 2;
		}
		else if (m_xselect_select_id == ntype.claims or m_xselect_select_id == ntype.first_time) {
			if (origpay_state == 0) inst_textbox_origpay3.m_textbox_state = 3;
			else if (origpay_state == 1) inst_textbox_origpay3.m_textbox_state = 4;
			else if (origpay_state == 2) inst_textbox_origpay3.m_textbox_state = 5;
		}
	}
}