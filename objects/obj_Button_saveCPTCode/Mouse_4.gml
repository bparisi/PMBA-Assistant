/// @description 

var new_id;

new_id = instance_create_layer(0, 0, "Instances", obj_DataGridRow);

with (new_id) {
	//first set the variables from m_patient_detail
	var patient_detail_id = controller.m_patient_detail;
	m_pd_firstName = patient_detail_id.m_pd_firstName;
	m_pd_lastName = patient_detail_id.m_pd_lastName;
	m_pd_billing_name = patient_detail_id.m_pd_billing_name;
	m_pd_billing_addr1 = patient_detail_id.m_pd_billing_addr1;
	m_pd_billing_addr2 = patient_detail_id.m_pd_billing_addr2;
	m_pd_billing_phone = patient_detail_id.m_pd_billing_phone;
	m_pd_fedTIN = patient_detail_id.m_pd_fedTIN;
	m_pd_phys_sig = patient_detail_id.m_pd_phys_sig;
	
	//then set the variables unique to an obj_DataGridRow
	m_dgr_fromDate = (inst_textbox_fromDate).m_textbox_text;
	m_dgr_toDate = (inst_textbox_toDate).m_textbox_text;
	m_dgr_cptCode = (inst_textbox_cptCode).m_textbox_text;
	m_dgr_modifiers = (inst_textbox_modifiers).m_textbox_text;
	m_dgr_charge = (inst_textbox_charge).m_textbox_text;
	m_dgr_units = (inst_textbox_units).m_textbox_text;
	m_dgr_placeCode = (inst_textbox_placeofService).m_textbox_text;
	m_dgr_provID = (inst_textbox_provID).m_textbox_text;
}

controller.m_new_case_ids[controller.m_new_case_count] = new_id;
controller.m_new_case_count += 1;

//normally looping through the grid to save data here
//must concatenate billing_addr 1&2
var row, grid, new_cases;
grid = controller.m_ds_datagrid;
new_cases = controller.m_new_case_count;

//this is where data is actually copied to be preserved
repeat (new_cases) {
	row = controller.m_ds_rowcount;
	//for each new data grid row in m_new_case_ids:
	with (controller.m_new_case_ids[new_cases-1]) {
		var addr;
		addr = string(m_pd_billing_addr1 + "\n" + m_pd_billing_addr2); //addr fields concat
		ds_grid_set(grid, row, dgc.data_id, row); //row used as unique ID
		ds_grid_set(grid, row, dgc.cpt_code, m_dgr_cptCode);
		ds_grid_set(grid, row, dgc.settled, "No");
		ds_grid_set(grid, row, dgc.charge, m_dgr_charge);
		ds_grid_set(grid, row, dgc.max_payment, "N/A");
		ds_grid_set(grid, row, dgc.first_name, m_pd_firstName);
		ds_grid_set(grid, row, dgc.last_name, m_pd_lastName);
		ds_grid_set(grid, row, dgc.bill_name, m_pd_billing_name);
		ds_grid_set(grid, row, dgc.from_date, m_dgr_fromDate);
		ds_grid_set(grid, row, dgc.to_date, m_dgr_toDate);
		ds_grid_set(grid, row, dgc.date_of_service, "N/A");
		ds_grid_set(grid, row, dgc.date_of_loss, "N/A");
		ds_grid_set(grid, row, dgc.bill_address, addr);
		ds_grid_set(grid, row, dgc.bill_phone, m_pd_billing_phone);
		ds_grid_set(grid, row, dgc.modifiers, m_dgr_modifiers);
		ds_grid_set(grid, row, dgc.units, m_dgr_units);
		ds_grid_set(grid, row, dgc.place_code, m_dgr_placeCode);
		ds_grid_set(grid, row, dgc.prov_id, m_dgr_provID);
		ds_grid_set(grid, row, dgc.fedTIN, m_pd_fedTIN);
		ds_grid_set(grid, row, dgc.phys_sig, m_pd_phys_sig);	
		ds_grid_set(grid, row, dgc.na_case_id, "N/A");
		ds_grid_set(grid, row, dgc.na_bill_id, "N/A");
	}
	controller.m_ds_rowcount += 1;
	new_cases -= 1;
}
controller.m_grid_changed = true;
controller.m_new_case_ids = 0;
controller.m_new_case_ids[5] = -404; 
controller.m_new_case_count = 0;


with (obj_PatientDetail) persistent = false;
controller.m_patient_detail = undefined;
with (obj_DataGridRow) persistent = false;

changeGameState( m_button_state_dest, m_button_room_dest);