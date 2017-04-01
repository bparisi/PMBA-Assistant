/// @description

event_inherited();

/// draw text box, optional-style (different frames)
if (!m_textbox_selected) draw_sprite(sprite_index,2,x,y); //draw inactive sprite (frame 2)
else draw_sprite(sprite_index,3,x,y) //draw active sprite (frame 3)