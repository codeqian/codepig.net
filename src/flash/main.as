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
		private var minW:int = 980;//舞台最小尺寸
		private var minH:int = 800;
		private var menuX0:int = 15;//项目按钮起始位置
		private var menuY0:int = 200;
		private var menuEach:int = 45;
		//private var mainTimer:Timer = new Timer(1000, 0);//计时器
		var showBtn_Tween:GCSafeTween;
		var hideBtn_Tween:GCSafeTween
		var menuPointer:int = 0;//菜单类型
		public function main() 
		{
			gear0.stop();
			gear1.stop();
			
			mainMenu = new menu(this);
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
			resize();
			
			//test
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
		
		//显示与隐藏按钮
		private function showMenu(projectInfo:Array) {
			while (btnSpace.numChildren > 0) {
				btnSpace.removeChildAt(0);
			}
			for (var i:int = 0; i < projectInfo.length; i++) {
				btnArray[i] = new projectBtn();
				btnSpace.addChild(btnArray[i]);
				btnArray[i].x = menuEach * (i % 3);
				btnArray[i].y = menuEach * int(i / 3);
			}
			hideBtn_Tween = new GCSafeTween(btnSpace, "alpha", Regular.easeOut, 0, 1, 0.5, true);
			showBtn_Tween.addEventListener(TweenEvent.MOTION_FINISH, showComplete);
		}
		private function hideMenu() {
			hideBtn_Tween = new GCSafeTween(btnSpace, "alpha", Regular.easeOut, 1, 0, 0.5, true);
			hideBtn_Tween.addEventListener(TweenEvent.MOTION_FINISH, hideComplete);
		}
		private function showComplete() {
			showBtn_Tween.removeEventListener(TweenEvent.MOTION_FINISH, showComplete);
			//开始加载图片
		}
		private function hideComplete() {
			hideBtn_Tween.removeEventListener(TweenEvent.MOTION_FINISH, hideComplete);
			while (btnSpace.numChildren > 0) {
				btnSpace.removeChildAt(0);
			}
		}
		//项目按钮点击
		private function prejectClick(e:MouseEvent) {
			var index:int = btnArray.indexOf(e.target);
			win.upDataInfo(xmlClass.infoList[menuPointer][index]);
		}
	}

}