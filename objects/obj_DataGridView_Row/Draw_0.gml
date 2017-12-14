/// @description

draw_set_color(c_white);
draw_set_halign(fa_center);

//id
draw_set_font(font_DGV_20); //medium
draw_text(x - 28, y + 42, m_dgr_id);
		
//cptCode
draw_set_font(font_DGV_28); //big
draw_text(x + 420, y + 30, m_dgr_cptcode);
		
//settled
draw_set_font(font_DGV_14); //small
draw_text(x + 600, y + 42, m_dgr_settled);
		
//charge and max_payment
draw_text(x + 590, y + 16, m_dgr_charge);
draw_text(x + 590, y + 74, m_dgr_maxpay);
		
//first+last name, billing name
draw_set_halign(fa_left);
var name;
name = string(m_dgr_firstName + " " + m_dgr_lastName);
draw_text(x + 30, y + 30, name);
draw_text(x + 30, y + 66, m_dgr_billName);
		
//dates
draw_set_halign(fa_center);
draw_text(x + 780, y + 34, m_dgr_fromDate);
draw_text(x + 780, y + 62, m_dgr_toDate);
draw_text(x + 958, y + 42, m_dgr_dos);