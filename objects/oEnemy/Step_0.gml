/// @description Insert description here

vsp = vsp + grv;

if (grounded && afraidofheights && !place_meeting(x + hsp, y + 1, oWall))
{
	hsp = -hsp;
}

//collision:

if (place_meeting(x, y+1, oWall))
{
	grounded = true;
}
else
{
	grounded = false;
}

if place_meeting(x+hsp, y, oWall)
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
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

if (hsp != 0)
{
	sprite_index = sEnemyR;
}
else
{
	sprite_index = sEnemy;
}

if (hsp > 0)
{
	image_xscale = 1 * size;
}
else
{
	image_xscale = -1 * size;
}

image_yscale = size;