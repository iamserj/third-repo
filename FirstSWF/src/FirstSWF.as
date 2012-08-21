package {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	
	public class FirstSWF extends Sprite {
		private var sprite:Sprite;
		
		public function FirstSWF():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			sprite = new Sprite();
			sprite.graphics.lineStyle(2, 0x8080FF);
			sprite.graphics.beginFill(0xB5EFF2);
			sprite.graphics.drawRoundRectComplex(0, 0, 130, 80, 5, 45, 45, 5);
			sprite.graphics.endFill();
			
			var xPos:int = stage.stageWidth / 2 - sprite.width;
			var yPos:int = stage.stageHeight / 2 - sprite.height;
			
			setLoc(xPos, yPos);
			
			this.addChild(sprite);
		}
		
		public function setLoc(xPos:int, yPos:int, outer:Boolean = false):void {
			trace("[FirstSWF] pos changed to: " + xPos, yPos);
			sprite.x = xPos;
			sprite.y = yPos;
			
			if (outer) {
				sprite.buttonMode = true;
				sprite.addEventListener(MouseEvent.CLICK, sprite_mouseClick);
			}
		}
		
		private function sprite_mouseClick(event:MouseEvent):void {
			trace("[FirstSwf] sprite clicked, dispatch 2*click in 2 seconds");
			
			setTimeout(dispatcher, 2000);
		}
		
		private function dispatcher():void {
			dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK));
		}
		
	}
	
}