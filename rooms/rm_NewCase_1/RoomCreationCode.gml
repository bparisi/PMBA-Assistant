
var pd_index;

if not (instance_exists(obj_PatientDetail)) {
	pd_index = instance_create_layer(420,420,"Instances", obj_PatientDetail);	
}
else {
	with (obj_PatientDetail) {
		(inst_textbox_firstName).m_textbox_text = m_pd_firstName;
		(inst_textbox_lastName).m_textbox_text = m_pd_lastName;
		(inst_textbox_provName).m_textbox_text = m_pd_billing_name;
		(inst_textbox_billAddr).m_textbox_text = m_pd_bill_addr;
		(inst_textbox_billPhone).m_textbox_text = m_pd_bill_phone;
		(inst_textbox_physSig).m_textbox_text = m_pd_phys_sig;
		(inst_textbox_fedTIN).m_textbox_text = m_pd_fedTIN;
		pd_index = id;
	}
}

with (obj_cptCode) {
	m_cpt_selected_for_edit = false;
	m_cpt_hover = false;
}
drawCPTCodes(pd_index);

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 7;	
}

if (controller.validate) {
	validateAll();
	controller.validate = false;
}