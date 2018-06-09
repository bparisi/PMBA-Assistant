/// @description save the data, then destroy the grids

if (m_grid_changed) {
	saveToFile(SAVE_FILE_NAME);	
}

ds_grid_destroy(m_ds_datagrid);
ds_grid_destroy(m_ds_metadata);