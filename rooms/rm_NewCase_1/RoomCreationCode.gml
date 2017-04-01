if (controller.m_patient_detail != undefined) {
	var pd_id = controller.m_patient_detail;
	
	with (pd_id) {
		(inst_textbox_firstName).m_textbox_text = m_pd_firstName;
		(inst_textbox_lastName).m_textbox_text = m_pd_lastName;
		(inst_textbox_provName).m_textbox_text = m_pd_billing_name;
		(inst_textbox_provAddr1).m_textbox_text = m_pd_billing_addr1;
		(inst_textbox_provAddr2).m_textbox_text = m_pd_billing_addr2;
		(inst_textbox_provPhone).m_textbox_text = m_pd_billing_phone;
		(inst_textbox_fedTIN).m_textbox_text = m_pd_fedTIN;
		(inst_textbox_physician).m_textbox_text = m_pd_phys_sig;
	}
}