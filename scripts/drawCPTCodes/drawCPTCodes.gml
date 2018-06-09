///@description draws cpt code objects that have been added to a new patient record
///@param pd_index the index of the obj_PatientDetail containing the cpt codes

//drawCPTCodes(pd_index)

var pd = argument0;

with (pd) {
	var yoffset = 30;	
	var inst_id, delBtn;
	
	for (var i = 0; i < m_pd_cptcode_count; i++) {
		inst_id = m_pd_cptcode_array[i];
		with (inst_id) {
			x = 128;
			y = 520 + yoffset*i;
			delBtn = instance_create_layer(x+611, y, "Instances", obj_DeleteCPTBtn);
			if (controller.game_state == gm_state.NewRecordSettled and m_cpt_max_payment == -404)
				instance_create_layer(x+651, y, "Tooltips", obj_MaxPayWarning);
		}
		with (delBtn) m_delBtn_cpt_array_index = i;
	}
	
	if (m_pd_cptcode_count < 6)
		inst_id = instance_create_layer(128, 520+yoffset*i, "Instances", obj_AddNewCPTBtn);
	
}