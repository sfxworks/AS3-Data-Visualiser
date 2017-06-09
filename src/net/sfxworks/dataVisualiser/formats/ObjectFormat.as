package net.sfxworks.dataVisualiser.formats 
{
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class ObjectFormat 
	{
		/**
		 * @infotip The width of the box.
		 * Note: This will be used to draw the background and will be 1/2 the size of all property & value TextFields
		 */
		public var width:int;
		
		/**
		 * @infotip The height (auto or set)
		 * Note: If 0, the height will auto scale through text
		 * If greater than 0 then it will be the exact height.
		 */
		public var height:int;
		public var header:TextFormat;
		public var body:TextFormat;
		public var headerColor:uint;
		public var bodyColor:uint;
		public var spacing:int;
		
		public function ObjectFormat(width:int = -1, height:int = -1, header:TextFormat = null, body:TextFormat = null, headerColor:uint = 0, bodyColor:uint = 0, spacing:int = -1) 
		{
			this.width = width;
			this.height = height;
			this.header = header;
			this.body = body;
			this.headerColor = headerColor;
			this.bodyColor = bodyColor;
			
			
			if (width == -1)
				this.width = 250;
			if (height == -1)
				this.height = 0;
			if (header == null)
				this.header = new TextFormat(null, 15,null,null,null,null,null,null,TextFormatAlign.CENTER);
			if (body == null)
				this.body = new TextFormat(null, 15,null,null,null,null,null,null,TextFormatAlign.CENTER);
			if (headerColor == 0)
				this.headerColor = 0xCCCCCC;
			if (bodyColor == 0)
				this.bodyColor = 0xDDDDDD;
			if (spacing < 1)
				this.spacing = 1;
		}
		
		
		
	}

}