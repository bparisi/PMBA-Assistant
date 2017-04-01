/// @description

enum states {
	MainMenu, NewCase, Search, Contact, PatientDetails
}

current_state = states.MainMenu;


enum special_var { //special variables stored in x=0 of the m_ds_datagrid
	rowcount
}


enum dgc { //data_grid_column
	data_id,
	cpt_code, settled,
	charge, max_payment,
	first_name, last_name,
	bill_name, 
	from_date, to_date,
	date_of_service,
	//---SUMMARY^
	date_of_loss, 
	bill_address, bill_phone,
	modifiers, units,
	place_code, prov_id,
	fedTIN, phys_sig,
	na_case_id, na_bill_id
}
#macro COLUMN_COUNT 22
#macro SUMMARY_COUNT 11 //the number of columns shown before clicking more details



enum input_mask { //a number supplied to a function so that it knows how to verify input
	cptCode, modifiers, charge, units, 
	date,
	placeOfService, providerID,
	name, address, phone,
	provName, fedtin,
	NA_bill_id, NA_case_id
}


//eventually need to create a size-doubling check
m_ds_datagrid = ds_grid_create(2500, COLUMN_COUNT);
m_ds_rowcount = 0;
m_grid_changed = false;
m_new_case_ids[5] = -404; 
m_new_case_count = 0;
m_patient_detail = undefined;