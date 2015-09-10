package ui 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * 项目按钮
	 * @author qzd
	 */
	public class projectBtn extends MovieClip
	{
		private var pic_loader:Loader = new Loader();
		private var pic_Mc:MovieClip;
		public function projectBtn() 
		{
			pic_Mc = picMc;
			pic_Mc.addChild(pic_loader);
		}
		public function getPic(Url:String) {
			pic_loader.load(new URLRequest(Url));
			pic_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded_pic);
		}
		private function loaded_pic(e:Event):void {
			this.gotoAndPlay(2);
		}
	}

}