///@description given a database version, determines what script to use to convert that 
///				version to the current one, if conversion is necessary.
///@param db_version the database version to check again the current one

//checkDatabaseConversion(db_version)

var dbv = argument0;

if (dbv != CURRENT_DATABASE_VERSION) {
	pd2("Database Error: ", "VERSION MISMATCH"); //temporary
	/*
		Look for conversion scripts
		Conversion scripts should map old db enum versions to the current one
		Once the mapping is complete, save the new datagrid, overwriting the old one.
		But, since this function is used in importing, you can't touch the original grids.
		Then, update the database version in the metagrid
	*/
	
	//temporary (should be generalized away from controller grid specifically)
	controller.m_ds_metadata[# 0, meta.database_version] = CURRENT_DATABASE_VERSION;
}