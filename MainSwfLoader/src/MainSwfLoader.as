package {
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	
	public class MainSwfLoader extends Sprite {
		
		private var requestArray:Array;
		private var loadItemCounter:uint;
		private var loader:Loader;
		
		private var firstSwf:Sprite;
		private var secondSwf:Sprite;
		
		private var swfArray:Array;
		
		
		public function MainSwfLoader():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			swfArray = new Array();
			
			requestArray = new Array();
			requestArray.push("FirstSWF.swf", "SecondSWF.swf");
			//trace(requestArray);
			
			for (var i:uint = 0; i < requestArray.length; i++) {
				loader = new Loader();
				var urlReq:URLRequest = new URLRequest(requestArray[i]);
				loader.load(urlReq);
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
				this.addChild(loader);
			}
			
		}
		
		private function loadComplete(event:Event):void {
			loadItemCounter++;
			//trace ("Loaded swfs: " + loadItemCounter);
			
			swfArray.push((event.currentTarget as LoaderInfo).content);
			
			if (loadItemCounter == requestArray.length) {
				//loa
				trace("Load complete: " + swfArray);
				stage.addEventListener(MouseEvent.CLICK, stage_mouseClick);
			}
			
		}
		
		private function stage_mouseClick(event:MouseEvent):void {
			stage.removeEventListener(MouseEvent.CLICK, stage_mouseClick);
			
			for (var i:uint = 0; i < swfArray.length; i++) {
				swfArray[i].setLoc((i+1) * 200, 50);
			}
			
			var swfWidth:uint = swfArray[1].width;
			var swfHeight:uint = swfArray[1].height;
			
			swfArray[1].setLoc((1+1) * 200, 50, true);
			
			Sprite(swfArray[1]).addEventListener(MouseEvent.DOUBLE_CLICK, swf_doubleClick);
		}
		
		private function swf_doubleClick(event:MouseEvent):void {
			trace("[MainSWFLoader]: double click from first catched");
		}
		
		
		
	}
	
}