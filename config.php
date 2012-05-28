<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'root';
$CFG->dbpass    = '';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbsocket' => 0,
);

$CFG->wwwroot   = 'http://motest.com:8080/sgeivw';
$CFG->dataroot  = 'C:\\pgm\\xampp\\moodledata';

$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

// $CFG->passwordsaltmain = 'yq_QX6 ?jD9x.!f}fv#UhgG^ZR4#U1l';
$CFG->passwordsaltmain = '+j:nJ]RE~}n:Wn8sLV-B:{0W 0P';

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
