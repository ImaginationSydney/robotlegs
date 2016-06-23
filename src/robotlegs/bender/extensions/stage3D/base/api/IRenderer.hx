package robotlegs.bender.extensions.stage3D.base.api;

import flash.display3D.Context3DProfile;
import msignal.Signal.Signal0;
import openfl.display.Stage3D;
import openfl.display3D.Context3D;
import robotlegs.bender.extensions.stage3D.starling.impl.PlaceHolderLayer;
/**
 * ...
 * @author P.J.Shand
 * 
 */
@:rtti
@:keepSub
interface IRenderer
{
	function init(profile:Context3DProfile, antiAlias:Int=0):Void;
	function start():Void;
	function stop():Void;
	function render():Void;
	
	function addLayer(layer:ILayer):Void;
	function addLayerAt(layer:ILayer, index:Int):Void;
	function removeLayer(layer:ILayer):Void;
	function getLayerIndex(layer:ILayer):Int;
	
	var addedLayers(get, null):Iterator<ILayer>;
	
	var antiAlias:Int;
	var onReady(get, null):Signal0;
	var active(get, set):Bool;
	var onActiveChange(get, null):Signal0;
	var stage3D(get, null):Stage3D;
	var context3D(get, null):Context3D;
	var profile(get, null):Context3DProfile;
	var numLayers(get, null):Int;
}