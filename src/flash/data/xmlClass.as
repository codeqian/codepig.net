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
			var rootUrl:String = dataXML.@rootUrl;
			var listCount:int = dataXML.children().length();
			for (var i:int = 0; i < listCount; i++) {
				infoList[i] = new Array();
				var projectCount:int = dataXML.child(i).children().length();
				for (var t:int = 0; t < projectCount; t++) {
					var infoObject:Object = new Object();
					infoObject.icoUrl = rootUrl + dataXML.child(i).child(t).child(0);
					infoObject.picUrl = rootUrl + dataXML.child(i).child(t).child(1);
					infoObject.title = dataXML.child(i).child(t).child(2);
					infoObject.info = dataXML.child(i).child(t).child(3);
					infoObject.link = dataXML.child(i).child(t).child(4);
					infoList[i][t] = infoObject;
				}
			}
		}
	}

}