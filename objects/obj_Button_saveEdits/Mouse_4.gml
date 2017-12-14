/// @description 

var save_attempt_flag = 1;
validateAll();
with (obj_Textbox) {
	if (m_textbox_state == 2) save_attempt_flag = 0;
	else if (m_textbox_state == 5 and save_attempt_flag != 0) save_attempt_flag = 2;
}

if (save_attempt_flag == 1) { //valid
	//this is where data is actually copied to be preserved
	var index = controller.m_record_selected_for_edit;

	ds_grid_set(controller.m_ds_datagrid, index, dgc.first_name, inst_textbox_firstName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.last_name, inst_textbox_lastName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_name, inst_textbox_provName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_address, inst_textbox_billAddr3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_phone, inst_textbox_billPhone3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.phys_sig, inst_textbox_physSig3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.fedTIN, inst_textbox_fedTIN3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.from_date, inst_textbox_fromDate3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.to_date, inst_textbox_toDate3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.cpt_code, inst_textbox_cptCode3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.charge, inst_textbox_charge3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.max_payment, inst_textbox_maxpay3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.modifiers, inst_textbox_modifiers3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.place_code, inst_textbox_placeCode3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.units, inst_textbox_units3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.prov_id, inst_textbox_provID3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.date_of_service, inst_textbox_dos3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.date_of_loss, inst_textbox_dol3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.na_bill_id, inst_textbox_billID3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.na_case_id, inst_textbox_caseID3.m_textbox_text);

	//save the new data
	var file;
	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(controller.m_ds_datagrid));
	file_text_writeln(file);
	file_text_close(file);
	
	controller.m_record_selected_for_edit = noone;
	changeGameState(m_button_state_dest, m_button_room_dest);

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