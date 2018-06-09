///@description load the central datagrid and metadatagrid from a file
///@param filepath

// loadFromFile(filepath)

//changing this script (from the order of datagrid first, metadata second)
//will have repercussions for all save data created prior to the change.


var fp = argument0;

var file, createString;

file = file_text_open_read(fp);
createString = file_text_read_string(file);
ds_grid_read(controller.m_ds_datagrid, createString);
file_text_readln(file);
createString = file_text_read_string(file);
ds_grid_read(controller.m_ds_metadata, createString);
file_text_readln(file);
file_text_close(file);