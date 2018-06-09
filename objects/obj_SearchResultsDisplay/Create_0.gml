/// @description This object can take a datagrid and a list of indices and display the values of the rows
///				 at those indices in the datagrid. The display of each individual row is contained within
///				 its own object, and scrolling is enabled by quickly creating and destroying those objects.

m_results_list = ds_list_create(); //a list that will store the indices of the results to show

//m_results_grid = noone; //a reference to the datagrid storing the results at the indices in the results_list
					//set in Object Variables on a per-instance basis
m_disp_upper = 0;
m_disp_lower = 0;

m_scroll_enabled = false;