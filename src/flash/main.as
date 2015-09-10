package  
{
	import com.exanimo.transitions.GCSafeTween;
	import fl.transitions.TweenEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
    import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import ui.logo;
	import ui.menu;
	import ui.projectBtn;
	import ui.showWin;
	import data.xmlClass;
	import event.mEvent;
	import fl.transitions.easing.*;
	/**
	 * 主文件
	 * @author qzd
	 */
	public class main extends MovieClip
	{
		private var mainMenu:menu;//主菜单
		private var mainLogo:logo;
		private var win:showWin;//项目详情窗口
		private var btnArray:Array = new Array();//项目按钮
		private var btnSpace:Sprite = new Sprite();
		private const minW:int = 980;//舞台最小尺寸
		private const minH:int = 800;
		private const menuX0:int = 15;//项目按钮起始位置
		private const menuY0:int = 200;
		private const menuEach:int = 45;
		//private var mainTimer:Timer = new Timer(1000, 0);//计时器
		private var showBtn_Tween:GCSafeTween;
		private var hideBtn_Tween:GCSafeTween
		private var menuPointer:int = 0;//菜单类型
		public function main() 
		{
			gear0.stop();
			gear1.stop();
			
			mainMenu = new menu();
			mainLogo = new logo();
			win = new showWin();
			mainLogo.y = 25;
			mainMenu.y = 20;
			win.y = 180;
			btnSpace.x = menuX0;
			btnSpace.y = menuY0;
			addChild(mainLogo);
			addChild(mainMenu);
			addChild(win);
			addChild(btnSpace);
			stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, OnStageResize);
			mainMenu.addEventListener(mEvent.MAINMENUCLICK, changeChannel);
			resize();
			
			win.printAlert("load xml");
			xmlClass.initMc(this);
			xmlClass.loadXml("data/projectinfo.xml");
			//test
		}
		//接受xmlClass来的消息
		public function xmlClassCall(msg:String) {
			win.printAlert(msg);
		}
		//重置元素位置
		private function OnStageResize(event:Event) : void
        {
			resize();
            return;
        }
		private function resize():void {
			var sWidth = stage.stageWidth;
			var sHeight = stage.stageHeight;
			if (sWidth < minW) {
				sWidth = minW;
			}
			if (sHeight < minH) {
				sHeight = minH;
			}
			mainLogo.x = sWidth-mainLogo.width-10;
			mainMenu.x = sWidth / 2 - mainMenu._w / 2;
			win.x = sWidth / 2 - win.width / 2;
		}
		public function changeChannel(e:mEvent) {
			menuPointer = e._id;
			hideMenu();
			gear0.play();
			gear1.play();
		}
		//显示与隐藏按钮
		private function showMenu() {
			showBtn_Tween = new GCSafeTween(btnSpace, "alpha", Regular.easeOut, btnSpace.alpha, 1, 0.5, true);
			showBtn_Tween.addEventListener(TweenEvent.MOTION_FINISH, showComplete);
			if (!xmlClass.dataReady) {
				win.printAlert("no data");
				return;
			}
			var projectInfo:Array = xmlClass.infoList[menuPointer];
			btnArray = new Array();
			for (var i:int = 0; i < projectInfo.length; i++) {
				btnArray[i] = new projectBtn();
				btnArray[i].mouseChildren = false;
				btnArray[i].buttonMode = true;
				btnSpace.addChild(btnArray[i]);
				btnArray[i].addEventListener(MouseEvent.CLICK, projectClick);
				btnArray[i].x = menuEach * (i % 3);
				btnArray[i].y = menuEach * int(i / 3);
			}
		}
		private function hideMenu() {
			hideBtn_Tween = new GCSafeTween(btnSpace, "alpha", Regular.easeOut, btnSpace.alpha, 0, 0.5, true);
			hideBtn_Tween.addEventListener(TweenEvent.MOTION_FINISH, hideComplete);
		}
		private function showComplete(e:TweenEvent) {
			showBtn_Tween.removeEventListener(TweenEvent.MOTION_FINISH, showComplete);
			gear0.stop();
			gear1.stop();
			for (var i:int = 0; i < btnArray.length; i++) {
				btnArray[i].getPic(xmlClass.infoList[menuPointer][i].icoUrl);
			}
		}
		private function hideComplete(e:TweenEvent) {
			hideBtn_Tween.removeEventListener(TweenEvent.MOTION_FINISH, hideComplete);
			for (var i:int = 0; i < btnArray.length; i++) {
				btnArray[i].removeEventListener(MouseEvent.CLICK, projectClick);
				btnSpace.removeChild(btnArray[i]);
			}
			while (btnSpace.numChildren > 0) {
				btnSpace.removeChildAt(0);
			}
			showMenu();
		}
		//项目按钮点击
		private function projectClick(e:MouseEvent) {
			var index:int = btnArray.indexOf(e.target);
			win.upDataInfo(xmlClass.infoList[menuPointer][index]);
		}
	}

}