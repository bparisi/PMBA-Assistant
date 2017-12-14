/// @description Insert description here
// You can write your code in this editor

with (obj_SearchResultsDisplay) {
	
	m_disp_lower = max(m_disp_lower-1, 0);
    m_disp_upper = m_disp_lower+5;
	instance_destroy(obj_DataGridView_Row);
	drawSearchResults(id);
	
}