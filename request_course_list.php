<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
    require_once('includes.php');
require_once('functions.php');
    
    $courses = get_courses_in_department($_GET["dept"], $_GET["college"]);
    echo json_encode($courses);
    
?>

