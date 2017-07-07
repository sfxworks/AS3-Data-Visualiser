package net.sfxworks.dataVisualiser.visualisers 
{
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import net.sfxworks.dataVisualiser.Node;
	import net.sfxworks.dataVisualiser.types.NodeType;
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class NodeVisualiser extends Sprite
	{
		
		private var nodeList:Vector.<Node>;
		
		private var indentSpacing:int = 0; //x
		private var nodeLevel:int = 0;
		private var scale:int;
		
		private var nodesToAdd:Vector.<Node>;
		
		/**
		* @infotip
		* NodeVisualiser is for taking formatted data and displaying it as an indented layout or a hirarchy. (Think file structures or tournament brackets)
		* You must have the engine link nodes to create this effect.
		* 
		*/ 
		public function NodeVisualiser() 
		{
			//scale = 18;
			scale = 14;
		}
		
		public function setData(nodes:Vector.<Node>):void
		{
			this.removeChildren();
			nodeLevel = 0;
			nodeList = nodes;
		}
		
		public function displayNodes(type:String, styles:Object = null):void
		{
			var defaultShapes:Vector.<Sprite>;
			
			switch(type)
			{
				case NodeType.HIRARCHY:
					
					break;
				case NodeType.INDENT:
					//nodeList.reverse();
					nodesToAdd = new Vector.<Node>();
					diveNode(nodeList);
					nodesToAdd.reverse();
					for each (var node:Node in nodesToAdd)
					{
						addChild(node);
					}
					break;
			}
		}
		
		private function diveNode(nodes:Vector.<Node>):void
		{
			
			for each (var node:Node in nodes)
			{
				drawNode(node);
				trace("Node name = " + node.name);
				if (node.link.length > 0)
				{
					//draw line under node.
					indentSpacing++;
					diveNode(node.link);
					indentSpacing--;
				}
				trace("Drawing.");
			}
		}
		
		private function drawNode(node:Node):void
		{
			
			
			if (node.image != null)
			{
				
				var bmp:Bitmap = node.internalData.image as Bitmap;
				bmp.width = 10 * scale;
				bmp.height = 10 * scale;
				bmp.x = 0;
				bmp.y = 0;
				addChild(bmp);
			}
			else if (node.internalData.imageRef != null)
			{
				
				//Draw rect.
				node.graphics.moveTo(0, 0);
				node.graphics.beginFill(0x000000, .5);
				node.graphics.drawRect(0, 0, 10 * scale, 10 * scale);
				node.graphics.endFill();
				
				var imageRef:String = node.internalData.imageRef as String;
				var urlrq:URLRequest = new URLRequest(imageRef);
				var l:Loader = new Loader();
				l.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handleLoaderIOError);
				l.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoaderComplete);
				l.load(urlrq);
				node.addChild(l);
			}
			else if (node.internalData.nameRef != null)
			{
				
				//Draw rect.
				node.graphics.moveTo(0, 0);
				node.graphics.beginFill(0x000000, .5);
				node.graphics.drawRect(0, 0, 10 * scale, 10 * scale);
				node.graphics.endFill();
				
				var tf:TextField = new TextField();
				//tf.height = 10 * scale;
				tf.text = node.internalData.nameRef;
				tf.blendMode = BlendMode.LAYER;
				tf.selectable = false;
				//tf.background = true;
				//tf.backgroundColor = 0xCCCCCC;
				
				
				if (node.internalData.nameRefFont != null)
				{
					tf.setTextFormat(node.internalData.nameRefFont);
				}
				
				tf.x = node.width + 10;
				tf.width = tf.textWidth + 5;
				
				tf.y = (node.height / 2) - (tf.textHeight / 2);
				node.addChild(tf);
			}
			else if (node.internalData.nameRefInternal != null)
			{
				
				var tf:TextField = new TextField();
				tf.text = node.internalData.nameRefInternal;
				tf.blendMode = BlendMode.LAYER;
				tf.selectable = false;
				tf.width = 10 * scale;
				//tf.border = true;
				//tf.borderColor = 0x000000;
				
				node.graphics.moveTo(0, 0);
				node.graphics.lineStyle(1, 0x000000, 1);
				node.graphics.drawRect(0, 0, 10 * scale, 10 * scale);
				node.graphics.lineStyle();
				
				if (node.internalData.nameRefFont != null)
				{
					tf.setTextFormat(node.internalData.nameRefFont);
				}
				
				tf.x = 0;
				tf.y = (node.height / 2) - (tf.textHeight / 2 );
				node.addChild(tf);
			}
			
			node.x = indentSpacing * 10 * scale;
			node.y = nodeLevel * 10 * scale;
			
			nodeLevel++;
			trace("Drawing node at " + node.x + "||" + node.y);
			
			//Draw line
			node.graphics.beginFill(0x000000, .2);
			node.graphics.moveTo(5 * scale, 5 * scale);
			node.graphics.lineTo( -5 * scale, 5 * scale);
			node.graphics.lineTo( -5 * scale, 0);
			node.graphics.lineTo( -5 * scale, -5 * scale);
			node.graphics.endFill();
			
			
			nodesToAdd.push(node);
			//addChild(node);
		}
		
		private function handleLoaderIOError(e:IOErrorEvent):void 
		{
			//trace("Cant load image, drawing grahic.");
		}
		
		private function handleLoaderComplete(e:Event):void 
		{
			e.target.content.width = 10 * scale;
			e.target.content.height = 10 * scale;
			e.target.content.x = 0;
			e.target.content.y = 0;
		}
		
	}

}