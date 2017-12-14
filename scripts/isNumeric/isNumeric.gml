///@description returns true if a string is made up of only alphanumeric characters, false otherwise
///@param str

//isAlphaNum(str) - returns true/false

var str = argument0;

if (string_length(str) > string_length(string_digits(str))) return false;
else return true;