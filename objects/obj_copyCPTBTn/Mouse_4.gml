/// @description

var state = controller.game_state;

with (obj_PatientDetail) {
	var place = m_pd_cptcode_array[0].m_cpt_placeCode;
	var units = m_pd_cptcode_array[0].m_cpt_units;
	var provID = m_pd_cptcode_array[0].m_cpt_provID;
}

if (state == gm_state.CPTEntry_New) {
	inst_textbox_placeCode.m_textbox_text = place;
	inst_textbox_units.m_textbox_text = units;
	inst_textbox_provID.m_textbox_text = provID;
}
else if (state == gm_state.CPTEntry_NewSettled) {
	inst_textbox_placeCode2.m_textbox_text = place;
	inst_textbox_units2.m_textbox_text = units;
	inst_textbox_provID2.m_textbox_text = provID;
}