


if (instance_exists(obj_cptCodeTable)) {
	var pd_index;
	pd_index = (inst_cptCodeTable).m_obj_PD_index;
	(inst_textbox_firstName).m_textbox_text = pd_index.m_pd_firstName;
	(inst_textbox_lastName).m_textbox_text = pd_index.m_pd_lastName;
	(inst_textbox_provName).m_textbox_text = pd_index.m_pd_billing_name;

	if ((inst_cptCodeTable).m_cptcode_count < 6) {
		(obj_cptCodeTable).visible = true;
	}
}
if (instance_exists(obj_cptCode)) {
	(obj_cptCode).visible = true;
}