/// @description 

if (keyboard_check_pressed(vk_tab)) {	
	m_tab_current += 1;
	if (m_tab_current == m_tab_room_max_tabs) m_tab_current = 0;
	
	with (obj_TabSelectable) m_tab_selected = false;
	with (obj_TabSelectable) {
		if (m_tab_order == other.m_tab_current) {
			m_tab_selected = true;
			if (instanceIsObject(id, obj_MultiLineTextBox)) keyboard_string = m_textbox_text;
			if (instanceIsObject(id, obj_Textbox)) {
				keyboard_string = m_textbox_text;
				
				//toDate autocompletion
				//in general we don't need to check state as the labels only appear in the right states.
				//but, we don't want the tab autocomplete when just editing a record.
				if (controller.game_state != gm_state.EditRecord) {
					var copyString;
					//Did we just tab to toDate?
					if (m_textbox_label == "DOS (To)") {
						//then find the fromDate...
						with (obj_TabSelectable) {
							if (instanceIsObject(id, obj_Textbox)) {
								if (m_textbox_label == "DOS (From)") {
									//...and save the contents
									copyString = m_textbox_text;
								}
							}
						}
						//finally, set the contents in toDate
						m_textbox_text = copyString;
					}
				}
			}

		}
		
	}
}