package net.sfxworks.dataVisualiser.types 
{
	/**
	 * ...
	 * @author Samuel Walker
	 */
	public class FieldType 
	{
		/**
		* @infotip Whole numbers starting at 0 and ending in the plot array's max number.
		* Example: An object array provided with {f1:0, f2:"hello"} {f1:42, f2:"world"} would count the second column up to 42.
		*/
		public static const NUMERIC:String = "numeric";
		
		/**
		* @infotip This value is for when you have a custom set of data. Example: "Jan, Feb, Mar" and so forth.
		*/ 
		public static const CUSTOM:String = "custom";
		
		/**
		* @infotip Similar to an excel sheet, counts from A-Z, then AA, AB, AC.. AAA, AAB...
		* I'm not going to set a max char length but do take account for your text box size..
		*/ 
		public static const ALPHABETIC:String = "alphabetic";
		
		/**
		* @infotip
		* FieldTypes contains arguments for the PlotVisualiser to consume.
		* If you're making a node that wants to compare against two values, those values must follow a certain format.
		*/ 
		public function FieldType() 
		{
			
		}
		
	}

}