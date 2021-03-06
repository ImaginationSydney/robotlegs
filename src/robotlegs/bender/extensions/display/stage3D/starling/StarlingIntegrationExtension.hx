//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved.
// 

//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.bender.extensions.display.stage3D.starling;

import org.swiftsuspenders.utils.DescribedType;
import robotlegs.bender.extensions.matching.InstanceOfType;
import robotlegs.bender.extensions.display.stage3D.starling.api.IStarlingViewMap;
import robotlegs.bender.extensions.display.stage3D.starling.impl.StarlingCollection;
import robotlegs.bender.extensions.display.stage3D.starling.impl.StarlingInitializer;
import robotlegs.bender.extensions.display.stage3D.starling.impl.StarlingViewMap;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.bender.framework.impl.UID;
import starling.core.Starling;
import starling.display.DisplayObjectContainer;

/**
 * <p>This Extension will map all Starling view instances and View3D instance in
 * injector as well as create view maps for automatic mediation when instances are
 * added on stage/scene.</p>
 */
class StarlingIntegrationExtension implements DescribedType implements IExtension
{
	/*============================================================================*/
	/* Private Properties                                                         */
	/*============================================================================*/

	/** Extension UID. **/
	private var _uid:String;

	/** Context being initialized. **/
	private var _context:IContext;

	/** Logger used to log messaged when using this extension. **/
	private var _logger:ILogger;
	
	public function new() { }
	
	/*============================================================================*/
	/* Public Functions                                                           */
	/*============================================================================*/

	/** @inheritDoc **/
	public function extend(context:IContext):Void
	{
		_uid = UID.create(StarlingIntegrationExtension);
		
		_context = context;
		_logger = context.getLogger(this);
		
		
		_context.addConfigHandler(InstanceOfType.call(StarlingCollection), handleStarlingCollection);
	}

	/**
	 * Returns the string representation of the specified object.
	 */
	public function toString():String
	{
		return _uid;
	}

	/*============================================================================*/
	/* Private Functions                                                          */
	/*============================================================================*/

	/**
	 * Map all Starling view instances to injector with their defined name and map
	 * and initialize Starling view map which will mediate display instances.
	 *
	 * @param collection Collection of Starling view instances used in context.
	 */
	private function handleStarlingCollection(starlingCollection:StarlingCollection):Void
	{
		_logger.debug("Mapping provided Starling instances...");
		_context.injector.map(StarlingCollection).toValue(starlingCollection);
		
		var items = starlingCollection.items;
		for (key in items.keys())
		{
			var starling:Starling = starlingCollection.getItem(key);
			_context.injector.map(DisplayObjectContainer, key).toValue(starling.stage);
		}
		
		_context.injector.map(IStarlingViewMap).toSingleton(StarlingViewMap);
		_context.injector.getInstance(IStarlingViewMap);
	}
}