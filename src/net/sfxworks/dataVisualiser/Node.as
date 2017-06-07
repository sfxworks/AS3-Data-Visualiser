package net.sfxworks.dataVisualiser 
{
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class Node 
	{
		
		/**
		* @infotip The name of the node. Optional but used by visualisers on focus.
		*/ 
		public var name:String;
		
		/**
		* @infotip Data pertaining to the node. Field data would go in here with 'f1' and 'f2' being the defaults.
		* Any other data would only be visualised by ObjectVisualiser and is otherwise irrelivant.
		* 
		* Other default values are img and must be of type Bitmap for display.
		*/ 
		public var data:Object;
		
		/**
		* @infotip All nodes this node is linked to. This will usually contain either one or no nodes. However this is a vector for future use for visualising mulitple links between different data.
		* Nodes will be considered a child whatever they're linked to.
		*/ 
		public var link:Vector.<Node>
		
		/**
		* @infotip A node is your basic individual data object that is a core part of display and processing. Nodes can be linked with other nodes and contain properties to display and alter.
		*/ 
		public function Node() 
		{
			name = new String();
			data = new Object();
			link = new Vector.<Node>();
		}
		
		
	}

}