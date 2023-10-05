/// @description Insert description here
if (hasControl)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"));
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//collision:
canjump -= 1;
if (canjump > 0 && key_jump)
{
	audio_play_sound(snLanding, 0, false);
	vsp = -7;
	canjump = 0;
}

if place_meeting(x+hsp, y, oWall)
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

if place_meeting(x, y+vsp, oWall)
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// animation:
if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sPlayerA;
	
	if (vsp > 0)
	{
		image_index = 0;
	}
	else
	{
		image_index = 1;
	}
}
else if (move != 0)
{
	if (sprite_index == sPlayerA)
	{
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	canjump = 10;
	sprite_index = sPlayerR;
}
else
{
	if (sprite_index == sPlayerA)
	{
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	canjump = 10;
	sprite_index = sPlayer;
}

if (hsp != 0)
{
	image_xscale = -sign(hsp);
}