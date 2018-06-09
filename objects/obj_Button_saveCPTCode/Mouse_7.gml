/// @description 

var cpt;
var state = controller.game_state;

//Input Validation
var save_attempt_flag = 1;
validateAll();
with (obj_Textbox) {
	if (m_textbox_state == 2) save_attempt_flag = 0;
	else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
}

//Initialize Error/Warning Popup
var popup;
if (instance_exists(obj_StaticTextDisplay)) {
	with (obj_StaticTextDisplay) popup = id;
}
else popup = instance_create_layer(610, 800, "Tooltips", obj_StaticTextDisplay);

with (popup) {
	sprite_index = spr_Invalid;
	m_statictext_text = "Some required fields do not have valid formatting";	
	visible = false;
}

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
else if (save_attempt_flag == 0) { //some required are invalid
	popup.visible = true;
}
else { //save_attempt_flag == 2, some optional are invalid
	
	with (popup) {
		visible = true;
		sprite_index = spr_Invalid_Optional;
		m_statictext_text = "Some optional fields do not look right, but they will still be saved as is if you click again";
		m_statictext_linewidth = 190;
	}
	
}
