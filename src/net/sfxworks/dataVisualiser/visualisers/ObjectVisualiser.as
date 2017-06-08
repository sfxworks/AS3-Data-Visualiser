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
	public class ObjectVisualiser extends Sprite
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
			names = new Vector.<TextField>();
			values = new Vector.<TextField>();
			
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
				if (node.data[objType] != null)
				{
					valueTF.text = node.data[objType];
				}
				else
				{
					valueTF.text = "null";
				}
				
				names.push(typeTF);
				values.push(valueTF);
			}
			
			names.reverse();
			values.reverse();
			
		}
		
		public function draw(styles:Object=null, bindToMC:Boolean=false):void
		{
			//Draw background
			this.graphics.beginFill(0xCCCCCC, 1);
			this.graphics.drawRect(0, 0, 250, 15);
			this.graphics.endFill();
			
			var setWidth:int = this.width;
			
			var spacing:int = 20;
			var textFormat:TextFormat = new TextFormat();
			textFormat.align = TextFormatAlign.CENTER;
			
			for (var i:int = 0; i < names.length; i++)
			{
				names[i].setTextFormat(textFormat);
				names[i].width = 55;
				names[i].height = names[i].textHeight + names[i].textHeight * 0.4;
				names[i].border = true;
				names[i].x = setWidth * 0.1;
				names[i].y = spacing * i + spacing;
				
				values[i].setTextFormat(textFormat);
				values[i].x = setWidth * 0.60;
				values[i].y = spacing * i + spacing;
				
				if (_editable)
				{
					names[i].type = TextFieldType.INPUT;
					values[i].type = TextFieldType.INPUT;
				}
				
				addChild(names[i]);
				addChild(values[i]);
				
				this.graphics.beginFill(0xDDDDDD, 1);
				this.graphics.drawRect(0, 15, 250, this.height + spacing);
				this.graphics.endFill();
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