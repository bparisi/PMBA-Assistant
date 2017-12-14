
var pd_index;

if not (instance_exists(obj_PatientDetail)) {
	pd_index = instance_create_layer(420,420,"Instances", obj_PatientDetail);	
}
else {
	with (obj_PatientDetail) {
		(inst_textbox_firstName2).m_textbox_text = m_pd_firstName;
		(inst_textbox_lastName2).m_textbox_text = m_pd_lastName;
		(inst_textbox_provName2).m_textbox_text = m_pd_billing_name;
		(inst_textbox_billAddr2).m_textbox_text = m_pd_bill_addr;
		(inst_textbox_billPhone2).m_textbox_text = m_pd_bill_phone;
		(inst_textbox_physSig2).m_textbox_text = m_pd_phys_sig;
		(inst_textbox_fedTIN2).m_textbox_text = m_pd_fedTIN;
		(inst_textbox_dos).m_textbox_text = m_pd_dateofservice;
		(inst_textbox_dol).m_textbox_text = m_pd_dateofloss;
		(inst_textbox_naBillID).m_textbox_text = m_pd_na_bill_id;
		(inst_textbox_naCaseID).m_textbox_text = m_pd_na_case_id;
		pd_index = id;
	}
}

with (obj_cptCode) {
	m_cpt_selected_for_edit = false;
}
drawCPTCodes(pd_index);

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 11;	
}

if (controller.validate) {
	validateAll();
	controller.validate = false;
}