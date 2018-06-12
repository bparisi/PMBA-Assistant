
//fill in all textboxes with information from the datagrid
var index = controller.m_record_selected_for_edit;

inst_textbox_firstName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.first_name);
inst_textbox_lastName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.last_name);
inst_textbox_provName3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_name);
inst_textbox_billAddr3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_address);
inst_textbox_billPhone3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.bill_phone);
inst_textbox_authSig3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.auth_sig);
inst_textbox_fedTIN3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.fedTIN);
inst_textbox_fromDate3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.dos_from);
inst_textbox_toDate3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.dos_to);
inst_textbox_cptCode3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.cpt_code);
inst_textbox_charge3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.charge);
inst_textbox_maxpay3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.max_payment);
inst_textbox_modifiers3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.modifiers);
inst_textbox_placeCode3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.place_code);
inst_textbox_units3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.units);
inst_textbox_provID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.prov_id);
inst_textbox_dol3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.date_of_loss);
inst_textbox_billID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.na_bill_id);
inst_textbox_caseID3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.na_case_id);
inst_textbox_origpay3.m_textbox_text = ds_grid_get(controller.m_ds_datagrid, index, dgc.original_payment);

var negtype = ds_grid_get(controller.m_ds_datagrid, index, dgc.neg_type);

with (obj_XSelect) {
	if (m_xselect_select_id == negtype) m_xselect_selected = true;
	else m_xselect_selected = false;
}

if (negtype == ntype.appeal) inst_textbox_origpay3.m_textbox_state = 0;

with (obj_TabHandler) {
	m_tab_current = -1;
	m_tab_room_max_tabs = 20;
}

validateAll();