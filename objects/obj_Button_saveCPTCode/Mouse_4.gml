/// @description 

var cpt;
var state = controller.game_state;

var save_attempt_flag = 1;
validateAll();
with (obj_Textbox) {
	if (m_textbox_state == 2) save_attempt_flag = 0;
	else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
}

if (save_attempt_flag == 1) { //valid
	if (state == gm_state.CPTEntry_New) {
	
		cpt = instance_create_layer(-420, -420, "Instances", obj_cptCode);

		with (cpt) {
			m_cpt_fromDate = (inst_textbox_fromDate).m_textbox_text;
			m_cpt_toDate = (inst_textbox_toDate).m_textbox_text;
			m_cpt_code = (inst_textbox_cptCode).m_textbox_text;
			m_cpt_modifiers = (inst_textbox_modifiers).m_textbox_text;
			m_cpt_charge = (inst_textbox_charge).m_textbox_text;
			m_cpt_units = (inst_textbox_units).m_textbox_text;
			m_cpt_placeCode = (inst_textbox_placeCode).m_textbox_text;
			m_cpt_provID = (inst_textbox_provID).m_textbox_text;
		}

		with (obj_PatientDetail) {
			m_pd_cptcode_array[m_pd_cptcode_count] = cpt;
			m_pd_cptcode_count += 1;
		}
	}

	else if (state == gm_state.CPTEntry_NewSettled) {
	
		cpt = instance_create_layer(-420, -420, "Instances", obj_cptCode);

		with (cpt) {
			m_cpt_fromDate = (inst_textbox_fromDate2).m_textbox_text;
			m_cpt_toDate = (inst_textbox_toDate2).m_textbox_text;
			m_cpt_code = (inst_textbox_cptCode2).m_textbox_text;
			m_cpt_modifiers = (inst_textbox_modifiers2).m_textbox_text;
			m_cpt_charge = (inst_textbox_charge2).m_textbox_text;
			m_cpt_units = (inst_textbox_units2).m_textbox_text;
			m_cpt_placeCode = (inst_textbox_placeCode2).m_textbox_text;
			m_cpt_provID = (inst_textbox_provID2).m_textbox_text;
			m_cpt_max_payment = (inst_textbox_maxpay).m_textbox_text;
		}

		with (obj_PatientDetail) {
			m_pd_cptcode_array[m_pd_cptcode_count] = cpt;
			m_pd_cptcode_count += 1;
		}
	
		m_button_room_dest = rm_NewCase_3;
		m_button_state_dest = gm_state.NewRecordSettled;
	}

	else if (state == gm_state.CPTEntry_Edit) {
	
		with (obj_cptCode) {
			if (m_cpt_selected_for_edit) cpt = id; 
		}
	
		with (cpt) {
			m_cpt_fromDate = (inst_textbox_fromDate).m_textbox_text;
			m_cpt_toDate = (inst_textbox_toDate).m_textbox_text;
			m_cpt_code = (inst_textbox_cptCode).m_textbox_text;
			m_cpt_modifiers = (inst_textbox_modifiers).m_textbox_text;
			m_cpt_charge = (inst_textbox_charge).m_textbox_text;
			m_cpt_units = (inst_textbox_units).m_textbox_text;
			m_cpt_placeCode = (inst_textbox_placeCode).m_textbox_text;
			m_cpt_provID = (inst_textbox_provID).m_textbox_text;
		}
	}

	else if (state == gm_state.CPTEntry_EditSettled) {
	
		with (obj_cptCode) {
			if (m_cpt_selected_for_edit) cpt = id; 
		}
	
		with (cpt) {
			m_cpt_fromDate = (inst_textbox_fromDate2).m_textbox_text;
			m_cpt_toDate = (inst_textbox_toDate2).m_textbox_text;
			m_cpt_code = (inst_textbox_cptCode2).m_textbox_text;
			m_cpt_modifiers = (inst_textbox_modifiers2).m_textbox_text;
			m_cpt_charge = (inst_textbox_charge2).m_textbox_text;
			m_cpt_units = (inst_textbox_units2).m_textbox_text;
			m_cpt_placeCode = (inst_textbox_placeCode2).m_textbox_text;
			m_cpt_provID = (inst_textbox_provID2).m_textbox_text;
			m_cpt_max_payment = (inst_textbox_maxpay).m_textbox_text;
		}
	
		m_button_room_dest = rm_NewCase_3;
		m_button_state_dest = gm_state.NewRecordSettled;
	}

	controller.validate = true;
	changeGameState( m_button_state_dest, m_button_room_dest);
}
else if (save_attempt_flag == 0) { //some required are invalid
	
	if not (instance_exists(obj_Invalid)) {
		var inst_id = instance_create_layer(610, 800, "Tooltips", obj_Invalid);
		inst_id.m_err_text = "Some required fields do not have valid formatting";
	}
	else {
		with (obj_Invalid) m_err_text = "Some required fields do not have valid formatting";
	}
	
}
else { //save_attempt_flag == 2, some optional are invalid
	
	instance_destroy(obj_Invalid);
	if not (instance_exists(obj_Invalid_Optional)) {
		instance_create_layer(610, 800, "Tooltips", obj_Invalid_Optional);
	}
	
}