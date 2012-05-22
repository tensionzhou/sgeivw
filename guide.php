<!DOCTYPE p PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


</head>
<?php
require('config.php');
global $DB,$USER;
$result=$DB->get_record('user', array('id' => $USER->id));
if($result->guided==0)
{
	echo 'You are the first time here, plz see the tutorial here to proceed';
}
?>

<p> <iframe width="420" height="315" src="http://www.youtube.com/embed/67IaWr4v1Ks" frameborder="0" allowfullscreen></iframe></p>
<a href='index.php?guide=finished'><button>Finish Tutorial</button></a>
</html>