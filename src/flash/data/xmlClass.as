package data 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * 获取记录信息的xml
	 * @author qzd
	 */
	public class xmlClass 
	{
		private static var dataXML:XML = null;
		private static var urlLoader:URLLoader = new URLLoader();
		public static var dataReady:Boolean = false;
		public static var infoList:Array = new Array();
		private static var mainMc:MovieClip;
		public function xmlClass() 
		{
			
		}
		public static function initMc(_main:MovieClip):void {
			mainMc = _main;
			mainMc.xmlClassCall("inited");
		}
		public static function loadXml(url:String):void {
			urlLoader.load(new URLRequest(url));
			urlLoader.addEventListener(Event.COMPLETE, gotInfo);
		}
		public static function gotInfo(e:Event):void {
			urlLoader.removeEventListener(Event.COMPLETE, gotInfo);
			dataReady = true;
			mainMc.xmlClassCall("loaded Xml");
			dataXML = XML(e.currentTarget.data);
			trace(dataXML.childNodes("data");
			trace(dataXML.data.childNodes.length);
			trace(dataXML.data.childNodes.length());
			//infoList[0]=dataXML.child("
			var infoObject:Object = new Object();
			infoObject.icoUrl = "";
			infoObject.picUrl = "";
			infoObject.title = "";
			infoObject.info = "";
			infoObject.link = "";
		}
	}

}