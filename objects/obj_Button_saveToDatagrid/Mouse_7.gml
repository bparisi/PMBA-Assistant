/// @description 

if (m_button_click_capture) {
		
	//Input Validation
	var save_attempt_flag = 1; //0 - required invalid, 1 - valid, 2 - optional invalid
	
	if (instance_exists(obj_cptCode)) {
		validateAll();
		with (obj_Textbox) {
			//if any required are invalid, state 0
			if (m_textbox_state == 2) save_attempt_flag = 0;
			//otherwise, if an optional is invalid and we haven't had a required invalid yet, state 2
			else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
		}
		if (instance_exists(obj_AppealWarning)) save_attempt_flag = 3; //3 - AppealWarning
		if (save_attempt_flag == 2 and m_optional_flag) {
			save_attempt_flag = 1; //second click-thru of optional and got optional again
		}
	}
	else {
		save_attempt_flag = 4; //4 - no cpt codes
	}

	


	//save new data or display errors
	if (save_attempt_flag == 1) { //valid
		m_popup.visible = false; //doesn't really matter bc we go to the next room, but eh
	
		//this is where data is actually copied to be preserved

		var patient_detail_id, new_record_array, new_record_count;
		with (obj_PatientDetail) {
			patient_detail_id = id;
			new_record_count = m_pd_cptcode_count;
			new_record_array = m_pd_cptcode_array;
			if (controller.game_state == gm_state.NewRecord) {
				readPatientDetails(id, false);
			}
			else if (controller.game_state == gm_state.NewRecordSettled) {
				readPatientDetails(id, true);
			}
		
		}

	
		var grid, row, unique_id, cpt_code, unique_record_group;
		grid = controller.m_ds_datagrid;
		var index = new_record_count-1;
		var state = controller.game_state;
		
		unique_record_group = ds_grid_get(controller.m_ds_metadata, 0, meta.next_unique_grouping);
	
		repeat (new_record_count) {
			row = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);
			unique_id = ds_grid_get(controller.m_ds_metadata, 0, meta.next_unique_id);
			cpt_code = new_record_array[index];
		
			ds_grid_set(grid, row, dgc.data_id, unique_id);
			ds_grid_set(grid, row, dgc.record_grouping, unique_record_group);

			with (patient_detail_id) {
				ds_grid_set(grid, row, dgc.first_name, m_pd_firstName);
				ds_grid_set(grid, row, dgc.last_name, m_pd_lastName);
				ds_grid_set(grid, row, dgc.bill_name, m_pd_billing_name);
				
				ds_grid_set(grid, row, dgc.dos_from, m_pd_dos_from);
				ds_grid_set(grid, row, dgc.dos_to, m_pd_dos_to);
			
				//case already settled values (empty strings if case not settled)
				ds_grid_set(grid, row, dgc.date_of_loss, m_pd_dateofloss);
				ds_grid_set(grid, row, dgc.na_case_id, m_pd_na_case_id);
				ds_grid_set(grid, row, dgc.na_bill_id, m_pd_na_bill_id);
			
			
				//additional hic form details (empty strings if not filled out)
				ds_grid_set(grid, row, dgc.bill_address, m_pd_bill_addr);
				ds_grid_set(grid, row, dgc.bill_phone, m_pd_bill_phone);
				ds_grid_set(grid, row, dgc.fedTIN, m_pd_fedTIN);
				ds_grid_set(grid, row, dgc.auth_sig, m_pd_auth_sig);
				
				//negotiation type
				ds_grid_set(grid, row, dgc.neg_type, m_pd_negtype);
			}

			with (cpt_code) {	
				ds_grid_set(grid, row, dgc.cpt_code, m_cpt_code);
				ds_grid_set(grid, row, dgc.charge, m_cpt_charge);
				ds_grid_set(grid, row, dgc.original_payment, m_cpt_orig_payment);
			
				if (state == gm_state.NewRecordSettled) {
					ds_grid_set(grid, row, dgc.settled, true);
					ds_grid_set(grid, row, dgc.max_payment, m_cpt_max_payment);
				}
				else {
					ds_grid_set(grid, row, dgc.settled, false);
					ds_grid_set(grid, row, dgc.max_payment, "N/A");
				}
			
				//optional values (empty strings if not filled in, except units which is 1
				ds_grid_set(grid, row, dgc.modifiers, m_cpt_modifiers);
				ds_grid_set(grid, row, dgc.units, m_cpt_units);
				ds_grid_set(grid, row, dgc.place_code, m_cpt_placeCode);
				ds_grid_set(grid, row, dgc.prov_id, m_cpt_provID);
			}
		
			//date of entry
			//create ds_list to store times of future edits
			var timelist = ds_list_create();
			var now = date_datetime_string(date_current_datetime());
			ds_list_add(timelist, now);
			var listString = ds_list_write(timelist);
			//write the string that can reconstruct the ds_list to the main datagrid
			ds_grid_set(grid, row, dgc.date_of_entry, listString);
			ds_list_destroy(timelist);

			//increment metadata and decrement index
			ds_grid_set(controller.m_ds_metadata, 0, meta.row_count, row+1);
			ds_grid_set(controller.m_ds_metadata, 0, meta.next_unique_id, unique_id+1);
			index -= 1;
		}
	
		//increment record grouping
		ds_grid_set(controller.m_ds_metadata, 0, meta.next_unique_grouping, unique_record_group+1);
	
	
		//set variables and return to main menu
		controller.m_grid_changed = true;
		with (obj_PatientDetail) persistent = false;
		with (obj_cptCode) persistent = false;
	
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
				m_statictext_linewidth = 190;
			}
		}
		else if (save_attempt_flag == 3) {
			m_optional_flag = false;
			with (m_popup) {
				sprite_index = spr_Invalid;
				m_statictext_text = "Address the issue(s) with CPT Codes";
			}
		}
		else if (save_attempt_flag == 4) {
			m_optional_flag = false;
			with (m_popup) {
				sprite_index = spr_Invalid;
				m_statictext_text = "At least one CPT Code must be added";
			}
		}

	}

}



