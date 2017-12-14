/// @description

with (obj_PatientDetail) {
	m_pd_firstName = (inst_textbox_firstName2).m_textbox_text;
	m_pd_lastName = (inst_textbox_lastName2).m_textbox_text;
	m_pd_billing_name = (inst_textbox_provName2).m_textbox_text;
	m_pd_bill_addr = (inst_textbox_billAddr2).m_textbox_text;
	m_pd_bill_phone = (inst_textbox_billPhone2).m_textbox_text;
	m_pd_phys_sig = (inst_textbox_physSig2).m_textbox_text;
	m_pd_fedTIN = (inst_textbox_fedTIN2).m_textbox_text;
}

changeGameState(gm_state.NewRecord, rm_NewCase_1);