/// @description save the data, then destroy the grid

var file;

//write the data structure to be easily loaded in the future
if (m_grid_changed) {
	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(m_ds_datagrid));
	file_text_writeln(file);
	file_text_write_string(file, ds_grid_write(m_ds_metadata));
	file_text_writeln(file);
	file_text_close(file);
}

ds_grid_destroy(m_ds_datagrid);
ds_grid_destroy(m_ds_metadata);