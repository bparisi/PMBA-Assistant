/// @description load the data

var file, createString;

if (file_exists(working_directory + "vital-data.txt")) {
	//on Windows, C:/Users/%USERNAME%/AppData/Local/PMBA_Assistant/vital-data.txt
	file = file_text_open_read(working_directory + "vital-data.txt");
	createString = file_text_read_string(file);
	ds_grid_read(m_ds_datagrid, createString);
	file_text_readln(file);
	file_text_close(file);
	m_ds_rowcount = ds_grid_get(m_ds_datagrid, 0, special_var.rowcount);
}
else { //create the (empty) data structure with special row of tracker variables
	
	m_ds_rowcount += 1; //because it should be equal to 0 from the Create event 
	ds_grid_set(m_ds_datagrid, 0, special_var.rowcount, m_ds_rowcount);
	//store the (filled) row count in 0, 0 of the grid
	
	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(m_ds_datagrid));
	file_text_writeln(file);
	file_text_close(file);
}

	
	