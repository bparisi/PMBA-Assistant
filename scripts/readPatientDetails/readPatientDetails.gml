///@description reads data from textboxes (specifically in rm_NewRecord[Settled]) into an obj_PatientDetail
///@param pd_inst_id the id of the cpt code object to read data into
///@param settled a flag indicating which of the two rooms (settled or not) we are in

//readPatientDetails(pd_inst_id, settled)

var pd = argument0;
var settled = argument1;
var negtype;

//negtype should have been set already on click of an XSelect, but it is listed here for completeness
with (obj_XSelect) {
	if (m_xselect_selected) {
		negtype = m_xselect_select_id; //a member of ntype enum	
	}
}
m_pd_negtype = negtype;

with (pd) {
	if (settled) {
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
		m_pd_dateofloss = (inst_textbox_dol).m_textbox_text;
		m_pd_na_case_id = (inst_textbox_naCaseID).m_textbox_text;
		
	}
	else {
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
}