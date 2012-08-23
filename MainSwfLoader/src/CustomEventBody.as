package {
	
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	
	public class CustomEventBody extends Event {
		
		protected var _body:*;
		
		public static const SEND_EVENT_FROM_1:String = "sendEventFrom1";
		public static const SEND_EVENT_FROM_2:String = "sendEventFrom2";
		
		
		
		
		public function CustomEventBody(type:String, bubbles:Boolean = false, cancelable:Boolean = false, body:* = null) {
			super(type, bubbles, cancelable);
			_body = body;
		}
		override public function clone():Event {
			return new CustomEventBody(type, bubbles, cancelable, _body);
		}
		public function get body():* {
			return _body;
		}

		
	}

}