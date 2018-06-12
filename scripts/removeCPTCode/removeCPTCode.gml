///@description removes a cpt code from the cpt code array of obj_PatientDetail
///@param pd_index the obj_PatientDetail where the cpt code array is
///@param cpt_index the index of the array holding the cpt code to remove

//removeCPTCode(pd_index, cpt_index)

var pd = argument0;
var index = argument1;

with (pd) {
	//cpt code count must be at least 1 or a delete button would not have been created
	if (index == m_pd_cptcode_count-1) { //no reshuffle necessary
		instance_destroy(m_pd_cptcode_array[index]);
		m_pd_cptcode_array[index] = 0;
		m_pd_cptcode_count -= 1;
	}
	else if (index > -1 and index < m_pd_cptcode_count-1) { //must reshuffle
		instance_destroy(m_pd_cptcode_array[index]);
		for (var i = index+1; i < m_pd_cptcode_count; i++) {
			m_pd_cptcode_array[i-1] = m_pd_cptcode_array[i];	
		}
		m_pd_cptcode_array[m_pd_cptcode_count-1] = 0;
		m_pd_cptcode_count -= 1;
		
	}
	else { //something is wrong
		pd2("removeCPTCode called with invalid index (out of bounds) --> ", index);	
	}
	
}

drawCPTCodes(pd);