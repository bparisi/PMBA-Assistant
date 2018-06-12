/// @description show or hide hints

with (obj_StaticTextDisplay) visible = not visible;
//hacky temporary workarounds --really hint text should probably subclass StaticTextDisplay
if (controller.game_state == gm_state.NewRecord) {
	inst_alwaysShow.visible = true;
	inst_alwaysShowDOSHint.visible = true;
}
else if (controller.game_state == gm_state.NewRecordSettled) {
	inst_alwaysShow2.visible = true;
	inst_alwaysShowDOSHint2.visible = true;	
}
else if (controller.game_state == gm_state.CPTEntry_New) {
	if (instance_exists(inst_alwaysShowCopyHint))
		inst_alwaysShowCopyHint.visible = true;	
}
else if (controller.game_state == gm_state.CPTEntry_NewSettled) {
	if (instance_exists(inst_alwaysShowCopyHint2))	
		inst_alwaysShowCopyHint2.visible = true;	
}

//also hacky - do not affect error popups
with (obj_Button_saveToDatagrid) m_popup.visible = not m_popup.visible;
with (obj_Button_saveCPTCode) m_popup.visible = not m_popup.visible;
