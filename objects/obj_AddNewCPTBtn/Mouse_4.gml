/// @description change game state to cpt code entry

//set patient detail info to whatever is in the text boxes
if (controller.game_state == gm_state.NewRecord) {
	with (obj_PatientDetail) readPatientDetails(id, false);
	changeGameState(gm_state.CPTEntry_New, rm_CPTCodeEntry);
}
else if (controller.game_state == gm_state.NewRecordSettled) {
	with (obj_PatientDetail) readPatientDetails(id, true);
	changeGameState(gm_state.CPTEntry_NewSettled, rm_CPTCodeEntrySettled);
}

