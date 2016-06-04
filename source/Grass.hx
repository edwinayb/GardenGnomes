package;

import flixel.addons.effects.FlxSkewedSprite;

/**
 * ...
 * @author Atilio
 */
class Grass extends FlxSkewedSprite
{
	public var maxSkew:Float = 3;
	public var minSkew:Float = -5;
	public var skewSpeed:Float = 3;
	
	private var _skewDirection:Int = 1;
	
	public function new(X:Float = 0, Y:Float = 0, Frame:Int = 0, StartSkew:Float = 0) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/Grass.png");
		//animation.frameIndex = Frame;
		
		antialiasing = true;
		skew.x = StartSkew;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		skew.x += _skewDirection * skewSpeed * elapsed;
		
		if (skew.x > maxSkew)
		{
			skew.x = maxSkew;
			_skewDirection = -1;
		}
		else if (skew.x < minSkew)
		{
			skew.x = minSkew;
			_skewDirection = 1;
		}
	}	
	
}