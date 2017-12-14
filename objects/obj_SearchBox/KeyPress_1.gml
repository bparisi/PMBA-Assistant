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
		//var row_ct = ds_grid_get(controller.m_ds_metadata, 0, meta.row_count);
		//if (row_ct > 0)
			executeSearch(m_searchbox_text);
	}

}