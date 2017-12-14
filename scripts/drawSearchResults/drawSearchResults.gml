///@desc draws or refreshes display of datagridview_rows
///@param results_display the obj_SearchResultsDisplay containing the search results

//drawSearchResults(results_display)


var results_disp = argument0;

instance_destroy(obj_ResultsDispDownArrow);
instance_destroy(obj_ResultsDispUpArrow);

with (results_disp) {
	var num_results = ds_list_size(m_results_list);
	var index;
	
	if (num_results < 6) {
		
		m_scroll_enabled = false;
		for (var i = 0; i < num_results; i++) {
			index = ds_list_find_value(m_results_list, i);
			createDGRFromIndex(index, 64, y+120*i);
		}
		
	}
	
	else { //more than one page of results
		
		m_scroll_enabled = true;
		var list_pos;
		
		for (var i = 0; i < 5; i++) {
		
			list_pos = m_disp_lower + i;
			index = ds_list_find_value(m_results_list, list_pos);
			createDGRFromIndex(index, 64, y+120*i);
		
		}
		
		if (m_disp_lower > 0) {
			instance_create_layer(1400, 400, "Instances", obj_ResultsDispUpArrow);	
		}
		if (m_disp_upper < num_results) {
			instance_create_layer(1400, 900, "Instances", obj_ResultsDispDownArrow);	
		}
	}
}