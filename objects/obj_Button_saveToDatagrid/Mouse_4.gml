/// @description 

//this is where data is actually copied to be preserved
if (instance_exists(obj_cptCode)) {

	var grid, row, patient_detail_id, new_record_array, new_record_count;
	with (inst_cptCodeTable) {
		patient_detail_id = m_obj_PD_index;
		new_record_count = m_cptcode_count;
		new_record_array = m_cptcode_array;
	}
	(patient_detail_id).m_pd_firstName = (inst_textbox_firstName).m_textbox_text;
	(patient_detail_id).m_pd_lastName = (inst_textbox_lastName).m_textbox_text;
	(patient_detail_id).m_pd_billing_name = (inst_textbox_provName).m_textbox_text;
	
	grid = controller.m_ds_datagrid;
	
	
	repeat (new_record_count) {
		row = controller.m_ds_rowcount;
		ds_grid_set(grid, row, dgc.data_id, row); //row used as unique ID
		
		var cpt_code = new_record_array[new_record_count-1];
		with (cpt_code) {	
			ds_grid_set(grid, row, dgc.cpt_code, m_cpt_code);
			ds_grid_set(grid, row, dgc.settled, false);
			ds_grid_set(grid, row, dgc.charge, m_cpt_charge);
			ds_grid_set(grid, row, dgc.max_payment, "N/A");
		}
		with (patient_detail_id) {
			ds_grid_set(grid, row, dgc.first_name, m_pd_firstName);
			ds_grid_set(grid, row, dgc.last_name, m_pd_lastName);
			ds_grid_set(grid, row, dgc.bill_name, m_pd_billing_name);
		}
		with (cpt_code) {
			ds_grid_set(grid, row, dgc.from_date, m_cpt_fromDate);
			ds_grid_set(grid, row, dgc.to_date, m_cpt_toDate);
			ds_grid_set(grid, row, dgc.date_of_service, "");
			ds_grid_set(grid, row, dgc.date_of_loss, "");
				
			ds_grid_set(grid, row, dgc.modifiers, m_cpt_modifiers);
			ds_grid_set(grid, row, dgc.units, m_cpt_units);
			ds_grid_set(grid, row, dgc.place_code, m_cpt_placeCode);
			ds_grid_set(grid, row, dgc.prov_id, m_cpt_provID);
		}
		with (patient_detail_id) {
			var addr;
			addr = string(m_pd_bill_addr1 + "\n" + m_pd_bill_addr2); //addr fields concat
			ds_grid_set(grid, row, dgc.bill_address, addr);
			ds_grid_set(grid, row, dgc.bill_phone, m_pd_bill_phone);
			ds_grid_set(grid, row, dgc.fedTIN, m_pd_fedTIN);
			ds_grid_set(grid, row, dgc.phys_sig, m_pd_phys_sig);	
		}
		ds_grid_set(grid, row, dgc.na_case_id, "N/A");
		ds_grid_set(grid, row, dgc.na_bill_id, "N/A");

		controller.m_ds_rowcount += 1;
		new_record_count -= 1;
	}
	
	controller.m_grid_changed = true;
	with (obj_PatientDetail) persistent = false;
	with (obj_cptCodeTable) persistent = false;
	with (obj_cptCode) persistent = false;
	//with (obj_cptCode_Settled) persistent = false;
	
	changeGameState( m_button_state_dest, m_button_room_dest);

}