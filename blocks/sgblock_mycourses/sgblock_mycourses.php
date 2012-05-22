<?php
/**
 * 
 * @author allenli
 * @version 0.01 alpha
 * @todo Create a block to display the courses has been selected by a user.
 */
	class sgblock_mycourses extends block_base {
		function init() {
			$this->title = 'sgblock mycourses';
			$this->version = 2012052101;//版本格式為YYYYMMDDXX,注意最後兩位XX是指當天的第幾個版本
		}//初始化此block
		
		function get_content() {
			global $CFG, $USER, $DB, $OUTPUT;//聲明將調用全局變量
			
		}
	}