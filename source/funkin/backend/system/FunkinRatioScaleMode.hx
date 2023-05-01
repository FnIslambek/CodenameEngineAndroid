package funkin.backend.system;

import flixel.system.scaleModes.RatioScaleMode;

class FunkinRatioScaleMode extends RatioScaleMode {
	@:isVar public var width(get, set):Null<Int> = null;
	@:isVar public var height(get, set):Null<Int> = null;

	public override function updateGameSize(Width:Int, Height:Int):Void
	{
		if (Main.widescreen) gameSize.set(Width, Height);
		else {
			var ratio:Float = width / height;
			var realRatio:Float = Width / Height;

			var scaleY:Bool = realRatio < ratio;
			if (fillScreen)
			{
				scaleY = !scaleY;
			}

			if (scaleY)
			{
				gameSize.x = Width;
				gameSize.y = Math.floor(gameSize.x / ratio);
			}
			else
			{
				gameSize.y = Height;
				gameSize.x = Math.floor(gameSize.y * ratio);
			}
		}
		

		@:privateAccess {
			var realWidth = Main.widescreen ? Math.floor(1280 + (1280 / ((lime.system.System.getDisplay(0).currentMode.width / lime.system.System.getDisplay(0).currentMode.height) + (1280 / 720)))) : width;
			for(c in FlxG.cameras.list) {
				if (c.width != FlxG.width && c.height != FlxG.height) {
					c.width = realWidth;
					c.height = height;
				}
			}

			FlxG.width = realWidth;
			FlxG.height = height;
		}
	}

	public function resetSize() {
		width = null;
		height = null;
	}
	private inline function get_width():Null<Int>
		return this.width == null ? FlxG.initialWidth : this.width;
	private inline function get_height():Null<Int>
		return this.height == null ? FlxG.initialHeight : this.height;
	private inline function set_width(v:Null<Int>):Null<Int> {
		this.width = v;
		@:privateAccess
		FlxG.game.onResize(null);
		return v;
	}
	private inline function set_height(v:Null<Int>):Null<Int> {
		this.height = v;
		@:privateAccess
		FlxG.game.onResize(null);
		return v;
	}
}