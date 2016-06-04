package;

import ui.*;
import flixel.addons.ui.FlxUISubState;
import flixel.util.FlxColor;

/**
 * ...
 * @author Atilio
 */
class SubTextMenu extends FlxUISubState
{

	override public function create() 
	{
		super.create();
		
		_parentState.persistentDraw = true;
		_parentState.persistentUpdate = false;
		
		var Buttooon = new Button(0, 0, _tongue.get("$MISC_OK", "ui"), ClickPlay);
		//Buttooon.screenCenter();
		add(Buttooon);
		
	}
	
	function ClickPlay()
	{
		close();
	}
	
}