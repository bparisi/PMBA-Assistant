/// @description create an obj_PatientDetail

var new_id;

new_id = instance_create_layer(0, 0, "Instances", obj_PatientDetail);

with (new_id) {
	m_pd_firstName = (inst_textbox_firstName).m_textbox_text;
	m_pd_lastName = (inst_textbox_lastName).m_textbox_text;
	m_pd_billing_name = (inst_textbox_provName).m_textbox_text;
	m_pd_billing_addr1 = (inst_textbox_provAddr1).m_textbox_text;
	m_pd_billing_addr2 = (inst_textbox_provAddr2).m_textbox_text; 
	m_pd_billing_phone = (inst_textbox_provPhone).m_textbox_text;
	m_pd_fedTIN = (inst_textbox_fedTIN).m_textbox_text;
	m_pd_phys_sig = (inst_textbox_physician).m_textbox_text;
}


controller.m_patient_detail = new_id;

changeGameState(m_button_state_dest, m_button_room_dest);