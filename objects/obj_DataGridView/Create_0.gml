/// @description

var row_ct = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);

if (row_ct > 0) {
	m_empty = false;
	
	/*
	//display all data at search start
	m_ds_searchresults = ds_grid_create(row_ct, COLUMN_COUNT);
	ds_grid_set_grid_region(m_ds_searchresults, controller.m_ds_datagrid, 
							0, 0, row_ct-1, COLUMN_COUNT-1,	0, 0);
	m_resultgrid_size = row_ct;
	*/
	
	m_ds_searchresults = ds_grid_create(1, 1);
	m_resultgrid_size = 0;
	
	//specify the positioning to be used in laying out the grid					
	//mpositioningy holds how far (0-120) off the base_y_coord it should be drawn
	//mpositioningx is absolute position
	m_positioningx[SUMMARY_COUNT-1] = 0; //creates the arrays
	m_positioningy[SUMMARY_COUNT-1] = 0;
	m_positioningx[dgc.data_id] = -28; //x
	m_positioningy[dgc.data_id] = 42; //y
	m_positioningx[dgc.cpt_code] = 420;
	m_positioningy[dgc.cpt_code] = 30;
	m_positioningx[dgc.settled] = 600;
	m_positioningy[dgc.settled] = 42;
	m_positioningx[dgc.charge] = 590;
	m_positioningy[dgc.charge] = 16;
	m_positioningx[dgc.max_payment] = 590;
	m_positioningy[dgc.max_payment] = 74;
	m_positioningx[dgc.first_name] = 30;
	m_positioningy[dgc.first_name] = 30;
	//m_positioningx[dgc.last_name] = 205; irrelevant; combined with first_name
	//m_positioningy[dgc.last_name] = 30;
	m_positioningx[dgc.bill_name] = 30;
	m_positioningy[dgc.bill_name] = 66;
	m_positioningx[dgc.from_date] = 780;
	m_positioningy[dgc.from_date] = 34;
	m_positioningx[dgc.to_date] = 780;
	m_positioningy[dgc.to_date] = 62;
	m_positioningx[dgc.na_bill_id] = 942;
	m_positioningy[dgc.na_bill_id] = 42;
	m_positioningx[dgc.date_of_service] = 1100;
	m_positioningy[dgc.date_of_service] = 42;
}
else {
	m_empty = true;
}