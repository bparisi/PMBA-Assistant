/// @description

with (obj_TabSelectable) m_tab_selected = false;
m_tab_selected = true; //unselect all textboxes and then select this one
with (obj_TabHandler) m_tab_current = other.m_tab_order;
keyboard_string = m_textbox_text;