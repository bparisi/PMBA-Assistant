///@description validates every textbox that currently exists

//validateAll()

with (obj_Textbox) {
	if not (m_textbox_state > 2 and m_textbox_text == m_textbox_default)
		validateTextbox(id);
}