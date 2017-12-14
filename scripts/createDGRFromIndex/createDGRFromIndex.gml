///@desc creates an obj_DataGridView_Row from a given index of the datagrid
///@param i the index to create from
///@param x 
///@param y

//createDGRFromIndex(i, x, y) - returns new inst_id


var index = argument0;
var xx = argument1;
var yy = argument2;

var grid = controller.m_ds_datagrid;

var inst_id = createDataGridView_Row(
				ds_grid_get(grid, index, dgc.data_id),
				ds_grid_get(grid, index, dgc.cpt_code),
				ds_grid_get(grid, index, dgc.settled),
				ds_grid_get(grid, index, dgc.charge),
				ds_grid_get(grid, index, dgc.max_payment),
				ds_grid_get(grid, index, dgc.first_name),
				ds_grid_get(grid, index, dgc.last_name),
				ds_grid_get(grid, index, dgc.bill_name),
				ds_grid_get(grid, index, dgc.from_date),
				ds_grid_get(grid, index, dgc.to_date),
				ds_grid_get(grid, index, dgc.na_bill_id),
				ds_grid_get(grid, index, dgc.date_of_service),
				xx, yy, index);

return inst_id;
