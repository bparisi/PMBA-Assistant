///@description search the datagrid for the contents of the searchbox
///@param text the text to search for

//script does not run unless there is at least one record to search

var text = argument0;
var grid = controller.m_ds_datagrid;
var row_ct = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);
var matching_rows = ds_list_create();
 

//search logic
for (var i = row_ct-1; i > -1; i--) {//outer loop searchs per row, back to front so recent items come up first
	for (var j = 2; j < COLUMN_COUNT; j++) { //inner loop searches per data piece (not data_id or record_group)
		if ( string(grid[# i, j]) == text ||
			 string_pos(text, string(grid[# i, j])) > 0 ) { //if is the string or contains the string
			
			ds_list_add(matching_rows, i);
			break; //out of inner loop
		}
	}
}


//pre-display
var num_results = ds_list_size(matching_rows);
instance_destroy(obj_DataGridView_Row);
instance_destroy(obj_EditRecordBtn);


//inform display
with (obj_SearchResultsDisplay) {
	ds_list_copy(m_results_list, matching_rows);
	m_disp_lower = 0;
	m_disp_upper = min(num_results, 5);
	drawSearchResults(id);
}

ds_list_destroy(matching_rows);


/*var results_grid = inst_datagridview.m_ds_searchresults;
inst_datagridview.m_resultgrid_size = num_results;

if (num_results > 0) {
	ds_grid_resize(results_grid, num_results, COLUMN_COUNT);

	var gridrow;

	for (var k = 0; k < num_results; k++) {
		gridrow = ds_list_find_value(matching_rows, k);
	
		//copy a single row at a time into the results_grid
		ds_grid_set_grid_region(results_grid, grid, gridrow, 0, gridrow, COLUMN_COUNT-1, k, 0);
	}
}

ds_list_destroy(matching_rows);*/
