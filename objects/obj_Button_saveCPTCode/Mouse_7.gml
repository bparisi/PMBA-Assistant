/// @description 

if (m_button_click_capture) {

	var cpt;
	var state = controller.game_state;

	//Input Validation
	var save_attempt_flag = 1;
	validateAll();
	with (obj_Textbox) {
		if (m_textbox_state == 2) save_attempt_flag = 0;
		else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
	}
	if (save_attempt_flag == 2 and m_optional_flag)
		save_attempt_flag = 1; //second click-thru of optional and got optional again

	//save new cpt code or display errors
	if (save_attempt_flag == 1) { //valid
	
		if (state == gm_state.CPTEntry_New) {
			cpt = instance_create_layer(-420, -420, "Instances", obj_cptCode);
			readCPTCode(cpt, false);

			with (obj_PatientDetail) {
				m_pd_cptcode_array[m_pd_cptcode_count] = cpt;
				m_pd_cptcode_count += 1;
			}
		}

		else if (state == gm_state.CPTEntry_NewSettled) {
			cpt = instance_create_layer(-420, -420, "Instances", obj_cptCode);
			readCPTCode(cpt, true);

			with (obj_PatientDetail) {
				m_pd_cptcode_array[m_pd_cptcode_count] = cpt;
				m_pd_cptcode_count += 1;
			}
		}

		else if (state == gm_state.CPTEntry_Edit) {
			with (obj_cptCode) {
				if (m_cpt_selected_for_edit) cpt = id; 
			}
			readCPTCode(cpt, false);
		}

		else if (state == gm_state.CPTEntry_EditSettled) {
			with (obj_cptCode) {
				if (m_cpt_selected_for_edit) cpt = id; 
			}
			readCPTCode(cpt, true);
		}

		controller.validate = true; //flag to re-validate the fields in the patient detail room on return
		changeGameState( m_button_state_dest, m_button_room_dest);
	}
	else { //not valid for some reason
		m_popup.visible = true;
	
		if (save_attempt_flag == 0) { //some required are invalid
			m_optional_flag = false;
			with (m_popup) {
				sprite_index = spr_Invalid;
				m_statictext_text = "Some required fields do not have valid formatting";
			}
		}
		else if (save_attempt_flag == 2) { //some optional are invalid
			m_optional_flag = true;
			with (m_popup) {
				sprite_index = spr_Invalid_Optional;
				m_statictext_text = "Some optional fields do not look right, but they will still be saved as is if you click again";
			}
		}

	}

}
