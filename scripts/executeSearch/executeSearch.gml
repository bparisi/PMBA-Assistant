///@description search the datagrid for the contents of the searchbox
///@param text the text to search for

//script does not run unless there is at least one record to search

var text = argument0;
var grid = controller.m_ds_datagrid;
var matching_rows = ds_list_create();
 

for (var i = 1; i < controller.m_ds_rowcount; i++) {//outer loop searchs per row
	for (var j = 1; j < COLUMN_COUNT; j++) { //inner loop searches per data piece (not dataid)
		if ( string(grid[# i, j]) == text ||
			 string_pos(text, string(grid[# i, j])) > 0 ) { //if is the string or contains the string
			
			ds_list_add(matching_rows, i);
			break; //out of inner loop
		}
	}
}

var results_grid = inst_datagridview.m_ds_searchresults;
var num_results = ds_list_size(matching_rows);
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

