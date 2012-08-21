package {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	public class SecondSWF extends Sprite {
		
		private var sprite:Sprite;
		
		public function SecondSWF():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			sprite = new Sprite();
			sprite.graphics.lineStyle(2, 0xFF00FF);
			sprite.graphics.beginFill(0xF7D2FF);
			sprite.graphics.drawRoundRectComplex(0, 0, 130, 80, 15, 5, 5, 15);
			sprite.graphics.endFill();
			
			var xPos:int = stage.stageWidth / 2 + sprite.width;
			var yPos:int = stage.stageHeight / 2 + sprite.height;
			
			setLoc(xPos, yPos);
			
			this.addChild(sprite);
		}
		
		public function setLoc(xPos:int, yPos:int):void {
			trace("[SecondSWF] pos changed to: " + xPos, yPos);
			sprite.x = xPos;
			sprite.y = yPos;
		}
		
	}
	
}