///@description draws cpt code objects that have been added to a new patient record
///@param pd_index the index of the obj_PatientDetail containing the cpt codes

//drawCPTCodes(pd_index)

var pd = argument0;

instance_destroy(obj_DeleteCPTBtn);
instance_destroy(obj_AddNewCPTBtn);
instance_destroy(obj_AppealWarning);

//origin coordinates of the cpt code display
#macro DRAW_CPT_LEFT 80
#macro DRAW_CPT_TOP 540

with (pd) {
	var yoffset = 50;	
	var inst_id, delBtn;
	
	for (var i = 0; i < m_pd_cptcode_count; i++) {
		inst_id = m_pd_cptcode_array[i];
		with (inst_id) {
			x = DRAW_CPT_LEFT;
			y = DRAW_CPT_TOP + yoffset*i;
			delBtn = instance_create_layer(x+631, y+10, "Instances", obj_DeleteCPTBtn);
			if (other.m_pd_negtype == ntype.appeal and m_cpt_orig_payment == "N/A")
				instance_create_layer(x+671, y+10, "Tooltips", obj_AppealWarning);
		}
		with (delBtn) m_delBtn_cpt_array_index = i;
	}
	
	if (m_pd_cptcode_count < 6)
		inst_id = instance_create_layer(DRAW_CPT_LEFT, DRAW_CPT_TOP+yoffset*i, "Instances", obj_AddNewCPTBtn);
	
}