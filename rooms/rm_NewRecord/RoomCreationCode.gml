
var pd_index;

if not (instance_exists(obj_PatientDetail)) {
	pd_index = instance_create_layer(420,420,"Instances", obj_PatientDetail);
	pd_index.m_pd_negtype = ntype.first_time;
}
else {
	with (obj_PatientDetail) {
		(inst_textbox_firstName).m_textbox_text = m_pd_firstName;
		(inst_textbox_lastName).m_textbox_text = m_pd_lastName;
		(inst_textbox_provName).m_textbox_text = m_pd_billing_name;
		(inst_textbox_fromDate).m_textbox_text = m_pd_dos_from;
		(inst_textbox_toDate).m_textbox_text = m_pd_dos_to;
		(inst_textbox_billAddr).m_textbox_text = m_pd_bill_addr;
		(inst_textbox_billPhone).m_textbox_text = m_pd_bill_phone;
		(inst_textbox_authSig).m_textbox_text = m_pd_auth_sig;
		(inst_textbox_fedTIN).m_textbox_text = m_pd_fedTIN;
		(inst_textbox_naBillID).m_textbox_text = m_pd_na_bill_id;
		pd_index = id;
	}
}

with (pd_index) {
	with (obj_XSelect) {
		if (m_xselect_select_id == other.m_pd_negtype) m_xselect_selected = true;
		else m_xselect_selected = false;
	}
}

with (obj_cptCode) {
	m_cpt_selected_for_edit = false;
	m_cpt_hover = false;
}
drawCPTCodes(pd_index);

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 10;	
}

if (controller.validate) {
	//re-validate is returning from saving a cpt code
	validateAll();
	controller.validate = false;
}

with (obj_StaticTextDisplay) visible = false;
inst_alwaysShow.visible = true;
inst_alwaysShowDOSHint.visible = true;
