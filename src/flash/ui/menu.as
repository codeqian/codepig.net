package ui 
{
	import com.exanimo.transitions.GCSafeTween;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * 菜单
	 * @author qzd
	 */
	public class menu extends MovieClip
	{
		public var _w:int = 575;
		private var mainMc:MovieClip;
		//142,229,316
		var showBtn_Tween:GCSafeTween;
		public function menu(_mainMc:MovieClip) 
		{
			mainMc = _mainMc;
			btn0.addEventListener(MouseEvent.CLICK, menuClick);
			btn1.addEventListener(MouseEvent.CLICK, menuClick);
			btn2.addEventListener(MouseEvent.CLICK, menuClick);
		}
		private function menuClick(e:MouseEvent) {
			var menuIndex:int = int(e.target.name.charAt(3));
		}
	}

}