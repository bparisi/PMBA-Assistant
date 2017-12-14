/// @description 

var save_attempt_flag = 1;
validateAll();
with (obj_Textbox) {
	if (m_textbox_state == 2) save_attempt_flag = 0;
	else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
	
}

if (save_attempt_flag == 1) { //valid
	
	//this is where data is actually copied to be preserved
	if (instance_exists(obj_cptCode)) {

		var patient_detail_id, new_record_array, new_record_count;
		with (obj_PatientDetail) {
			patient_detail_id = id;
			new_record_count = m_pd_cptcode_count;
			new_record_array = m_pd_cptcode_array;
			if (controller.game_state == gm_state.CPTEntry_New) {
				m_pd_firstName = (inst_textbox_firstName).m_textbox_text;
				m_pd_lastName = (inst_textbox_lastName).m_textbox_text;
				m_pd_billing_name = (inst_textbox_provName).m_textbox_text;
				m_pd_bill_addr = (inst_textbox_billAddr).m_textbox_text;
				m_pd_bill_phone = (inst_textbox_billPhone).m_textbox_text;
				m_pd_fedTIN = (inst_textbox_fedTIN).m_textbox_text;
				m_pd_phys_sig = (inst_textbox_physSig).m_textbox_text;
			}
			else if (controller.game_state == gm_state.CPTEntry_NewSettled) {
				m_pd_firstName = (inst_textbox_firstName2).m_textbox_text;
				m_pd_lastName = (inst_textbox_lastName2).m_textbox_text;
				m_pd_billing_name = (inst_textbox_provName2).m_textbox_text;
				m_pd_bill_addr = (inst_textbox_billAddr2).m_textbox_text;
				m_pd_bill_phone = (inst_textbox_billPhone2).m_textbox_text;
				m_pd_fedTIN = (inst_textbox_fedTIN2).m_textbox_text;
				m_pd_phys_sig = (inst_textbox_physSig2).m_textbox_text;
				m_pd_dateofservice = (inst_textbox_dos).m_textbox_text;
				m_pd_dateofloss = (inst_textbox_dol).m_textbox_text;
				m_pd_na_bill_id = (inst_textbox_naBillID).m_textbox_text;
				m_pd_na_case_id = (inst_textbox_naCaseID).m_textbox_text;
			}
		
		}

	
		var grid, row, unique_id, cpt_code, unique_record_group;
		grid = controller.m_ds_datagrid;
		var index = new_record_count-1;
		var state = controller.game_state;
	
		repeat (new_record_count) {
			row = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);
			unique_id = ds_grid_get(controller.m_ds_metadata, 0, meta.next_unique_id);
			unique_record_group = ds_grid_get(controller.m_ds_metadata, 0, meta.next_unique_grouping);
			cpt_code = new_record_array[index];
		
			ds_grid_set(grid, row, dgc.data_id, unique_id);
			ds_grid_set(grid, row, dgc.record_grouping, unique_record_group);

			with (patient_detail_id) {
				ds_grid_set(grid, row, dgc.first_name, m_pd_firstName);
				ds_grid_set(grid, row, dgc.last_name, m_pd_lastName);
				ds_grid_set(grid, row, dgc.bill_name, m_pd_billing_name);
			
				//case already settled values (empty strings if case not settled)
				ds_grid_set(grid, row, dgc.date_of_service, m_pd_dateofservice);
				ds_grid_set(grid, row, dgc.date_of_loss, m_pd_dateofloss);
				ds_grid_set(grid, row, dgc.na_case_id, m_pd_na_case_id);
				ds_grid_set(grid, row, dgc.na_bill_id, m_pd_na_bill_id);
			
			
				//additional hic form details (empty strings if not filled out)
				ds_grid_set(grid, row, dgc.bill_address, m_pd_bill_addr);
				ds_grid_set(grid, row, dgc.bill_phone, m_pd_bill_phone);
				ds_grid_set(grid, row, dgc.fedTIN, m_pd_fedTIN);
				ds_grid_set(grid, row, dgc.phys_sig, m_pd_phys_sig);
			}

			with (cpt_code) {	
				ds_grid_set(grid, row, dgc.from_date, m_cpt_fromDate);
				ds_grid_set(grid, row, dgc.to_date, m_cpt_toDate);
				ds_grid_set(grid, row, dgc.cpt_code, m_cpt_code);
				ds_grid_set(grid, row, dgc.charge, m_cpt_charge);
			
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
	else { //no cpt codes
		if not (instance_exists(obj_Invalid)) {
			var inst_id = instance_create_layer(610, 800, "Tooltips", obj_Invalid);
			inst_id.m_err_text = "At least one CPT Code must be added";
		}
		else {
			with (obj_Invalid) m_err_text = "At least one CPT Code must be added";
		}
	}
	
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