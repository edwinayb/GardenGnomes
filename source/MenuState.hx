package;

import ui.*;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIText;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUIList;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.FlxG;
import openfl.Lib;

class MenuState extends FlxUIState
{
	
	override public function create()
	{
		if (Main.tongue == null)
		{
			Main.tongue = new FireTongueEx();
			Main.tongue.init("en-GB");
			FlxUIState.static_tongue = Main.tongue;
		}
		super.create();
		
		/*var text = new FlxUIText(0, 0, 0, "Click me!");
		var Button1 = new FlxUIButton(0, 0, "", ClickPlay, false);
		Button1.setLabelFormat("Arial", 20, 0x000000, CENTER);
		Button1.loadGraphicSlice9(["assets/images/sheet_button.png"], Math.ceil(text.width) + 10, Math.ceil(text.height) + 10, [[10, 10, 40, 40]], null, -1, false, 49, 49);
		Button1.setLabel(text);
        Button1.autoCenterLabel();
		Button1.screenCenter();
        add(Button1);*/
		
		var Buttooon = new Button(0, 0, _tongue.get("$MISC_OK", "ui"), ClickPlay);
		Buttooon.screenCenter();
		add(Buttooon);
		
		var buttons:Array<IFlxUIWidget> = new Array<IFlxUIWidget>();
		
		for (n in 0...10)
		{
			var buttoons = new Button(0, 0, Std.string(n), ClickPlay);
			buttons.push(buttoons);
		}
		
		var list:FlxUIList = new FlxUIList(50, 50, buttons, 100, 133, "meep");
		add(list);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function ClickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}