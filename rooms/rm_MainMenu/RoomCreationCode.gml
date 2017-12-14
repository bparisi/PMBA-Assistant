if (controller.m_grid_changed) {
	
	//save the new data
	var file;
	file = file_text_open_write(working_directory + "vital-data.txt");
	file_text_write_string(file, ds_grid_write(controller.m_ds_datagrid));
	file_text_writeln(file);
	file_text_write_string(file, ds_grid_write(controller.m_ds_metadata));
	file_text_writeln(file);
	file_text_close(file);
	
	controller.m_grid_changed = false;
}
