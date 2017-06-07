package net.sfxworks.dataVisualiser.visualisers 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import net.sfxworks.dataVisualiser.Node;
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class ObjectVisualiser extends Sprite implements IVisualiser
	{
		/**
		* @infotip
		* NodeVisualiser is for taking a node and displaying it's properties.
		* Values can be edited but will not be updated on other visualisers until you call the update method in the engine.
		* Values to hide can be given through an array.
		* 
		*/ 
		
		private var _styles:Object;
		private var _editable:Boolean;
		//image size
		//text size
		//text format
		//editable
		//Background
		
		private var nodeData:Node;
		private var nameTF:TextField;
		private var names:Vector.<TextField>;
		private var values:Vector.<TextField>;
		
		
		public function ObjectVisualiser() 
		{
			
		}
		
		public function setData(node:Node):void
		{
			//Save
			nodeData = node;
			
			//Set name
			if (node.name != null)
			{
				nameTF = new TextField();
				nameTF.text = node.name;
			}
			
			//Set values;
			for (var objType:String in node.data)
			{
				var typeTF:TextField = new TextField();
				var valueTF:TextField = new TextField();
				typeTF.text = objType;
				valueTF.text = node.data[typeTF];
				
				names.push(typeTF);
				values.push(valueTF);
			}
			
		}
		
		public function draw(styles:Object):void
		{
			//Draw background
			this.graphics.beginFill(0x000000, .5);
			this.graphics.drawRect(0, 0, 50, 50);
			this.graphics.endFill();
			
			var spacing:int = 20;
			var textFormat:TextFormat = new TextFormat();
			textFormat.align = TextFormatAlign.CENTER;
			
			for (var i:int = 0; i < names.length; i++)
			{
				names[i].setTextFormat(textFormat);
				names[i].x = this.width * 0.25;
				names[i].y = spacing * i + spacing;
				
				values[i].setTextFormat(textFormat);
				values[i].x = this.width * 0.75;
				values[i].y = spacing * i + spacing;
				
				if (_editable)
				{
					names[i].type = TextFieldType.INPUT;
					values[i].type = TextFieldType.INPUT;
				}
			}
		}
		
		public function get styles():Object 
		{
			return _styles;
		}
		
		public function set styles(value:Object):void 
		{
			_styles = value;
		}
		
		public function get editable():Boolean 
		{
			return _editable;
		}
		
		public function set editable(value:Boolean):void 
		{
			_editable = value;
		}
		
	}

}