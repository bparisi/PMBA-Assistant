/// @description 

if (m_tab_selected) {
	if (keyboard_check_pressed(vk_tab)) exit;
	if (string_length(keyboard_string) < m_textbox_sizeRestriction and keyboard_string != "") {
		m_textbox_text = keyboard_string;
		validateTextbox(id);
	}
	else if (string_length(m_textbox_text) == 1 and keyboard_check_pressed(vk_backspace)) {
		m_textbox_text = "";
		if (m_textbox_state > 2) m_textbox_state = 3;
		else validateTextbox(id);
	}
	else
		keyboard_string = m_textbox_text;
} 