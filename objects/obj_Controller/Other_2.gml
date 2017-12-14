/// @description load the data

var file, createString;

if (file_exists(working_directory + "vital-data.txt")) {
	//on Windows, C:/Users/%USERNAME%/AppData/Local/PMBA_Assistant/vital-data.txt
	file = file_text_open_read(working_directory + "vital-data.txt");
	createString = file_text_read_string(file);
	ds_grid_read(m_ds_datagrid, createString);
	file_text_readln(file);
	createString = file_text_read_string(file);
	ds_grid_read(m_ds_metadata, createString);
	file_text_readln(file);
	file_text_close(file);
}
else { //create the file to store the (empty) data structures

	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(m_ds_datagrid));
	file_text_writeln(file);
	file_text_write_string(file, ds_grid_write(m_ds_metadata));
	file_text_writeln(file);
	file_text_close(file);
}

	
	