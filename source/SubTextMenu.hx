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
		openMenu();
		
	}
	
	function ClickPlay()
	{
		
		close();
	}
	
	function openMenu() //This function serves to open the background and all it's assets
	{
		
        // This is a 9-slice image with the image loaded and sliced
        var _back:String = ("assets/images/WindowBox.png");
        // This is the [x1,y1,x2,y2] slice points in the image.
        // x1,y1 is the top-left, x2,y2 is the bottom-right.
        var _slice:Array<Int> = [20,20,50,50];
        var bg = new FlxUI9SliceSprite(350, 60, _back, new Rectangle(0, 0, 900, 600 /*this is the size of the image*/), _slice);
        add(bg);
		
		var _mngr = new FlxSprite(10, 350, Assets.getBitmapData("assets/images/StoreManager.png"));
		_mngr.scale.x = 0.7;
		_mngr.scale.y = 0.7;
		_mngr.updateHitbox();
		_mngr.antialiasing = true;
		add(_mngr);
		
		var _btnUpgrade = new FlxButton(200, 600, "", upgrade);
		_btnUpgrade.loadGraphic(Assets.getBitmapData("assets/images/UpgradesTabBtn.png"), true, 220, 226);
		add(_btnUpgrade);
		
		var _btnDecor = new FlxButton(400, 600, "", decoration);
		_btnDecor.loadGraphic(Assets.getBitmapData("assets/images/DecorTabBtn.png"), true, 220, 226);
		add(_btnDecor);
		
		
		
	}
	
	function upgrade()
	{
		trace("upgrade");
	}
	
	function decoration()
	{
		trace ("decor");
	}
	
	function gnomes()
	{
		trace("gnomes");
	}
	
}