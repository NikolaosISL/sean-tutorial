/// @description Insert description here

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (place_meeting(x, y, pShootable))
{
	with (other)
	{
		hp--;
		flash = 3;
		hitFrom = other.direction;
	}
	
	instance_destroy();
}

if (place_meeting(x, y, oWall) && image_index != 0)
{
	while(place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	
	instance_change(oHitspark, true);
}