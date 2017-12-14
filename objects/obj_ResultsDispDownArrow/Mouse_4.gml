/// @description Insert description here
// You can write your code in this editor

with (obj_SearchResultsDisplay) {
	
	m_disp_upper = min(m_disp_upper+1, ds_list_size(m_results_list));
	m_disp_lower = m_disp_upper-5;
	instance_destroy(obj_DataGridView_Row);
	drawSearchResults(id);

}