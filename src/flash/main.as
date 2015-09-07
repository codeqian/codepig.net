package  
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
    import flash.display.StageScaleMode;
	import flash.events.Event;
	/**
	 * ...
	 * @author qzd
	 */
	public class main extends MovieClip
	{
		
		public function main() 
		{
			stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, OnStageResize);
		}
		
		//重置元素位置
		private function OnStageResize(event:Event) : void
        {
            return;
        }
	}

}