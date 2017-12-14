/// @description 

if (showList)
{
    if (mouse_wheel_up())
    {
        lowerPos = max(lowerPos-1, 0);
        upperPos = lowerPos+10;
    }
    else
    if (mouse_wheel_down())
    {
        upperPos = min(upperPos+1, 99);
        lowerPos = upperPos-10;
    }
}

if (mouse_check_button_pressed(mb_right))
{
    showList = true;
}