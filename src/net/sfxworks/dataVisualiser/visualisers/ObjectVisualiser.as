package net.sfxworks.dataVisualiser.visualisers 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import net.sfxworks.dataVisualiser.Node;
	import net.sfxworks.dataVisualiser.formats.ObjectFormat;
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
				if (objType != "type")
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
				
			}
			
			names.reverse();
			values.reverse();
			
		}
		
		
		
		public function draw(styles:ObjectFormat=null, bindToMC:Boolean=false):void
		{
			this.removeChildren();
			this.graphics.clear();
			
			var stylesToUse:ObjectFormat;
			if (styles == null)
			{
				stylesToUse = new ObjectFormat();
			}
			else
			{
				stylesToUse = styles;
			}
			
			//Set Title
			var title:TextField = new TextField();
			title.text = nodeData.data.type + ":" + nodeData.name;
			title.setTextFormat(stylesToUse.header);
			title.width = stylesToUse.width;
			title.x = 0;
			title.y = 0;
			addChild(title);
			
			//Draw background
			this.graphics.moveTo(0, 0);
			this.graphics.beginFill(stylesToUse.headerColor, 1);
			this.graphics.drawRect(0, 0, this.width, title.textHeight);
			this.graphics.endFill();
			
			var setWidth:int = this.width;
			
			for (var i:int = 0; i < names.length; i++)
			{
				names[i].setTextFormat(stylesToUse.body);
				names[i].width = this.width / 2;
				names[i].height = names[i].textHeight + names[i].textHeight * 0.4;
				names[i].x = 0;
				names[i].y = (stylesToUse.spacing + names[i].textHeight) * i + title.textHeight;
				
				values[i].setTextFormat(stylesToUse.body);
				values[i].width = this.width / 2;
				values[i].x = this.width / 2;
				values[i].y = (stylesToUse.spacing + names[i].textHeight) * i + title.textHeight;
				
				if (_editable)
				{
					names[i].type = TextFieldType.INPUT;
					values[i].type = TextFieldType.INPUT;
				}
				
				addChild(names[i]);
				addChild(values[i]);
				
				this.graphics.beginFill(stylesToUse.bodyColor, 1);
				if (stylesToUse.height == 0)
				{
					this.graphics.drawRect(0, title.textHeight, stylesToUse.width, names[names.length -1].y + stylesToUse.spacing);
				}
				else
				{
					this.graphics.drawRect(0, title.textHeight, stylesToUse.width, stylesToUse.height);
				}
				
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