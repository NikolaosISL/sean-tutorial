/// @description Insert description here

if (hp <= 0)
{
    ScreenShake(8, 25);
	with(instance_create_layer(x, y, layer, oDead))
	{
		direction = other.hitFrom;
		
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction) - 2;
		image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
	}
	
	with (mygun) instance_destroy();
	instance_destroy();
}