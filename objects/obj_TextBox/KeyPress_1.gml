/// @description 

if (m_textbox_selected) {
	if (string_length(keyboard_string) < m_textbox_sizeRestriction)
		m_textbox_text = keyboard_string;
	else
		keyboard_string = m_textbox_text;
}