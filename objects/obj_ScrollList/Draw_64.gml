/// @description 
draw_set_font(-1);
draw_set_color(c_white);

if (showList)
{
    var x1 = 20;
    var x2 = 120;
   
    for (var i = 0; i < 10; i++)
    {
        var pos = lowerPos + i;
        var y1 = 20 + i * 20;
        var y2 = y1+19;
        draw_rectangle(x1, y1, x2, y2, 1);
       
        var entry = list[pos];
        draw_text(20, y1, string(entry));
       
        if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2))
        {   
            draw_rectangle(x1+1, y1+1, x2-1, y2-1, 1);
            if (mouse_check_button_pressed(mb_left))
            {
                showList = false;
                selectedValue = list[pos];
            }
        }
    }
}

draw_text(140, 20, "selected: " + string(selectedValue));