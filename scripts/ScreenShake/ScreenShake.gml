// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(_magnitude,_frames)
{
	with(oCamera)
	{
			if (_magnitude > shake_remain)
			{
				shake_magnitude = _magnitude;

				shake_remain = _magnitude;

				shake_length = _frames;
			}
	}
}