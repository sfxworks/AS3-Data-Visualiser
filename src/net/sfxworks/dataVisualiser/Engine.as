package net.sfxworks.dataVisualiser 
{
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class Engine 
	{
		
		public function Engine()
		{
			
		}
		
		public static function serialiseJSON(json:String):Vector.<Node>
		{
			var data:Object = JSON.parse(json);
			var returnVector:Vector.<Node> = new Vector.<Node>();
			
			var currentRootNode:Node = new Node();
			currentRootNode.name = "root";
			returnVector.push(currentRootNode);
			
			function extract(object:Object):void 
			{
				for (var property:Object in object)
				{
					trace("Property = " + property);
					var node:Node = new Node();
					if (object[property] is Array) //I would like to believe this can reference an array without a name.
					{
						trace("obj is an array");
						trace("Node name = " + property);
						node.name = (property as String);
						returnVector.push(node);
						
						
						var tmp:Node = currentRootNode;
						currentRootNode = node;
						extract(object[property]);
						currentRootNode = tmp;
					}
					else
					{
						trace("node is not an array");
						node.name = (property as String);
						node.data = object[property];
						node.link.push(currentRootNode);
						returnVector.push(node);
						//Looks like object is spelled wrong to me at this point.
					}
				}
			}
			extract(data);
			
			return returnVector;
		}
		
	}

}