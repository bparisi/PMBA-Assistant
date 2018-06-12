///@description validates the text contents of a given field (from input_mask enum)
///@param val the value to validate
///@param input_mask a member of the input_mask enum

//validateField(val, input_mask) - returns true/false

var val = string(argument0);
var mask = argument1;

var char = 0;
var len = string_length(val);
enum ps { //parse states
	one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve}
var current_state = ps.one;
var i, count;
var field_complete = false;

if len == 0 return false;

switch mask {
	
	//either the breaks or the continues are unnecessary, but are left in for clarity of endpoints
	
	case input_mask.name:
		
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isAlphabetic(char)) {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isAlphabetic(char)) {
						current_state = ps.three;
						continue;
					}
					else if (char == ".") {
						current_state = ps.five;
						continue;
					}
					else return false;
					break;
				case ps.three:
					if (isAlphabetic(char)) continue;
					else if (char == "-") {
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.four:
					if (isAlphabetic(char)) {
						current_state = ps.three;
						continue;
					}
					else return false;
					break;
				case ps.five:
					if (isAlphabetic(char)) {
						current_state = ps.six;
						continue;
					}
					else return false;
					break;
				case ps.six:
					if (char == ".") {
						current_state = ps.seven;
						continue;
					}
					else return false;
					break;
				case ps.seven:
					return false; //nothing should come after the second . in, e.g., "A.J."
				
			}
			
		}
		return true; //if we made it thru the for loop without returning false, string is valid
		
		
	case input_mask.provName:
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isAlphaNum(char)) {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isAlphaNum(char) or char == "." or char == "-")
						continue;
					else if (char == " ") {
						current_state = ps.one;
						continue;
					}
					else return false;
					
			}
		}
		return true;
		
	case input_mask.address:
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isAlphaNum(char)) continue;
					else if (char == " ") {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isAlphaNum(char)) {
						current_state = ps.three;
						continue;
					}
					else return false;
					break;
				case ps.three:
					if (isAlphaNum(char)) continue;
					else if (char == " ") {
						current_state = ps.two;
						continue;
					}
					else if (char == ",") {
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.four:
					if (char == " ") {
						current_state = ps.five;
						continue;
					}
					else return false;
					break;
				case ps.five:
					if (isAlphabetic(char)) {
						current_state = ps.six;
						continue;
					}
					else return false;
					break;
				case ps.six:
					if (isAlphabetic(char)) continue;
					else if (char == " ") {
						current_state = ps.five;
						continue;
					}
					else if (char == ",") {
						current_state = ps.seven;
						continue;
					}
					else return false;
					break;
				case ps.seven:
					if (char == " ") {
						current_state = ps.eight;
						count = 0;
						continue;
					}
					else return false;
					break;
				case ps.eight:
					if (count < 2) {
						if (isAlphabetic(char)) {
							count += 1;
							continue;
						}
						else return false;
					}
					else if (count == 2) {
						if (char == " ") {
							current_state = ps.nine;
							count = 0;
							continue;
						}
						else return false;		
					}
					else return false; //should not be reached
					break;
				case ps.nine:
					if (count < 5) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 5) field_complete = true; //complete...
							continue;
						}
						else return false;
					}
					else if (count == 5) { //...unless it keeps going
						if (char == "-") {
							current_state = ps.ten;
							field_complete = false;
							count = 0;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
					break;
				case ps.ten:
					if (count < 4) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 4) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.phone:
		field_complete = false;
		count = 0;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (count < 3) {
						if (isNumeric(char)) {
							count += 1;
							continue;
						}
						else return false;
					}
					else if (count == 3) {
						if (isNumeric(char)) {
							count = 1;
							current_state = ps.two;
							continue;
						}
						else if (char == " " or char == "-") {
							count = 0;
							current_state = ps.two;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
					break;
				case ps.two:
					if (count < 3) {
						if (isNumeric(char)) {
							count += 1;
							continue;
						}
						else return false;
					}
					else if (count == 3) {
						if (isNumeric(char)) {
							count = 1;
							current_state = ps.three;
							continue;
						}
						else if (char == " " or char == "-") {
							count = 0;
							current_state = ps.three;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
					break;
				case ps.three:
					if (count < 4) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 4) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
						
							
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.date:
		count = 0;
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (char == "0") {
						current_state = ps.two;
						continue;
					}
					else if (char == "1") {
						current_state = ps.three;
						continue;
					}
					else if (isNumeric(char)) { //2-9
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isNumeric(char) and char != "0") {
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.three:
					if (char == "0" or char == "1" or char == "2") {
						current_state = ps.four;
						continue;
					}
					else if (char == "/" or char == " " or char == "-") {
						current_state = ps.five;
						continue;
					}
					else return false;
					break;
				case ps.four:
					if (char == "/" or char == " " or char == "-") {
						if (count == 0)	current_state = ps.five;
						else if (count == 1) current_state = ps.eight;
						else return false;
						continue;
					}
					else return false;
					break;
				case ps.five:
					if (char == "0" or char == "1" or char == "2") {
						if (count == "0") count = 1; //count used as a marker that this char was a 0
						current_state = ps.six;
						continue;
					}
					else if (char == "3") {
						current_state = ps.seven;
						continue;
					}
					else if (isNumeric(char) and char != "0") { //4-9
						count = 1;
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.six:
					if (isNumeric(char)) {
						if (count == 1 and char == "0") return false; //double zeros
						count = 1; //now count is being set for state ps.four
						current_state = ps.four;
						continue;
					}
					else if (char == "/" or char == " " or char == "-") {
						if (count == 1) return false; //single zero for 'day'
						current_state = ps.eight;
						continue;
					}
					else return false;
					break;
				case ps.seven:
					if (char == "0" or char == "1") {
						count = 1;
						current_state = ps.four;
						continue;
					}
					else if (char == "/" or char == " " or char == "-") {
						current_state = ps.eight;
						continue;
					}
					else return false;
					break;
				case ps.eight:
					if (char == "1") {
						current_state = ps.nine;
						continue;
					}
					else if (char == "2") {
						count = 1;
						current_state = ps.eleven;
						continue;
					}
					else if (isNumeric(char)) { //must be 2 digit year
						current_state = ps.twelve;
						continue;
					}
					else return false;
					break;
				case ps.nine: //year of 1X or 19XX
					if (isNumeric(char)) {
						if (char == "9") {
							count = 0;
							current_state = ps.ten;
							field_complete = true; //unless there is more to come
							continue;
						}
						else { //0-8, must be 2 digit year
							count = 2;
							current_state = ps.ten; //set count too high purposely
							field_complete = true;  //bc anything further is wrong
							continue;
						}
					}
					else return false;
					break;
				case ps.ten: //year of 19XX
					field_complete = false;
					if (count < 2) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 2) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
					break;
				case ps.eleven: //year of 2X or 2XXX
					if (count < 4) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 2 or count == 4) field_complete = true;
							else if (count == 3) field_complete = false;
							continue;
						}
						else return false;
					}
					else return false;
					break;
				case ps.twelve:
					if (isNumeric(char)) {
						count = 2;
						current_state = ps.ten;
						field_complete = true;
						continue;
					}
					else return false;		
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.cptCode:
		count = 0;
		field_complete = 0;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (count < 3) {
						if (isAlphaNum(char)) {
							count += 1;
							if (count == 3) field_complete = true;
							continue;
						}
						else return false;
					}
					else if (count < 5) {
						field_complete = false;
						if (isAlphaNum(char)) {
							count += 1;
							if (count == 5) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.charge:
		field_complete = false;
		count = 0;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isNumeric(char)) {
						count = 1;
						current_state = ps.two;
						field_complete = true;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (count < 4) { //still might get a separator
						if (isNumeric(char)) {
							count += 1; //field_complete still true
							if (count == 4) current_state = ps.three;
							continue;
						}
						else if (char == ".") {
							count = 0;
							field_complete = false;
							current_state = ps.four;
							continue;
						}
						else if (char == ",") {
							count = 0;
							field_complete = false;
							current_state = ps.five;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
					break;
				case ps.three: //commas no longer allowed
					if (isNumeric(char)) continue; //field_complete still true
					else if (char == ".") {
						count = 0;
						field_complete = false;
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.four:
					if (count < 2) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 2) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
					break;
				case ps.five:
					if (count < 3) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 3) field_complete = true;
							continue;
						}
						else return false;
					}
					else if (count == 3) {
						field_complete = false;
						if (char == ",") {
							count = 0;
							continue;
						}
						else if (char == ".") {
							count = 0;
							current_state = ps.four;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
						
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.units:
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isNumeric(char) and char != "0") {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isNumeric(char)) continue;
					else return false;
			}
		}
		return true;
		
	case input_mask.modifiers:
		count = 0;
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (count < 10) {
						if (isAlphaNum(char)) {
							count += 1;
							if (count % 2 == 0) {
								field_complete = true;
								current_state = ps.two;
							}
							continue;
						}
						else return false;
					}
					else return false;
					break;
				case ps.two:
					if (char == " ") {
						current_state = ps.one;
						field_complete = false;
						continue;
					}
					else return false;	
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.placeOfService:
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isNumeric(char)) continue;
					else return false;
			}
		}
		return true;
		
	case input_mask.providerID:
	case input_mask.fedtin:
		count = 0;
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (count < 10) {
						if (isNumeric(char)) {
							count += 1;
							if (count > 8) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.authSig:
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isAlphabetic(char)) {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (isAlphabetic(char))	continue;
					else if (char == "-") {
						current_state = ps.one;
						continue;
					}
					else if (char == " ") {
						current_state = ps.three;
						continue;
					}
					else if (char == ",") {
						current_state = ps.five;
						continue;
					}
					else return false;
					break;
				case ps.three:
					if (isAlphabetic(char)) {
						current_state = ps.four;
						continue;
					}
					else return false;
					break;
				case ps.four:
					if (isAlphabetic(char)) continue;
					else if (char == "-" or char == " ") {
						current_state = ps.three;
						continue;
					}
					else return false;
					break;
				case ps.five:
					if (char == " ") {
						current_state = ps.three;
						continue;
					}
					else return false;
			}
		}
		return true;
		
	case input_mask.NA_bill_id:
		count = 0;
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (isNumeric(char) or char == "P") {
						current_state = ps.two;
						continue;
					}
					else return false;
					break;
				case ps.two:
					if (count < 6) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 6) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
			}
		}
		if (field_complete) return true; else return false;
		
	case input_mask.NA_case_id:
		count = 0;
		field_complete = false;
		for (i = 1; i < len+1; i++) {
			char = string_char_at(val, i);
			switch (current_state) {
				case ps.one:
					if (count < 4) {
						if (isAlphabetic(char)) {
							count += 1;
							continue;
						}
						else return false;
					}
					else if (count == 4) {
						if (char == "-") {
							current_state = ps.two;
							count = 0;
							continue;
						}
						else return false;
					}
					else return false; //should not be reached
					break;
				case ps.two:
					if (count < 8) {
						if (isNumeric(char)) {
							count += 1;
							if (count == 8) field_complete = true;
							continue;
						}
						else return false;
					}
					else return false;
			}
		}
		if (field_complete) return true; else return false;
		
	default:
		pd2("validateField called with invalid input_mask: ", mask);
		return false;
}