/// @description

event_inherited(); //tab selectable

m_textbox_text = "";
m_textbox_label = "Label"
m_textbox_fa = fa_left;
m_textbox_sizeRestriction = 10;
m_textbox_state = 0; //0 - unchanged, 1 - valid, 2 - invalid, 3, 4, 5 - optional equivalents
m_textbox_validate_flag = input_mask.date;
m_textbox_width = 140;
m_textbox_default = "";

m_window_lost_focus = false;

//create the validation hint text
m_textbox_hint_text = instance_create_layer(x+18, y-36, "Tooltips", obj_StaticTextDisplay);
with (m_textbox_hint_text) {
	m_statictext_color = $CA3B936E;
	m_statictext_text = other.m_textbox_validhint;
	m_statictext_linewidth = 800;
}
