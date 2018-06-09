/// @description 

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


//save new data or display errors
if (save_attempt_flag == 1) { //valid
	//this is where data is actually copied to be preserved
	var index = controller.m_record_selected_for_edit;

	ds_grid_set(controller.m_ds_datagrid, index, dgc.first_name, inst_textbox_firstName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.last_name, inst_textbox_lastName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_name, inst_textbox_provName3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_address, inst_textbox_billAddr3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.bill_phone, inst_textbox_billPhone3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.auth_sig, inst_textbox_authSig3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.fedTIN, inst_textbox_fedTIN3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.dos_from, inst_textbox_fromDate3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.dos_to, inst_textbox_toDate3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.cpt_code, inst_textbox_cptCode3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.charge, inst_textbox_charge3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.max_payment, inst_textbox_maxpay3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.modifiers, inst_textbox_modifiers3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.place_code, inst_textbox_placeCode3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.units, inst_textbox_units3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.prov_id, inst_textbox_provID3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.date_of_loss, inst_textbox_dol3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.na_bill_id, inst_textbox_billID3.m_textbox_text);
	ds_grid_set(controller.m_ds_datagrid, index, dgc.na_case_id, inst_textbox_caseID3.m_textbox_text);

	//save the new data
	saveToFile(SAVE_FILE_NAME)
	
	controller.m_record_selected_for_edit = noone;
	changeGameState(m_button_state_dest, m_button_room_dest);

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