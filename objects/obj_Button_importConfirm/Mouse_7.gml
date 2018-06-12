///@desc actually merge import data

if (m_button_click_capture) {
	
	//get all the grids locally
	var grid = controller.m_ds_datagrid;
	var metadata = controller.m_ds_metadata;
	with (obj_Button_pickImportData) {
		var import_grid = m_ds_import_grid;
		var import_metadata = m_ds_import_metadata;
	}

	//sum rows of import grid and rows of current grid and check new size vs load factor
	var existing_row_ct = metadata[# 0, meta.row_count];
	var import_row_ct = import_metadata[# 0, meta.row_count];
	var new_size = existing_row_ct + import_row_ct;
	var db_total_size = ds_grid_width(grid);

	if (new_size / db_total_size > 0.7) {
		pd2("resizing DB for import data -> from " + string(db_total_size), " to " + string(new_size*2));
		var temp = ds_grid_create(new_size * 2, COLUMN_COUNT);
		//copy existing data to the new, larger grid before the merge
		ds_grid_set_grid_region(temp, grid, 0, 0, existing_row_ct-1, COLUMN_COUNT-1, 0, 0);
		ds_grid_destroy(grid);
		controller.m_ds_datagrid = temp; //replace global reference
		grid = controller.m_ds_datagrid; //replace  local reference
	}

	//go through import grid and change data ids and record groupings
	var next_id = metadata[# 0, meta.next_unique_id];
	var next_group = metadata[# 0, meta.next_unique_grouping];
	var import_group_tracker = import_grid[# 0, dgc.record_grouping]; //used to know when to increment next_group

	for (var i = 0; i < import_row_ct; i++) {
		import_grid[# i, dgc.data_id] = next_id;
		next_id++;
	
		//If we've reached a new record grouping in import data, update the tracker and increment next_group
		//Won't happen the first time due to initialized value above
		if (import_grid[# i, dgc.record_grouping] != import_group_tracker) {
			import_group_tracker = import_grid[# i, dgc.record_grouping];
			next_group++;
		}
		import_grid[# i, dgc.record_grouping] = next_group;
	}
	next_group++; //necessary because assignment comes after increment inside the loop


	//append rows to the current grid
	ds_grid_set_grid_region(grid, import_grid, 0, 0, import_row_ct-1, COLUMN_COUNT-1, existing_row_ct, 0);

	//update current datagrid metadata
	metadata[# 0, meta.row_count] = new_size;
	metadata[# 0, meta.next_unique_id] = next_id;
	metadata[# 0, meta.next_unique_grouping] = next_group;


	//set controller flags to save the new grids and show a confirmation message
	controller.m_grid_changed = true;
	controller.m_import_completed = true;

	//change game state
	room_set_persistent(rm_Import, false);
	import_btn.persistent = false;
	pd2("Database ", "Imported");
	changeGameState(m_button_state_dest, m_button_room_dest);
	
}