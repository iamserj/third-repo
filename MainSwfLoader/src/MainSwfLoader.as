package {
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Sergey Belotserkovskiy
	 */
	
	public class MainSwfLoader extends Sprite {
		
		public static const FIRST:String = "first";
		public static const SECOND:String = "second";
		
		private var requestArray:Array;
		private var loadItemCounter:uint = 0;
		private var loader:Loader;
		
		private var swfArray:Array;
		
		private var firstSwf:Sprite;
		private var secondSwf:Sprite;
		
		private var swfEventManager:SwfEventManager;
		
		
		
		public function MainSwfLoader():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			swfEventManager = SwfEventManager.instance;
			
			requestArray = new Array();
			swfArray = new Array();
			
			loadSwfs();
			
		}
		
		private function loadSwfs():void {
			requestArray.push(["FirstSWF.swf", FIRST]);				// url request, name
			requestArray.push(["SecondSWF.swf", SECOND]);			// url request, name
			//trace(requestArray[1]);
			
			for (var i:uint = 0; i < requestArray.length; i++) {
				loader = new Loader();
				var urlReq:URLRequest = new URLRequest(requestArray[i][0]);
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
				loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
				loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
				loader.load(urlReq);
				loader.name = requestArray[i][1];
				//this.addChild(loader);
			}
		}
		
		private function loadComplete(event:Event):void {
			loadItemCounter++;
			//trace(event.currentTarget);
			swfArray.push(event.currentTarget.content);
			if (loadItemCounter == requestArray.length) {
				trace("Load complete: " + swfArray);
				initSwf();
			}
		}
		private function onSecurityError(event:SecurityErrorEvent):void {
			trace("SecurityErrorEvent: " + event.text);
		}
		private function onIOError(event:IOErrorEvent):void {
			trace("IOErrorEvent: " + event.text);
		}
		
		
		private function initSwf():void {
			
			for (var i:uint = 0; i < swfArray.length; i++) {
				
				swfEventManager.mainStage = this.stage;
				
				if (swfArray[i].parent.name == FIRST) {
					//firstSwf = new Sprite();
					//firstSwf = swfArray[i];
					//trace(firstSwf);
					//firstSwf.setLoc(0, 0);		// err
					
					//this.addChild(swfArray[i]);s
					//swfArray[i].setLoc(1, 1);
					var isetloc:ISetLoc;
					isetloc = swfArray[i] as ISetLoc;
					trace(swfArray[i]);
					trace(swfArray[i] as ISetLoc);
					trace(isetloc)
					//this.addChild(isetloc as DisplayObject);
					//isetloc.setLoc(0, 0);
					
					//this.addChild(firstSwf);
					//swfEventManager.addSwf(firstSwf, FIRST);
					this.addChild(swfArray[i]);
					//swfEventManager.addSwf(swfArray[i], FIRST);
				} else if (swfArray[i].parent.name == SECOND) {
					//secondSwf = new Sprite();
					//secondSwf.addChild(swfArray[i]);
					//this.addChild(secondSwf);
					//swfEventManager.addSwf(secondSwf, SECOND);
					this.addChild(swfArray[i]);
					swfArray[i].setLoc(stage.stageWidth - swfArray[i].width, stage.stageHeight - swfArray[i].height);
					//swfEventManager.addSwf(swfArray[i], SECOND);
				}
				
			}
		}
		
	}
	
}