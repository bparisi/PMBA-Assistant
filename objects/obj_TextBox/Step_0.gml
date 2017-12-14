/// @description

if (m_tab_selected) {
	if not (window_has_focus()) {
		m_window_lost_focus = true;
	}
	else if (m_window_lost_focus) {
		keyboard_string = m_textbox_text;
		m_window_lost_focus = false;
	}
}