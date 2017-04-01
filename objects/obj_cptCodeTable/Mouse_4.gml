/// @description change game state to cpt code entry

(m_obj_PD_index).m_pd_firstName = (inst_textbox_firstName).m_textbox_text;
(m_obj_PD_index).m_pd_lastName = (inst_textbox_lastName).m_textbox_text;
(m_obj_PD_index).m_pd_billing_name = (inst_textbox_provName).m_textbox_text;

changeGameState(states.CPTEntry, rm_NewCase_2);