//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.bender.extensions.commandCenter.dsl;

import robotlegs.bender.framework.impl.Guard;
import robotlegs.bender.framework.impl.Hook;

/**
 * @private
 */
interface ICommandConfigurator {
	/**
	 * The "execute" method to invoke on the Command instance
	 * @param name Method name
	 * @return Self
	 */
	function withExecuteMethod(name:String):ICommandConfigurator;

	/**
	 * Guards to check before allowing a command to execute
	 * @param guards Guards
	 * @return Self
	 */
	function withGuards(?guards:Array<Guard>, ?guard:Guard):ICommandConfigurator;

	/**
	 * Hooks to run before command execution
	 * @param hooks Hooks
	 * @return Self
	 */
	function withHooks(?hooks:Array<Hook>, ?hook:Hook):ICommandConfigurator;

	/**
	 * Should this command only run once?
	 * @param value Toggle
	 * @return Self
	 */
	function once(value:Bool = true):ICommandConfigurator;

	/**
	 * Should the payload values be injected into the command instance?
	 * @param value Toggle
	 * @return Self
	 */
	function withPayloadInjection(value:Bool = true):ICommandConfigurator;
}
