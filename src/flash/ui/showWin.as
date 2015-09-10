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
		private var printText:String = "";
		private const winSize:Number = 480;
		public function showWin() 
		{
			this.addChild(titleText);
			this.addChild(infoText);
			titleText.setText("", "Microsoft YaHei,微软雅黑", 16, 0x1B1D3F,310,32,"left");
			infoText.setText("welcome!", "Microsoft YaHei,微软雅黑", 14, 0x1B1D3F, 310, 64,"left");
			titleText.x = 40;
			titleText.y = 530;
			infoText.x = 40;
			infoText.y = 550;
			pic_Mc = picMc;
			pic_Mc.addChild(pic_loader);
			btnSwitch(false);
			linkBtn.addEventListener(MouseEvent.CLICK, linkClick);
			printAlert("不想做画家的UE不是好码农。\n>目前主营flash 开发，目前android app开发学习中……，UE扫盲中……。\n>欢迎欢迎！随便看看吧。");
		}
		public function printAlert(msg:String) {
			printText += ">" + msg + "\n";
			textPrint.text = printText;
		}
		//更新显示的信息
		public function upDataInfo(_info:Object) {
			pic_loader.unload();
			printAlert("loading...");
			textPrint.visible = true;
			infoObj = _info; 
			getPic(infoObj.picUrl);
			titleText.setText(infoObj.title, "Microsoft YaHei,微软雅黑", 16, 0x1B1D3F, 310, 32, "left");
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
			printAlert("complete");
			textPrint.visible = false;
			//调整大小
			if (pic_loader.width > pic_loader.height) {
				pic_loader.height = winSize * pic_loader.height / pic_loader.width;
				pic_loader.width = winSize;
				pic_loader.x = 0;
				pic_loader.y = winSize / 2 - pic_loader.height / 2;
			}else {
				pic_loader.width = winSize * pic_loader.width / pic_loader.height;
				pic_loader.height = winSize;
				pic_loader.x = winSize / 2 - pic_loader.width / 2;
				pic_loader.y = 0;
			}
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