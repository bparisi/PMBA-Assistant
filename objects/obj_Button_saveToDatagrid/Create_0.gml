/// @description initialize error popup

event_inherited();
m_optional_flag = false;

m_popup = instance_create_layer(960, 820, "Tooltips", obj_StaticTextDisplay);
with (m_popup) {
	sprite_index = spr_Invalid;
	m_statictext_text = "At least one CPT Code must be added";	
	visible = false;
	m_statictext_xoffset = 14;
	m_statictext_yoffset = 20;
	m_statictext_linewidth = 190;
}


//note: as it stands, once you see "At least one cpt code must be added", there's no way to solve that
//		without leaving the room. So technically you don't have to worry about changing the error from
//		that point, it can just be left to reset.