///@description checks various things about a loaded datagrid to ensure that it "looks like" a save file
///				previously created by this program.
///@param import_grid the import datagrid (a ds_grid)
///@param import_metadata the import metadata (a ds_grid)

//checkValidLoadData(import_grid, import_metadata) - returns true (valid) or false

var grid = argument0;
var metagrid = argument1;

/*
check metadata
*/

//grid dimensions
if (ds_grid_width(metagrid) > 1) {
	pd2("DATA IMPORT ERROR: ", "too many rows in metagrid");
	return false;
}
if (ds_grid_height(metagrid) < 4) {
	pd2("DATA IMPORT ERROR: ", "too few columns in metagrid");
	return false;
}

//rowcount
var row_ct = metagrid[# 0, meta.row_count];
if (row_ct < 1) {
	pd2("DATA IMPORT ERROR: ", "no rows to import");
	return false;
}

//db version
var vers = metagrid[# 0, meta.database_version];
switch (vers) {
	//case sensitive!
	case "BEAR":
		break;
	default:
		pd2("DATA IMPORT ERROR: ", "invalid database version (no match found)");
		return false;
}

/*
check datagrid
*/

//should be all zeroes after the index indicated by row_ct
var grid_width = ds_grid_width(grid);
var grid_height = ds_grid_height(grid);
for (var i = row_ct; i < grid_width; i++) { //if row_ct is 20, there should be nothing after index 19
	for (var j = 0; j < grid_height; j++) {
		if (ds_grid_get(grid, i, j) != 0) {
			pd2("DATA IMPORT ERROR: ", "data found outside the bounds indicated by metadata");
			return false;
		}
	}
}


//everything passed
return true;