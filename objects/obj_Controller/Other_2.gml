/// @description load the data

if (file_exists(SAVE_FILE_NAME)) {
	//on Windows, C:/Users/%USERNAME%/AppData/Local/PMBA_Assistant/vital-data.pvd
	
	m_ds_datagrid = ds_grid_create(1, 1); //overwritten by ds_grid_read
	m_ds_metadata = ds_grid_create(1, META_ENUM_SIZE); //also overwritten but this will be the size
	
	loadFromFile(SAVE_FILE_NAME);
	
	var loaded_db_version = ds_grid_get(m_ds_metadata, 0, meta.database_version);
	
	checkDatabaseConversion(loaded_db_version); //unimplemented due to only one database version
	
	//load factor (size-doubling) check
	var db_total_size = ds_grid_width(m_ds_datagrid);
	var db_rows_filled = ds_grid_get(m_ds_metadata, 0, meta.row_count);
	
	if (db_rows_filled / db_total_size > 0.7) {
		pd2("doubling size of DB from " + string(db_total_size), " to " + string(db_total_size*2));
		var temp = ds_grid_create(db_total_size * 2, COLUMN_COUNT);
		ds_grid_set_grid_region(temp, m_ds_datagrid, 0, 0, db_rows_filled-1, COLUMN_COUNT-1, 0, 0);
		ds_grid_destroy(m_ds_datagrid);
		m_ds_datagrid = temp;
		saveToFile(SAVE_FILE_NAME); //overwrite the old grid
	}
	
}
else { //no save data found

	m_ds_datagrid = ds_grid_create(10000, COLUMN_COUNT);
	//initialized to all zeroes

	m_ds_metadata = ds_grid_create(1, META_ENUM_SIZE);
	//row_count, next_unique_id, next_unique_grouping all initialized to 0
	m_ds_metadata[# 0, meta.database_version] = CURRENT_DATABASE_VERSION;

	saveToFile(SAVE_FILE_NAME);
}

//NOTE: every row of the datagrid appears to be about 0.5 KB at COLUMN_COUNT = 22.
// 2500 rows ~= 1250KB, 10000 rows ~= 5000KB, etc.
// so eventually, 2 million rows will be about 1 GB if the pattern holds.

	