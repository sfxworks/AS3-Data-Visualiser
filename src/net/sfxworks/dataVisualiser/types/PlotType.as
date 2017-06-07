package net.sfxworks.dataVisualiser.types 
{
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class PlotType 
	{
		/**
		* @infotip Line creates a line graph.
		* 
		* To display more than one line graph on the same chart, use the default 'f3' field to specify with set the plots should connect with.
		*/ 
		public static const LINE:String = "line";
		
		/**
		* @infotip Bar creates a bar graph.
		* 
		* For stacked bar graphs, the default 'f3' field is not neccessary in the node as PlotVisualiser will put the highest value behind smaller nodes.
		*/ 
		public static const BAR:String = "bar";
		
		/**
		* @infotip Plot creates a plot graph. 
		*/ 
		public static const PLOT:String = "plot";
		
		/**
		* @infotip Pie is for creating a pie graph.
		* 
		* One field must be numeric. The visualiser will take the highest value and make that the comparison reference for turning values into %.
		*/ 
		public static const PIE:String = "pie";
		
		/**
		* @infotip Doughnut is for creating a pie graph with a hole in the middle of it.
		* 
		* One field must be numeric. The visualiser will take the highest value and make that the comparison reference for turning values into %.
		*/ 
		public static const DOUGHNUT:String = "doughnut";
		
		/**
		 * @infotip PlotType contains arguments for the PlotVisualiser to consume.
		 * Once the PlotProcessor has processed the data, pass one of these arguments to the PlotVisualiser for display.
		 */ 
		public function PlotType() 
		{
			
		}
		
	}

}