/// @description

with (obj_PatientDetail) {
	m_pd_firstName = (inst_textbox_firstName).m_textbox_text;
	m_pd_lastName = (inst_textbox_lastName).m_textbox_text;
	m_pd_billing_name = (inst_textbox_provName).m_textbox_text;
	m_pd_dos_from = (inst_textbox_fromDate).m_textbox_text;
	m_pd_dos_to = (inst_textbox_toDate).m_textbox_text;
	m_pd_bill_addr = (inst_textbox_billAddr).m_textbox_text;
	m_pd_bill_phone = (inst_textbox_billPhone).m_textbox_text;
	m_pd_auth_sig = (inst_textbox_authSig).m_textbox_text;
	m_pd_fedTIN = (inst_textbox_fedTIN).m_textbox_text;
	m_pd_na_bill_id = (inst_textbox_naBillID).m_textbox_text;
}

changeGameState(gm_state.NewRecordSettled, rm_NewRecordSettled);