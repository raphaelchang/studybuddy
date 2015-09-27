<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
    require_once('includes.php');
require_once('functions.php');
    
    set_user_location($_GET["user"], $_GET["lat"], $_GET["lng"]);
    
?>

