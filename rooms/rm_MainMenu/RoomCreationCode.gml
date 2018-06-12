var a = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);
pd2("rows: ", a);

//save any new data
if (controller.m_grid_changed) {
	saveToFile(SAVE_FILE_NAME);
	
	controller.m_grid_changed = false;
}

