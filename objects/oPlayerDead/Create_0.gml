/// @description Insert description here

hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

image_speed = 0;
image_index = 0;

ScreenShake(6, 60);
audio_play_sound(snLanding, 10, false);
game_set_speed(30, gamespeed_fps);
with (oCamera) 
{ 
	follow = other.id;	
}