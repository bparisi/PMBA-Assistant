
//fill in all textboxes with information from the datagrid
var index = controller.m_record_selected_for_edit;

inst_textbox_firstName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.first_name);
inst_textbox_lastName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.last_name);
inst_textbox_provName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_name);
inst_textbox_billAddr3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_address);
inst_textbox_billPhone3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_phone);
inst_textbox_physSig3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.phys_sig);
inst_textbox_fedTIN3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.fedTIN);
inst_textbox_fromDate3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.from_date);
inst_textbox_toDate3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.to_date);
inst_textbox_cptCode3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.cpt_code);
inst_textbox_charge3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.charge);
inst_textbox_maxpay3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.max_payment);
inst_textbox_modifiers3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.modifiers);
inst_textbox_placeCode3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.place_code);
inst_textbox_units3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.units);
inst_textbox_provID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.prov_id);
inst_textbox_dos3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.date_of_service);
inst_textbox_dol3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.date_of_loss);
inst_textbox_billID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.na_bill_id);
inst_textbox_caseID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.na_case_id);


with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 20;
}

validateAll();