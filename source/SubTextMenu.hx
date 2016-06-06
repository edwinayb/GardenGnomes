package;

import ui.*;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUISubState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import openfl.Assets;
import openfl.geom.Rectangle;

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
		trace("started");
		
		var Buttooon = new Button(0, 0, _tongue.get("$MISC_OK", "ui"), ClickPlay);
		//Buttooon.screenCenter();
		add(Buttooon);
	}
	
	function ClickPlay()
	{
		
		close();
	}
	
}