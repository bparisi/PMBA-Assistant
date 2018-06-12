/// @description initialize error popup

event_inherited();
m_optional_flag = false;

m_popup = instance_create_layer(960, 820, "Tooltips", obj_StaticTextDisplay);
with (m_popup) {
	sprite_index = spr_Invalid;
	m_statictext_text = "Some required fields do not have valid formatting";	
	visible = false;
	m_statictext_xoffset = 14;
	m_statictext_yoffset = 20;
	m_statictext_linewidth = 190;
}