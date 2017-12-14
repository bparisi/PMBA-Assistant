///@desc constructor for obj_DataGridView_Row
///@param id
///@param cpt the cpt code
///@param settled true/false has the case been settled
///@param charge
///@param maxpay maximum payment of client after settling
///@param firstName
///@param lastName
///@param billName name of billing provider of client
///@param fromDate date care from
///@param toDate date care to
///@param billID NA Bill ID
///@param dos date of service
///@param x
///@param y
///@param index index of row in the datagrid


var ident = argument0;
var cpt = argument1;
var sett = argument2;
var chrg = argument3;
var mxpy = argument4;
var first = argument5;
var last = argument6;
var provName = argument7;
var frmDt = argument8;
var toDt = argument9;
var billID = argument10;
var dateofservice = argument11;
var xx = argument12;
var yy = argument13;
var index = argument14;


var inst_id = instance_create_layer(xx, yy, "Instances", obj_DataGridView_Row);

with (inst_id) {

	m_dgr_id = ident;
	m_dgr_cptcode = cpt;
	m_dgr_settled = sett;
	m_dgr_charge = chrg;
	m_dgr_maxpay = mxpy;
	m_dgr_firstName = first;
	m_dgr_lastName = last;
	m_dgr_billName = provName;
	m_dgr_fromDate = frmDt;
	m_dgr_toDate = toDt;
	m_dgr_na_bill_id = billID;
	m_dgr_dos = dateofservice;
	
}

var btn_id = instance_create_layer(xx + 1100, yy + 42, "Instances", obj_EditRecordBtn);

with (btn_id) {
	m_edit_index = index;
}

return inst_id;