package;

import flixel.addons.ui.FlxUISprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

import flixel.input.keyboard.FlxKey;
import openfl.Assets;
import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Atilio
 */
class Gnome extends FlxUISprite
{
	public static inline var RUN_SPEED:Int = 90;
	public static inline var GRAVITY:Int = 620;
	
	private var _parent:PlayState;

	public function new(?X:Float=0, ?Y:Float=0, Parent:PlayState) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/Gnome1.png", true, 200, 200);
		
		animation.add("happyWalking", [0, 1, 2, 3, 4], 12, true);
		animation.add("happyIdle", [0]);
		animation.add("neutralWalking", [5, 6, 7, 8, 9]);
		animation.add("neutralIdle", [5]);
		animation.add("tiredWalking", [10, 11, 12, 13, 14]);
		animation.add("tiredIdle", [10]);
		animation.add("sadIdle", [15]);
		
		//drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		//maxVelocity.set(RUN_SPEED, JUMP_SPEED);
		//acceleration.y = GRAVITY;
		//acceleration.x = 10;
		setSize(200, 200);
		//offset.set(50, 0);
		
		// This is so we can look at properties of the playstate's tilemaps
		_parent = Parent;   
	}
	
	public override function update(elapsed:Float):Void
	{
		// Reset to 0 when no button is pushed
		//acceleration.x = 10; 
		
		//velocity.x = 100;
		
		
		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			flipX = true;
			acceleration.x = -drag.x;
		}
		else if (FlxG.keys.anyPressed([RIGHT, D]))
		{
			flipX = false;
			acceleration.x = drag.x;
		}
		
		// Animations
		if (velocity.x > 0 || velocity.x < 0) 
		{ 
			animation.play("happyWalking"); 
		}
		else if (velocity.x == 0) 
		{ 
			animation.play("happyIdle"); 
		}
		
		//Walkking of the gnome
		if (velocity.x == 0)
		{
			//acceleration.x = -acceleration.x;
			trace(velocity.x + "  " + acceleration.x);
			velocity.x = 300;
			trace(velocity.x + "  " + acceleration.x);
			
			/*if (x != _startx)
			{
				acceleration.x = (_startx - x);
			}*/
		}
		
		
		// Don't let helmuguy walk off the edge of the map
		if (x <= 0)
		{
			x = 0;
			//velocity.x = -velocity.x;
			flipX = false;
			velocity.x = -velocity.x;
			//acceleration.x = -acceleration.x;
		}
		if ((x + width) >  1280)
		{
			x = 1280 - width - 50;
			flipX = true;
			velocity.x = -velocity.x;
			//acceleration.x = -acceleration.x;
			trace(velocity.x + "  " + acceleration.x);
		}
		
		/*// Convert pixel positions to grid positions. Std.int and floor are functionally the same, 
		_xgridleft = Std.int((x + 3) / 16);   
		_xgridright = Std.int((x + width - 3) / 16);
		// but I hear int is faster so let's go with that.
		_ygrid = Std.int((y + height - 1) / 16);   */
		
		/*if (isTouching(FlxObject.FLOOR) && !FlxG.keys.anyPressed(_jumpKeys))
		{
			_jumpTime = -1;
			// Reset the double jump flag
			_timesJumped = 0;  
		}*/
		
		super.update(elapsed);
	}
	
	function walk()
	{
		if (x == 0)
		{
			
		}
	}
	
}