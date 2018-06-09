if (ds_grid_get(controller.m_ds_metadata, 0, meta.row_count) == 0) {
	var popup = instance_create_layer(1216, 140, "Instances", obj_StaticTextDisplay);
	with (popup) {
		sprite_index = spr_Invalid;
		m_statictext_text = "No saved records were found";
	}
}