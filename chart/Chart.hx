package chart;

//import chart.data.RadarData;
//import chart.data.BarData;
//import chart.data.SegmentData;
//import chart.data.LineData;
import js.html.CanvasRenderingContext2D;

typedef ChartOptions = {
    var type: String;
    var data: ChartData;
    @:optional var options: Dynamic;
}

typedef ChartData = {
    var labels: Array<String>;
    var datasets: Array<Dynamic>;
}

typedef UpdateConfig = {
    @:optional var duration: Int;
    @:optional var lazy: Bool;
    @:optional var easing: String;
}

@:native("Chart")
extern class Chart {
	
	var data :ChartData;
	
	/**
	 * constructor
	 * @param	ctx
	 * @param	options {type:"barType", data:{labels:["lab1", ...], datasets:[{}, ...]}, ?options:{}}
	 */
    function new(ctx :CanvasRenderingContext2D, options :ChartOptions);
	
	function clear():Void;
	
	/**
	 * Stops any current animation loop occurring
	 * Use this to stop any current animation loop. 
	 * This will pause the chart during any current animation frame. 
	 * Call .render() to re-animate.
	 * @return 'this' for chainability
	 */ 
	function stop():Chart;
	
	function resize(silent :Bool):Void;
	
	function ensureScalesHaveIDs():Void;
	
	/**
	 * Builds a map of scale ID to scale object for future lookup.
	 */
	function buildOrUpdateScales():Void;
	
	function buildOrUpdateControllers():Void;
	
	/**
	 * Resets the chart back to it's state before the initial animation
	 */
	function reset():Void;
	
	/**
	 * Triggers an update of the chart. This can be safely called after updating the data object. 
	 * This will update all scales, legends, and then re-render the chart.
	 * @see https://www.chartjs.org/docs/latest/developers/updates.html for more details.
	 * @param	config {?duration:Int, ?lazy:Bool, easing:String}
	 * 	- duration: Time for the animation of the redraw in milliseconds
     * 	- lazy: If true, the animation can be interrupted by other animations
     * 	- easing: The animation easing function. @see https://www.chartjs.org/docs/latest/configuration/animations.html for possible values
	 * A config object can be provided with additional configuration for the update process. 
	 * This is useful when update is manually called inside an event handler and some different animation is desired
	 */
	function update(?config :UpdateConfig):Void;
	
	function render(?config :UpdateConfig):Void;
	
	function draw(easingValue :Dynamic):Void; // todo: easingValue type - Float?
	
	/**
	 * Get the single element that was clicked on
	 * @return An object containing the dataset index and element index of the matching element. Also contains the rectangle that was draw
	 */
	function getElementAtEvent(e :Dynamic):Dynamic; // todo: e type IEvent?, return type?
	function getElementsAtEvent(e :Dynamic):Array<Dynamic>; // todo: e type?, return type?
	function getElementsAtXAxis(e :Dynamic):Array<Dynamic>; // todo: e type?, return type?
	/**
	 * // todo: e, mode, options type?, return type?
	 * @param	e
	 * @param	mode
	 * @param	options
	 * @return
	 */
	function getElementsAtEventForMode(e :Dynamic, mode:Dynamic, options:Dynamic):Array<Dynamic>;
	
	function getDatasetAtEvent(e :Dynamic):Dynamic; // todo: e type?, return type?
	function getDatasetMeta(e :Dynamic):Dynamic; // todo: e type?, return type?
	
	function getVisibleDatasetCount():Int;
	
	function isDatasetVisible(datasetIndex:Int):Bool;
	
	function generateLegend():Dynamic; // todo: return legendCallback?
	
	function destroy():Void;
	
	function toBase64Image():String;
	
	function initToolTip():Void;
	
	function updateHoverStyle(elements:Array<Dynamic>, mode:Dynamic, enabled:Bool):Void; // todo types?
	
	
	/**
	 * @deprecated use Chart constructor parameter "options" instead ({type:"line", {type:"bar", etc.)
	 */
	//function Line(data:LineData, ?options:LineOptions):LineChart;
    //function Bar(data:BarData, ?options:BarOptions):BarChart;
    //function Radar(data:RadarData, ?options:RadarOptions):RadarChart;
    //function PolarArea(data:Array<SegmentData>, ?options:PolarAreaOptions):PolarAreaChart;
    //function Pie(data:Array<SegmentData>, ?options:DoughnutPieOptions):PieChart;
    //function Doughnut(data:Array<SegmentData>, ?options:DoughnutPieOptions):DoughnutChart;
    
}
