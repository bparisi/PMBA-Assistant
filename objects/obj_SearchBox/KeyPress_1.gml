/// @description

if (m_searchbox_selected) {
	var key = keyboard_key;
	if ((key == vk_backspace) ||
		(key == vk_delete) ||
		(key == vk_shift) ||
		((key > 31) && (key < 127)) //printable chars and symbols, A-z, 0-9, space
		) { 
			m_searchbox_text = keyboard_string;
	}
	else if (key == vk_enter) {
		if (!inst_datagridview.m_empty)
			executeSearch(m_searchbox_text);
	}

}