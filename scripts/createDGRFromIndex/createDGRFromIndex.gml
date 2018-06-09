///@desc creates an obj_DataGridView_Row from a given index of the given datagrid (optional edit btn)
///@param grid the grid to retrieve from
///@param i the index to retrieve
///@param x 
///@param y
///@param edit_enabled whether an edit button should be created or not (boolean)

//createDGRFromIndex(grid, i, x, y, edit_enabled) - returns new inst_id


var grid = argument0;
var index = argument1;
var xx = argument2;
var yy = argument3;
var edit = argument4; //true or false

var inst_id = instance_create_layer(xx, yy, "Instances", obj_DataGridView_Row);

with (inst_id) {
	m_dgr_id = ds_grid_get(grid, index, dgc.data_id);
	m_dgr_cptcode = ds_grid_get(grid, index, dgc.cpt_code);
	m_dgr_settled = ds_grid_get(grid, index, dgc.settled);
	m_dgr_charge = ds_grid_get(grid, index, dgc.charge);
	m_dgr_maxpay = ds_grid_get(grid, index, dgc.max_payment);
	m_dgr_firstName = ds_grid_get(grid, index, dgc.first_name);
	m_dgr_lastName = ds_grid_get(grid, index, dgc.last_name);
	m_dgr_billName = ds_grid_get(grid, index, dgc.bill_name);
	m_dgr_fromDate = ds_grid_get(grid, index, dgc.dos_from);
	m_dgr_toDate = ds_grid_get(grid, index, dgc.dos_to);
	m_dgr_fedTIN = ds_grid_get(grid, index, dgc.fedTIN);
	m_dgr_na_bill_id = ds_grid_get(grid, index, dgc.na_bill_id);
}

if (edit) {
	var btn_id = instance_create_layer(xx + 1250, yy + 42, "Instances", obj_EditRecordBtn);
	btn_id.m_edit_index = index;
}

return inst_id;
