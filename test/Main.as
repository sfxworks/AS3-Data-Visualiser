package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.sfxworks.dataVisualiser.Node;
	import net.sfxworks.dataVisualiser.visualisers.ObjectVisualiser;
	
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			trace("Hello");
			
			var myNode:Node = new Node();
			myNode.name = "TestNode";
			myNode.data = {manufacturer:'mvdistro', property2:'world'};
			
			var objVis:ObjectVisualiser = new ObjectVisualiser();
			objVis.setData(myNode);
			objVis.draw();
			
			addChild(objVis);
		}
		
	}
	
}