package ui;

import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIText;

/**
 * ...
 * @author Atilio
 */
class Button extends FlxUIButton
{

	override public function new(X:Float = 0, Y:Float = 0, ?Label:String, ?OnClick:Void->Void, meep:Int = 0 ) 
	{
		super(X, Y, Label, OnClick);
		var text = new FlxUIText(0, 0, 0, Label);
		var next:Int = 0;
		
		this.setLabelFormat("Arial", 20, 0x000000, CENTER);
		this.loadGraphicSlice9(["assets/images/sheet_button.png"], Math.ceil(text.width) + 10, Math.ceil(text.height) + 10, [[10, 10, 40, 40]], null, -1, false, 49, 49);
		this.setLabel(text);
		this.autoCenterLabel();
		
	}
	
}