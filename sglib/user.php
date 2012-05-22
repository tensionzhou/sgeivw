<?php
/**
 * @copyright SmarkGlobal
 * @license GPLv3
 * @version 0.01
 */
require_once(dirname(__FILE__) . '/../config.php');
/**
 * @author allenli
 * @name check
 * @param Null
 * @example directly invoke the function, it examines if the user meet the certain criterion
 */
function check($property='guided',$value='0',$url='guide.php'){
	global $DB,$USER;
	$result=$DB->get_record('user', array('id' => $USER->id));
	if($result->$property==$value)
	{
		header("location: ".$url);
	}

}
/**
 * @author allenli
 * @example simplyfied check, just to check guided or not
 */
function checkGuided(){
	global $DB,$USER;
		$result=$DB->get_record('user', array('id' => $USER->id));
		if($result->guided==0)
		{
			echo 'You are the first time here, plz see the tutorial here to proceed';
			header("location: guide.php");
		}		
}
