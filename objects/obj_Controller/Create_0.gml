/// @description

enum gm_state {
	MainMenu, Search, Contact,
	NewRecord, NewRecordSettled, //Patient Details
	CPTEntry_New, CPTEntry_NewSettled, //from clicking AddNewCPTBtn
	CPTEntry_Edit, CPTEntry_EditSettled, //from clicking existing cptCode during new record entry
	EditRecord, //from clicking Edit button in search results
	Import, Import_Confirm
}


//IMPORTANT: This enum represents the fields of the database. Before additions or changes to the order
//			 are made, the current enum must be 'retired' and retitled to the old database version, and
//			 then a new database version must be christened. A conversion script must be written to map
//			 a datagrid constructed with the old enum to the new one, to be used in Game Start loading.
//			 If not, databases created prior to the change will not load properly, and would essentially
//			 be corrupted as soon as their new mixed-up content was saved under the 'new' version.

enum dgc { //data_grid_column
	data_id, record_grouping,
	cpt_code, settled,
	charge, max_payment,
	first_name, last_name,
	bill_name, 
	dos_from, dos_to, //dos = date of service (date of care)
	fedTIN,
	na_bill_id,
	//---SUMMARY^
	date_of_loss, 
	modifiers, units,
	place_code, prov_id,
	bill_address, bill_phone,
	auth_sig,
	na_case_id
}
#macro COLUMN_COUNT 22
#macro SUMMARY_COUNT 12 //the number of columns shown before clicking more details



enum input_mask { //a number supplied to a function so that it knows how to verify input
	cptCode, modifiers, charge, units, 
	date,
	placeOfService, providerID,
	name, address, phone,
	provName, fedtin, authSig,
	NA_bill_id, NA_case_id
}

enum meta { //metadata about the datagrid
	row_count, next_unique_id, next_unique_grouping, database_version
	//the order of these first four should not be changed. In particular, if database_version is moved
	//from its position (3), it will break database file loading for any files created before the change,
	//and moving row_count will break importing of prior files.
}
#macro META_ENUM_SIZE 4

#macro CURRENT_DATABASE_VERSION "BEAR" //new versions must be added to checkValidLoadData()

#macro SAVE_FILE_NAME "vital-data.pvd"

game_state = gm_state.MainMenu;

m_ds_datagrid = noone;
m_ds_metadata = noone;

m_grid_changed = false;
m_record_selected_for_edit = noone;
m_import_completed = false;
validate = false;