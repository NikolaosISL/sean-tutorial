/// @description Insert description here

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{
		precent = max(0, precent - max((precent / 10), 0.005));
	}
	else
	{
		precent = min(1.2, precent + max(((1 - precent) / 10), 0.005));
	}
	
	if (precent == 1.2 || precent == 0)
	{
		switch(mode)
		{
			case TRANS_MODE.INTRO:
			mode = TRANS_MODE.OFF;
			break;
			
			case TRANS_MODE.NEXT:
			mode = TRANS_MODE.INTRO;
			room_goto_next();
			break;
			
			case TRANS_MODE.GOTO:
			mode = TRANS_MODE.INTRO;
			room_goto(target);
			break;
			
			case TRANS_MODE.RESTART:
			game_restart();
			break;
			
		}
	}
}