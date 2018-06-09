///@description save the central datagrid and metadatagrid to a file
///@param filepath

// SaveToFile(filepath)

//changing this script (from the order of datagrid first, metadata second)
//will have repercussions for all save data created prior to the change.


var fp = argument0;

var file;

file = file_text_open_write(fp);
file_text_write_string(file, ds_grid_write(controller.m_ds_datagrid));
file_text_writeln(file);
file_text_write_string(file, ds_grid_write(controller.m_ds_metadata));
file_text_writeln(file);
file_text_close(file);