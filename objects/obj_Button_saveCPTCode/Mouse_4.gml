/// @description 

var new_cpt_id, ypos;
with (inst_cptCodeTable) ypos = y;
with (inst_cptCodeTable) y += 30;
new_cpt_id = instance_create_layer(128, ypos, "Instances", obj_cptCode);

with (new_cpt_id) {
	m_cpt_fromDate = (inst_textbox_fromDate).m_textbox_text;
	m_cpt_toDate = (inst_textbox_toDate).m_textbox_text;
	m_cpt_code = (inst_textbox_cptCode).m_textbox_text;
	m_cpt_modifiers = (inst_textbox_modifiers).m_textbox_text;
	m_cpt_charge = (inst_textbox_charge).m_textbox_text;
	m_cpt_units = (inst_textbox_units).m_textbox_text;
	m_cpt_placeCode = (inst_textbox_placeCode).m_textbox_text;
	m_cpt_provID = (inst_textbox_provID).m_textbox_text;
}

with (inst_cptCodeTable) {
	m_cptcode_array[m_cptcode_count] = new_cpt_id;
	m_cptcode_count += 1;
}






changeGameState( m_button_state_dest, m_button_room_dest);