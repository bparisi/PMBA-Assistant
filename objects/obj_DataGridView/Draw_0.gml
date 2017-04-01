/// @description

draw_set_color(c_white);
draw_set_halign(fa_center);

if (!m_empty) {
	
	//position the elements of each row
	for (var jjj = 0; jjj < m_resultgrid_size; jjj++) { 
		var base_y_coord = (y + 120*jjj);
		
		//id
		draw_set_font(font_DGV_20); //medium
		draw_text(x + m_positioningx[dgc.data_id], base_y_coord + m_positioningy[dgc.data_id],
					m_ds_searchresults[# jjj, dgc.data_id]);
		
		//cptCode
		draw_set_font(font_DGV_28); //big
		draw_text(x + m_positioningx[dgc.cpt_code], base_y_coord + m_positioningy[dgc.cpt_code],
					m_ds_searchresults[# jjj, dgc.cpt_code]);
		
		//settled
		draw_set_font(font_DGV_14); //small
		draw_text(x + m_positioningx[dgc.settled], base_y_coord + m_positioningy[dgc.settled],
					m_ds_searchresults[# jjj, dgc.settled]);
		
		//charge and max_payment
		draw_text(x + m_positioningx[dgc.charge], base_y_coord + m_positioningy[dgc.charge],
					m_ds_searchresults[# jjj, dgc.charge]);
		draw_text(x + m_positioningx[dgc.max_payment], base_y_coord + m_positioningy[dgc.max_payment],
					m_ds_searchresults[# jjj, dgc.max_payment]);
		
		//first+last name, billing name
		draw_set_halign(fa_left);
		var name;
		name = string(m_ds_searchresults[# jjj, dgc.first_name] + " " + m_ds_searchresults[# jjj, dgc.last_name]);
		draw_text(x + m_positioningx[dgc.first_name], base_y_coord + m_positioningy[dgc.first_name], name);
		draw_text(x + m_positioningx[dgc.bill_name], base_y_coord + m_positioningy[dgc.bill_name],
					m_ds_searchresults[# jjj, dgc.bill_name]);
		
		//dates
		draw_set_halign(fa_center);
		draw_text(x + m_positioningx[dgc.from_date], base_y_coord + m_positioningy[dgc.from_date],
					m_ds_searchresults[# jjj, dgc.from_date]);
		draw_text(x + m_positioningx[dgc.to_date], base_y_coord + m_positioningy[dgc.to_date],
					m_ds_searchresults[# jjj, dgc.to_date]);
		draw_text(x + m_positioningx[dgc.date_of_service], base_y_coord + m_positioningy[dgc.date_of_service],
					m_ds_searchresults[# jjj, dgc.date_of_service]);
	}
	if (m_resultgrid_size == 0) {
		draw_set_font(font_DGV_28);
		draw_set_halign(fa_left);
		draw_text(x + 80, y + 20, "No records match that query");
	}
}
else {
	draw_text(x, y, "There are no saved records");
}