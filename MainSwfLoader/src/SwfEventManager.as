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
		private var firstSwf:*;
		private var secondSwf:*;
		public var mainStage:Stage;
		
		public function SwfEventManager(pvt:PrivateClass) {
			// nothing to do here
		}
		public static function get instance():SwfEventManager {
			if(SwfEventManager._instance == null) {
				SwfEventManager._instance = new SwfEventManager(new PrivateClass());
			}
			return SwfEventManager._instance;
		}
		
		
		
		public function addSwf(swf:*, name:String):void {
			switch (name) {
				case MainSwfLoader.FIRST:
					firstSwf = swf;
					firstSwf.addEventListener(CustomEventBody.SEND_EVENT_FROM_1, eventIncome);
				break;
				
			case MainSwfLoader.SECOND:
					secondSwf = swf;
					secondSwf.addEventListener(CustomEventBody.SEND_EVENT_FROM_2, eventIncome);
				break;
			}
		}
		
		
		private function eventIncome(event:CustomEventBody):void {
			//trace("event.target = " + event.target);
			if (event.body) {
				var addressee:String = event.body.addressee;
				var str:String = event.body.text;
				var spr:Sprite = new Sprite();
				spr = event.body.sprite;
				
				trace("body.str: " + str);
				
				switch (addressee) {
					case MainSwfLoader.FIRST:
						//trace("this is string for first swf");
						firstSwf.setText(str);
					break;
					case MainSwfLoader.SECOND:
						//trace("this is string for second swf");
						secondSwf.setText(str);
					break;
					default:
				}
			}
		}
		
	}
	
}
class PrivateClass {
	public function PrivateClass() {
		//trace("Private class called");
	}
}