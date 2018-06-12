/// @description 

if (m_button_click_capture) {
	
	//get negtype
	var negtype;
	with (obj_XSelect) {
		if (m_xselect_selected) negtype = m_xselect_select_id; //a member of ntype enum
	}

	//Input Validation
	var save_attempt_flag = 1;
	validateAll();
	with (obj_Textbox) {
		if (m_textbox_state == 2) save_attempt_flag = 0;
		else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
	}

	if (save_attempt_flag == 2 and m_optional_flag)
		save_attempt_flag = 1; //second click-thru of optional and got optional again


	//save new data or display errors
	if (save_attempt_flag == 1) { //valid
		//this is where data is actually copied to be preserved
		var index = controller.m_record_selected_for_edit;
		var grid = controller.m_ds_datagrid;

		//for now, automatically set settled to true because we are forcing maxpay to be valid to get here
		ds_grid_set(grid, index, dgc.settled, true);
		ds_grid_set(grid, index, dgc.first_name, inst_textbox_firstName3.m_textbox_text);
		ds_grid_set(grid, index, dgc.last_name, inst_textbox_lastName3.m_textbox_text);
		ds_grid_set(grid, index, dgc.bill_name, inst_textbox_provName3.m_textbox_text);
		ds_grid_set(grid, index, dgc.bill_address, inst_textbox_billAddr3.m_textbox_text);
		ds_grid_set(grid, index, dgc.bill_phone, inst_textbox_billPhone3.m_textbox_text);
		ds_grid_set(grid, index, dgc.auth_sig, inst_textbox_authSig3.m_textbox_text);
		ds_grid_set(grid, index, dgc.fedTIN, inst_textbox_fedTIN3.m_textbox_text);
		ds_grid_set(grid, index, dgc.dos_from, inst_textbox_fromDate3.m_textbox_text);
		ds_grid_set(grid, index, dgc.dos_to, inst_textbox_toDate3.m_textbox_text);
		ds_grid_set(grid, index, dgc.cpt_code, inst_textbox_cptCode3.m_textbox_text);
		ds_grid_set(grid, index, dgc.charge, inst_textbox_charge3.m_textbox_text);
		ds_grid_set(grid, index, dgc.max_payment, inst_textbox_maxpay3.m_textbox_text);
		ds_grid_set(grid, index, dgc.modifiers, inst_textbox_modifiers3.m_textbox_text);
		ds_grid_set(grid, index, dgc.place_code, inst_textbox_placeCode3.m_textbox_text);
		ds_grid_set(grid, index, dgc.units, inst_textbox_units3.m_textbox_text);
		ds_grid_set(grid, index, dgc.prov_id, inst_textbox_provID3.m_textbox_text);
		ds_grid_set(grid, index, dgc.date_of_loss, inst_textbox_dol3.m_textbox_text);
		ds_grid_set(grid, index, dgc.na_bill_id, inst_textbox_billID3.m_textbox_text);
		ds_grid_set(grid, index, dgc.na_case_id, inst_textbox_caseID3.m_textbox_text);
		ds_grid_set(grid, index, dgc.neg_type, negtype);
		if (negtype == ntype.appeal)
			ds_grid_set(grid, index, dgc.original_payment, inst_textbox_origpay3.m_textbox_text);
		else
			ds_grid_set(grid, index, dgc.original_payment, "N/A");

		//add to ds_list of date_of_entry
		var listString = ds_grid_get(grid, index, dgc.date_of_entry);
		var timelist = ds_list_create();
		ds_list_read(timelist, listString);
		var now = date_datetime_string(date_current_datetime());
		ds_list_add(timelist, now);
		listString = ds_list_write(timelist);
		ds_grid_set(grid, index, dgc.date_of_entry, listString);
		ds_list_destroy(listString);

		//save the new data
		saveToFile(SAVE_FILE_NAME)
	
		controller.m_record_selected_for_edit = noone;
		changeGameState(m_button_state_dest, m_button_room_dest);

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

	}
	
}