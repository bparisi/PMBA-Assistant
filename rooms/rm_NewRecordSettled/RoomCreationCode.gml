
var pd_index;

if not (instance_exists(obj_PatientDetail)) {
	pd_index = instance_create_layer(420,420,"Instances", obj_PatientDetail);	
	pd_index.m_pd_negtype = ntype.first_time;
}
else {
	with (obj_PatientDetail) {
		(inst_textbox_firstName2).m_textbox_text = m_pd_firstName;
		(inst_textbox_lastName2).m_textbox_text = m_pd_lastName;
		(inst_textbox_provName2).m_textbox_text = m_pd_billing_name;
		(inst_textbox_fromDate2).m_textbox_text = m_pd_dos_from;
		(inst_textbox_toDate2).m_textbox_text = m_pd_dos_to;
		(inst_textbox_billAddr2).m_textbox_text = m_pd_bill_addr;
		(inst_textbox_billPhone2).m_textbox_text = m_pd_bill_phone;
		(inst_textbox_authSig2).m_textbox_text = m_pd_auth_sig;
		(inst_textbox_fedTIN2).m_textbox_text = m_pd_fedTIN;
		(inst_textbox_dol).m_textbox_text = m_pd_dateofloss;
		(inst_textbox_naBillID2).m_textbox_text = m_pd_na_bill_id;
		(inst_textbox_naCaseID).m_textbox_text = m_pd_na_case_id;
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
}
drawCPTCodes(pd_index);

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 12;
}

if (controller.validate) {
	//re-validate is returning from saving a cpt code
	validateAll();
	controller.validate = false;
}

with(obj_StaticTextDisplay) visible = false;
inst_alwaysShow2.visible = true;
inst_alwaysShowDOSHint2.visible = true;
