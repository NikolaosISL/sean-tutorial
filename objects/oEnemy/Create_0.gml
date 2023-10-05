/// @description Insert description here

vsp = 0;
grv = 0.1;
walksp = 3;
hsp = walksp;

hp = 4;
flash = 0;
hitFrom = 0;

if (hasweapon)
{
	mygun = instance_create_layer(x, y, "Gun", oEGun);
	with (mygun)
	{
		owner = other.id;
	}
}
else
{
	mygun = noone;
}