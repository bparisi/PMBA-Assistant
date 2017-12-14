///@description Used primarily in obj_Buttons.
///@param program_state
///@param room can be undefined to not switch room

//changeGameState(program_state, room)

var program_state, roomID;

program_state = argument0;
roomID = argument1;

controller.game_state = program_state;
if (roomID != undefined) room_goto(roomID);
