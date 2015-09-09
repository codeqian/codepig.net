package event 
{
	import flash.events.Event;
	/**
	 * 自定义事件
	 * @author qzd
	 */
	public class mEvent extends Event
	{
		public static const MAINMENUCLICK:String = "mainmenuclick";
		public static const FILELOADED:String = "fileloaded";
		public var _id:int;
		public function mEvent(type:String, id:int) 
		{
			super(type);
			_id = id;
		}
		
	}

}