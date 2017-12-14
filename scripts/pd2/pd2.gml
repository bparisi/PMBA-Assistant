///@desc print-debug-2, for quickly printing two string (perfect for a labeled debug line)
///@param str1 the first string e.g. "frame: "
///@param str2 the second string e.g. spr.frame

//pd2(str1, str2)

var str1, str2;

str1 = string(argument0);
str2 = string(argument1);

var output = str1 + str2;

show_debug_message(output);