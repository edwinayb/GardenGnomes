package;

import flixel.addons.text.FlxTextField;
import ui.FireTongueEx;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var tongue:FireTongueEx;
	
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, MenuState, 1.00, 60, 60, true));
	}
}