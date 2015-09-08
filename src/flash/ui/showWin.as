package ui 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import lib.TextAntiAlias;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	/**
	 * 内容展示
	 * @author qzd
	 */
	public class showWin extends MovieClip
	{
		private var titleText:TextAntiAlias = new TextAntiAlias();
		private var infoText:TextAntiAlias = new TextAntiAlias();
		private var pic_loader:Loader = new Loader();
		private var pic_Mc:MovieClip;
		private var infoObj:Object;
		public function showWin() 
		{
			this.addChild(titleText);
			this.addChild(infoText);
			titleText.setText("loading...", "Microsoft YaHei,微软雅黑", 16, 0x1B1D3F,310,32,"left");
			infoText.setText("loading...", "Microsoft YaHei,微软雅黑", 14, 0x1B1D3F, 310, 64,"left");
			titleText.x = 40;
			titleText.y = 530;
			infoText.x = 40;
			infoText.y = 550;
			pic_Mc = picMc;
			pic_Mc.addChild(pic_loader);
			btnSwitch(false);
			linkBtn.addEventListener(MouseEvent.CLICK, linkClick);
		}
		//更新显示的信息
		public function upDataInfo(_info:Object) {
			pic_loader.unload();
			infoObj = _info;
			getPic(infoObj.picUrl);
			titleText.setText(infoObj.title, "Microsoft YaHei,微软雅黑", 16, 0x1B1D3F,310,32,"left");
			infoText.setText(infoObj.info, "Microsoft YaHei,微软雅黑", 14, 0x1B1D3F, 310, 64, "left");
			if (infoObj.link == "") {
				btnSwitch(false);
			}else {
				btnSwitch(true);
			}
		}
		private function getPic(Url:String) {
			pic_loader.load(new URLRequest(Url));
			pic_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded_pic);
		}
		private function loaded_pic(e:Event):void {
			this.play();
		}
		private function btnSwitch(open:Boolean) {
			if (open) {
				linkBtn.alpha = 1;
				linkBtn.mouseEnabled = true;
			}else {
				linkBtn.alpha = 0.2;
				linkBtn.mouseEnabled = false;
			}
		}
		private function linkClick(e:MouseEvent) {
			navigateToURL(infoObj.link, "_blank");
		}
	}

}