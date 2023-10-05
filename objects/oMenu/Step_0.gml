/// @description Insert description here
#macro SAVEFILE "save.sav"

menu_x += (menu_x_target - menu_x) / menu_speed;

if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width + 200;
		menu_commited = menu_cursor;
		ScreenShake(2, 6);
		menu_control = false;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y && mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_item_height * 1.5);
		
		if (mouse_check_button(mb_left))
		{
			menu_x_target = gui_width + 200;
			menu_commited = menu_cursor;
			ScreenShake(2, 6);
			menu_control = false;
		}
	}
	
	menu_cursor = menu_cursor % menu_items;
}

if (menu_commited != -1 && menu_x > gui_width + 150)
{
	switch(menu_commited)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT);
		break;
		case 1:
		if (file_exists(SAVEFILE))
		{
			var file = file_text_open_read(SAVEFILE);
			var target = file_text_read_real(file);
			file_text_close(file);
			SlideTransition(TRANS_MODE.GOTO, target);
		}
		else
		{
			SlideTransition(TRANS_MODE.NEXT);
		}
		break;
		case 0: game_end();
		break;
	}
}