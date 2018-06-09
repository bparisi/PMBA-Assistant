/// @description

with (obj_PatientDetail) {
	m_pd_firstName = (inst_textbox_firstName2).m_textbox_text;
	m_pd_lastName = (inst_textbox_lastName2).m_textbox_text;
	m_pd_billing_name = (inst_textbox_provName2).m_textbox_text;
	m_pd_dos_from = (inst_textbox_fromDate2).m_textbox_text;
	m_pd_dos_to = (inst_textbox_toDate2).m_textbox_text;
	m_pd_bill_addr = (inst_textbox_billAddr2).m_textbox_text;
	m_pd_bill_phone = (inst_textbox_billPhone2).m_textbox_text;
	m_pd_auth_sig = (inst_textbox_authSig2).m_textbox_text;
	m_pd_fedTIN = (inst_textbox_fedTIN2).m_textbox_text;
	m_pd_na_bill_id = (inst_textbox_naBillID2).m_textbox_text;
}

changeGameState(gm_state.NewRecord, rm_NewRecord);