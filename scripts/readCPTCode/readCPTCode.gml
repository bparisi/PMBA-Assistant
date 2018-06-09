///@description reads data from textboxes (specifically in rm_CPTCodeEntry[Settled]) into an obj_cptCode
///@param cpt_inst_id the id of the cpt code object to read data into
///@param settled a flag indicating which of the two rooms (settled or not) we are in

//readCPTCode(cpt_inst_id, settled)

var cpt = argument0;
var settled = argument1;

with (cpt) {
	if (settled) { //only the instance names differ, plus the maxpay extra. in rm_CPTCodeEntrySettled
		m_cpt_code = (inst_textbox_cptCode2).m_textbox_text;
		m_cpt_modifiers = (inst_textbox_modifiers2).m_textbox_text;
		m_cpt_charge = (inst_textbox_charge2).m_textbox_text;
		m_cpt_units = (inst_textbox_units2).m_textbox_text;
		m_cpt_placeCode = (inst_textbox_placeCode2).m_textbox_text;
		m_cpt_provID = (inst_textbox_provID2).m_textbox_text;
		m_cpt_max_payment = (inst_textbox_maxpay).m_textbox_text;
	}
	else { //not settled, in rm_CPTCodeEntry
		m_cpt_code = (inst_textbox_cptCode).m_textbox_text;
		m_cpt_modifiers = (inst_textbox_modifiers).m_textbox_text;
		m_cpt_charge = (inst_textbox_charge).m_textbox_text;
		m_cpt_units = (inst_textbox_units).m_textbox_text;
		m_cpt_placeCode = (inst_textbox_placeCode).m_textbox_text;
		m_cpt_provID = (inst_textbox_provID).m_textbox_text;
	}
}