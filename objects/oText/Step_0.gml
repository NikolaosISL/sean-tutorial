/// @description Insert description here

letters += spd;
text_current = string_copy(text, 1, letters);

draw_set_font(fMenu);
if (h == 0) h = string_height(text);
w = string_width(text_current);

if (letters >= length && keyboard_check(vk_anykey))
{
	instance_destroy();
	with(oCamera) follow = oPlayer;
}