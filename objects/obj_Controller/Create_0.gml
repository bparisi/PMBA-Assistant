/// @description

enum gm_state {
	MainMenu, Search, Contact,
	NewRecord, NewRecordSettled, EditRecord,
	CPTEntry_New, CPTEntry_Edit, CPTEntry_NewSettled, CPTEntry_EditSettled
	
}


enum dgc { //data_grid_column
	data_id, 
	cpt_code, settled,
	charge, max_payment,
	first_name, last_name,
	bill_name, 
	from_date, to_date,
	na_bill_id,
	date_of_service,
	//---SUMMARY^
	record_grouping,
	date_of_loss, 
	modifiers, units,
	place_code, prov_id,
	bill_address, bill_phone,
	fedTIN, phys_sig,
	na_case_id
}
#macro COLUMN_COUNT 23
#macro SUMMARY_COUNT 12 //the number of columns shown before clicking more details



enum input_mask { //a number supplied to a function so that it knows how to verify input
	cptCode, modifiers, charge, units, 
	date,
	placeOfService, providerID,
	name, address, phone,
	provName, fedtin, physSig,
	NA_bill_id, NA_case_id
}

enum meta { //metadata about the datagrid
	row_count, next_unique_id, next_unique_grouping
}
#macro META_ENUM_SIZE 3

game_state = gm_state.MainMenu;

//eventually need to create a size-doubling check
m_ds_datagrid = ds_grid_create(2500, COLUMN_COUNT);
m_ds_metadata = ds_grid_create(1, META_ENUM_SIZE);
m_grid_changed = false;

m_record_selected_for_edit = noone;
validate = false;