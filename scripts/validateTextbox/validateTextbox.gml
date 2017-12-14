///@description calls validateField on a textbox and changes its state accordingly
///@param id the index of the textbox to validate

//validateTextbox(id)

var textbox = argument0;

with (textbox) {
	if (validateField(m_textbox_text, m_textbox_validate_flag)) {
		if (m_textbox_state < 3) //not optional
			m_textbox_state = 1;
		else //optional
			m_textbox_state = 4;
	}
	else {
		if (m_textbox_state < 3) //not optional
			m_textbox_state = 2;
		else //optional
			m_textbox_state = 5;
	}
}