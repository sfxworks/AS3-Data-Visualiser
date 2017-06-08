package net.sfxworks.dataVisualiser.visualisers 
{
	import flash.display.Sprite;
	import net.sfxworks.dataVisualiser.Node;
	import net.sfxworks.dataVisualiser.types.NodeType;
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class NodeVisualiser extends Sprite
	{
		
		private var nodeList:Vector.<Node>;
		
		private var spacing:int = 10;
		private var indentSpacing:int = 0; //x
		private var nodeLevel:int = 0;
		
		/**
		* @infotip
		* NodeVisualiser is for taking formatted data and displaying it as an indented layout or a hirarchy. (Think file structures or tournament brackets)
		* You must have the engine link nodes to create this effect.
		* 
		*/ 
		public function NodeVisualiser() 
		{
			
		}
		
		public function setData(nodes:Vector.<Node>):void
		{
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
					diveNode(nodeList);
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
			var scale:int = 4;
			//Draw rect.
			node.graphics.beginFill(0x000000, .5);
			node.graphics.drawRect(0, 0, 10 * scale, 10 * scale);
			node.graphics.endFill();
			
			//Draw line
			node.graphics.beginFill(0x000000, .2);
			node.graphics.moveTo(5 * scale, 5 * scale);
			node.graphics.lineTo( -5 * scale, 5 * scale);
			node.graphics.lineTo( -5 * scale, 0);
			node.graphics.lineTo( -5 * scale, -5 * scale);
			node.graphics.endFill();
			
			node.x = indentSpacing * 10 * scale;
			node.y = nodeLevel * 10 * scale;
			nodeLevel++;
			trace("Drawing node at " + node.x + "||" + node.y);
			
			addChild(node);
			
		}
		
	}

}