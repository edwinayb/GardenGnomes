package;

import ui.Button;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIText;
import flixel.addons.ui.FlxUISprite;
import openfl.Lib;

class MenuState extends FlxState
{
	
	override public function create():Void
	{
		super.create();
		/*var text = new FlxUIText(0, 0, 0, "Click me!");
		var Button1 = new FlxUIButton(0, 0, "", ClickPlay, false);
		Button1.setLabelFormat("Arial", 20, 0x000000, CENTER);
		Button1.loadGraphicSlice9(["assets/images/sheet_button.png"], Math.ceil(text.width) + 10, Math.ceil(text.height) + 10, [[10, 10, 40, 40]], null, -1, false, 49, 49);
		Button1.setLabel(text);
        Button1.autoCenterLabel();
		Button1.screenCenter();
        add(Button1);*/
		
		var Buttooon = new Button(0, 0, "hellooooooooooooooo\n lol \n", ClickPlay);
		Buttooon.screenCenter();
		add(Buttooon);
		
		
		
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function ClickPlay():Void
	{
		
	}
}