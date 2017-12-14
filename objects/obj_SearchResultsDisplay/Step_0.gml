/// @description 


if (m_scroll_enabled)
{
    if (mouse_wheel_up())
    {
        m_disp_lower = max(m_disp_lower-1, 0);
        m_disp_upper = m_disp_lower+5;
		instance_destroy(obj_DataGridView_Row);
		drawSearchResults(id);
    }
    else if (mouse_wheel_down())
    {
        m_disp_upper = min(m_disp_upper+1, ds_list_size(m_results_list));
        m_disp_lower = m_disp_upper-5;
		instance_destroy(obj_DataGridView_Row);
		drawSearchResults(id);
    }
	
}