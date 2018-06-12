/// @description open file dialog

if (visible and m_button_click_capture) { //don't process events if we've hidden the button (in rm_ImportConfirm)
	
	var filename = get_open_filename("PMBA Vital Data File (.pvd)|*.pvd", "");

	

	if (file_exists(filename)) {
		//this does not use the loadFromFile script because we're loading into the import grids
		var file = file_text_open_read(filename);
		var createString = file_text_read_string(file);	
		ds_grid_read(m_ds_import_grid, createString);
		file_text_readln(file);
		createString = file_text_read_string(file);
		ds_grid_read(m_ds_import_metadata, createString);
		file_text_readln(file);
		file_text_close(file);
	}
	else { //file selection canceled
		exit;
	}

	instance_destroy(obj_Button_importNext);
	instance_destroy(obj_DataGridView_Row); //in case prior data has been picked
	instance_destroy(obj_StaticTextDisplay);

	//check validity
	var tests_passed = checkValidLoadData(m_ds_import_grid, m_ds_import_metadata);

	if (tests_passed) {

		var loaded_db_version = ds_grid_get(m_ds_import_metadata, 0, meta.database_version);

		//convert if necessary
		checkDatabaseConversion(loaded_db_version);

		//prepare the list that will inform the display
		var import_list = ds_list_create();
		var import_data_size = ds_grid_get(m_ds_import_metadata, 0, meta.row_count);

		for (var i = 0; i < import_data_size; i++) {
			ds_list_add(import_list, i);
		}

		//display the preview of the data to import
		with (obj_SearchResultsDisplay) {
			//the import_grid has already been set as the datagrid for the Display in the instance
	
			//copy the indices into the results_list and destroy the messenger
			ds_list_copy(m_results_list, import_list);
			ds_list_destroy(import_list);
	
			m_disp_lower = 0;
			m_disp_upper = min(import_data_size, 5);
	
			drawSearchResults(id);
		}
	
		instance_create_layer(1440, 100, "Instances", obj_Button_importNext);
	}
	else {
		with (obj_SearchResultsDisplay) {
			ds_list_clear(m_results_list);
			instance_destroy(obj_ResultsDispDownArrow);
			instance_destroy(obj_ResultsDispUpArrow);
		}
		
		var inst_id = instance_create_layer(600, 400, "Instances", obj_StaticTextDisplay);
		with (inst_id) {
			sprite_index = spr_Invalid_Large;
			m_statictext_text = "Cannot import this file: the data it contains has unexpected structure and it will not be read correctly.";
			m_statictext_linewidth = 380;
			m_statictext_xoffset = 42
			m_statictext_yoffset = 30;

		}
	}

}
