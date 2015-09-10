package ui 
{
	import com.exanimo.transitions.GCSafeTween;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.transitions.easing.*;
	import event.mEvent;
	/**
	 * 菜单
	 * @author qzd
	 */
	public class menu extends MovieClip
	{
		public const _w:int = 575;
		private const PointerX:Array = new Array(142, 229, 315);
		var pointerMove_Tween:GCSafeTween;
		public function menu() 
		{
			chooser.mouseEnabled = false;
			btn0.addEventListener(MouseEvent.CLICK, menuClick);
			btn1.addEventListener(MouseEvent.CLICK, menuClick);
			btn2.addEventListener(MouseEvent.CLICK, menuClick);
		}
		private function menuClick(e:MouseEvent) {
			var menuIndex:int = int(e.target.name.charAt(3));
			pointerMove_Tween = new GCSafeTween(chooser, "x", Regular.easeOut, chooser.x, PointerX[menuIndex], 1, true);
			dispatchEvent(new mEvent(mEvent.MAINMENUCLICK,menuIndex));
		}
	}

}