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
					if (object[property] is Array) //I would like to believe this can reference an array without a name.
					{
						var node:Node = new Node();
						node.name = property;
						returnVector.push(node);
						
						
						var tmp:Node = currentRootNode;
						currentRootNode = node;
						extract(object[property]);
						currentRootNode = tmp;
					}
					else
					{
						var node:Node = new Node();
						node.name = property;
						node.data = object[property];
						node.link = currentRootNode;
						returnVector.push(node);
						//Looks like object is spelled wrong to me at this point.
					}
				}
			}
			
			return returnVector;
		}
		
		public static function serializeXML(xml:String):Vector.<Node>
		{
			//TODO:
		}
	}

}