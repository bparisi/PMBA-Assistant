///@description returns true or false if the supplied instance is the supplied object, including inheritance
///@param id the index of the object to check
///@param object the object_index to compare to

//instanceIsObject(id, object) - returns true/false

var index = argument0;
var obj = argument1;

if index == 0 or index == noone or index == undefined {
	return false; //not passed a valid object
	pd2("instanceIsObject returned ", " false due to invalid first argument (not an object)");
}

var par = object_get_parent(index.object_index);

if (index.object_index == obj) return true; //no inheritance necessary

else { //there is a parent
	
	//par = -100 -- supplied instance has no parent
	//par = -1   -- supplied instance no longer exists
	while (par != -100 and par != -1) {
		if (par == obj) return true;
		else par = object_get_parent(par);
	}
	
	//if we reach this point, there was nothing else to check, and nothing was a match
	return false;
}

