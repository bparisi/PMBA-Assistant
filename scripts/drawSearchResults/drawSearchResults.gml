///@desc draws or refreshes display of datagridview_rows
///@param results_display the obj_SearchResultsDisplay that will display the results

//drawSearchResults(results_display)

//NOTE: the SearchResultsDisplay being passed in MUST have had its m_results_grid already set!

var results_disp = argument0;

var edit = results_disp.m_results_allow_edits;

instance_destroy(obj_ResultsDispDownArrow);
instance_destroy(obj_ResultsDispUpArrow);

with (results_disp) {
	var num_results = ds_list_size(m_results_list);
	var index;
	
	if (num_results < 6) {
		
		m_scroll_enabled = false;
		for (var i = 0; i < num_results; i++) {
			index = ds_list_find_value(m_results_list, i);
			createDGRFromIndex(m_results_grid, index, 64, y+120*i, edit);
		}
		
	}
	
	else { //more than one page of results
		
		m_scroll_enabled = true;
		var list_pos;
		
		for (var i = 0; i < 5; i++) {
		
			list_pos = m_disp_lower + i;
			index = ds_list_find_value(m_results_list, list_pos);
			createDGRFromIndex(m_results_grid, index, 64, y+120*i, edit);
		
		}
		
		if (m_disp_lower > 0) {
			instance_create_layer(x + 1340, y + 20, "Instances", obj_ResultsDispUpArrow);	
		}
		if (m_disp_upper < num_results) {
			instance_create_layer(x + 1340, y + 540, "Instances", obj_ResultsDispDownArrow);	
		}
	}
}