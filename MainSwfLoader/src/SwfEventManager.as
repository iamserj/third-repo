package {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	
	public class SwfEventManager extends Sprite {
		
		private static var _instance:SwfEventManager;
		private var firstSwf:Sprite;
		private var secondSwf:Sprite;
		public var mainStage:Stage;
		
		static public function get instance():SwfEventManager {
			if(SwfEventManager._instance == null) {
				SwfEventManager._instance = new SwfEventManager(new PrivateClass());
				//trace("SwfEventManager instantiated");
			} else {
				//trace("Sorry, already have a SwfEventManager instantiated")
			}
			return SwfEventManager._instance;
		}
		
		
		public function SwfEventManager(pvt:PrivateClass) {
			
			
		}
		
		public function addSwf(swfSprite:Sprite, name:String):void {
			switch (name) {
				case MainSwfLoader.FIRST:
					//firstSwf = new Sprite();
					//firstSwf = swfSprite//.getChildAt(0) as Sprite;
					//firstSwf.addEventListener(CustomEventBody.SEND_EVENT_FROM_1to1, eventIncome);
					
				break;
				
			case MainSwfLoader.SECOND:
					//secondSwf = new Sprite();
					//secondSwf = swfSprite//.getChildAt(0) as Sprite;
					//secondSwf.addEventListener(CustomEventBody.SEND_EVENT_FROM_2to1, eventIncome);
					
				break;
			}
		}
		
		
		private function eventIncome(event:CustomEventBody):void {
			if (event.body) {
				var str:String = new String();
				str = event.body.text;
				var spr:Sprite = new Sprite();
				spr = event.body.sprite;
				
				//(mainStage.getChildByName("textField2") as TextField).text = str;
				
				trace("body: " + event.body);
			}
		}
		
		
		
		
	}
	
}
class PrivateClass {
	public function PrivateClass() {
		//trace("Private class is up");
	}
}