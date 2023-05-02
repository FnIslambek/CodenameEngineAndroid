package funkin.backend.system;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.input.touch.FlxTouch;

class AndroidInput extends FlxBasic {
	public static var flipX = false;
	public static var flipY = true;
    public var touchSwipeX:Float;
    public var touchSwipeY:Float;
    var curTouch:FlxTouch;
    var lastTouch:FlxPoint;
	public function updateInput(elapsed) {
	    for (i in [83,87,65,68]) {
	        @:privateAccess(FlxG.keys) FlxG.keys.getKey(i).current = 0;
	    }
		if (FlxG.touches.justStarted()[0] != null) {
            curTouch = FlxG.touches.justStarted()[0];
            lastTouch = FlxPoint.get(Math.floor((curTouch.getScreenPosition().x - curTouch.justPressedPosition.x) / 200),
            Math.floor((curTouch.getScreenPosition().y - curTouch.justPressedPosition.y) / 100));
        }
        if (curTouch != null && curTouch.pressed) {
        	touchSwipeY = (curTouch.getScreenPosition().y - curTouch.justPressedPosition.y) / 160;
        	touchSwipeX = (curTouch.getScreenPosition().x - curTouch.justPressedPosition.x) / 100;
        	if (lastTouch.y != Math.floor(touchSwipeY)) {
        	    switch (FlxMath.signOf(Math.floor(touchSwipeY) - lastTouch.y) * FlxMath.signOf(0.5 - (flipY ? 1 : 0))) {
    	            case 1: @:privateAccess(FlxG.keys) FlxG.keys.getKey(83).current = 2;
                    case -1: @:privateAccess(FlxG.keys) FlxG.keys.getKey(87).current = 2;
        	    }
                lastTouch.y = Math.floor(touchSwipeY);
        	}
        	if (lastTouch.x != Math.floor(touchSwipeX)) {
                switch (FlxMath.signOf(Math.floor(touchSwipeX) - lastTouch.x) * FlxMath.signOf(0.5 - (flipY ? 1 : 0))) {
                    case -1: @:privateAccess(FlxG.keys) FlxG.keys.getKey(65).current = 2;
                    case 1: @:privateAccess(FlxG.keys) FlxG.keys.getKey(68).current = 2;
                }
                lastTouch.x = Math.floor(touchSwipeX);
            }
        }
        if (FlxG.touches.justReleased()[0] != null && Math.abs(touchSwipeX) < 0.25 && Math.abs(touchSwipeY) < 0.25)
            @:privateAccess(FlxG.keys) FlxG.keys.getKey(32).current = 2;

        if (FlxG.android.justPressed.BACK)
            @:privateAccess(FlxG.keys) FlxG.keys.getKey(27).current = 2;
	}
}