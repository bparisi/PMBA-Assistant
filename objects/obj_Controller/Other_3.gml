/// @description save the data, then destroy the grid

var file;

//write the data structure to be easily loaded in the future
if (m_grid_changed) {
	ds_grid_set(m_ds_datagrid, 0, special_var.rowcount, m_ds_rowcount);

	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(m_ds_datagrid));
	file_text_writeln(file);
	file_text_close(file);
}

ds_grid_destroy(m_ds_datagrid);