package;

import ui.*;
import flixel.FlxG;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUISubState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import openfl.Assets;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Edwin
 */
class StoreMenuState extends FlxUISubState
{
	var mousePosx:FlxText = new FlxText(0, 0, 200);
	var mousePosy:FlxText = new FlxText(0, 20, 200);
	var resize:Float = 0.7;
	var on:Bool = false;
	var add2:Int = 0;
	
	var _btnUpgrade:FlxButton;
	var _btnDecor:FlxButton;
	var _btnGnome:FlxButton;
	
	override public function create() 
	{
		super.create();
		
		_parentState.persistentDraw = true;
		_parentState.persistentUpdate = false;
		trace("started");
		
		/*var Buttooon = new Button(0, 0, _tongue.get("$MISC_OK", "ui"), ClickClose);
		//Buttooon.screenCenter();
		add(Buttooon);*/
		openMenu();
		
		mousePosx.setFormat("_sans", 18, FlxColor.WHITE, CENTER);
		mousePosx.setBorderStyle(OUTLINE, FlxColor.BLACK, 1);
		mousePosy.setFormat("_sans", 18, FlxColor.WHITE, CENTER);
		mousePosy.setBorderStyle(OUTLINE, FlxColor.BLACK, 1);
		add(mousePosx);
		add(mousePosy);
		
	}
	
	function ClickClose()
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
		
		_btnUpgrade = new FlxButton(380, 96, null, upgrade);
		_btnUpgrade.loadGraphic(Assets.getBitmapData("assets/images/UpgradesTabBtn.png"), true, 220, 226);
		_btnUpgrade.scale.x = resize;
		_btnUpgrade.scale.y = resize;
		_btnUpgrade.updateHitbox();
		_btnUpgrade.antialiasing = true;
		add(_btnUpgrade);
		
		_btnDecor = new FlxButton(380, (_btnUpgrade.y +_btnUpgrade.height + 24), null, decoration);
		_btnDecor.loadGraphic(Assets.getBitmapData("assets/images/DecorTabBtn.png"), true, 220, 226);
		_btnDecor.scale.x = resize;
		_btnDecor.scale.y = resize;
		_btnDecor.updateHitbox();
		_btnDecor.antialiasing = true;
		add(_btnDecor);
		
		_btnGnome = new FlxButton(380, (_btnDecor.y +_btnDecor.height + 24), null, gnomes);
		_btnGnome.loadGraphic(Assets.getBitmapData("assets/images/GnomeTab.png"), true, 220, 226);
		_btnGnome.scale.x = resize;
		_btnGnome.scale.y = resize;
		_btnGnome.updateHitbox();
		_btnDecor.antialiasing = true;
		add(_btnGnome);
		
		var exitBtn = new FlxButton(1224, 50, null, ClickClose);
		trace("lol");
		exitBtn.loadGraphic(Assets.getBitmapData("assets/images/exitbtn.png"), true, 375, 375);
		trace("lold");
		exitBtn.scale.x = 0.1;
		exitBtn.scale.y = 0.1;
		exitBtn.updateHitbox();
		exitBtn.antialiasing = true;
		add(exitBtn);
	}
	
	function upgrade()
	{
		
		/**
		* Self explanation: 
		* There is a variable called on and it's a boolean. Functions like this one checks whether it's true or not (on or not). 
		* When On is false it will run a specific command
		* When On is true it will remove the image and return to 0
		* Problem:
		* Once one button is clicked, the others aren't going to do anything because on stays true;
		* Solution:
		* Remove boolean, keep inactive and active. Create new class for the upgradetab
		* create function with add(images etc)
		* create function with remove(images etc) (will be placed on the other functions too)
		*/
		var skyBackground = new FlxUISprite(0, 0, Assets.getBitmapData("assets/images/trophy.png"));
		_btnUpgrade.active = false;
		_btnDecor.active = true;
		if (on == false)
		{
			on = true;
			add(skyBackground);
			trace("upgrade");
			add2 = add2 + 1;
		}
		else if (on == true)
		{
			trace("nope");
			remove(skyBackground);
			add2 = 0;
			on = false;
		}		
		
		trace(add2);
	}
	
	function decoration()
	{
		var skyBackground = new FlxUISprite(0, 0, Assets.getBitmapData("assets/images/trophy_p.png"));
		_btnUpgrade.active = true;
		_btnDecor.active = false;	
		if (on == false)
		{
			on = true;
			add(skyBackground);
			trace("decor");
			add2 = add2 + 1;
		}
		else if (on == true)
		{
			trace("nope");
			remove(skyBackground);
			add2 = 0;
			on = false;
		}	
	}
	
	function gnomes()
	{
		var skyBackground = new FlxUISprite(0, 0, Assets.getBitmapData("assets/images/2k15.png"));
		
		if (on == false)
		{
			add(skyBackground);
			trace("upgrade");
		}
		else
		{
			trace("nope2");
			remove(skyBackground);
			on == false;
		}
	}
	
	override public function update(elapsed:Float):Void
	{		
		//UI CODE//
		mousePosx.text = "X Pos: " + Std.string(FlxG.mouse.screenX);
		mousePosy.text = "Y Pos: " + Std.string(FlxG.mouse.screenY);
		//UI CODE END//
		
		super.update(elapsed);
	}
	
}