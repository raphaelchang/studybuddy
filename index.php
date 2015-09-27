<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
require_once("includes.php");
$title = "Home";
    require_once("header_home.php");
    if ($account === false)
        require_once("login.php");
    else
    {
        if (count(get_registered_courses($account)) > 0)
            require_once("home.php");
        else
            header("Location: /" . SITE_ROOT . "/select");
    }
?>

<?php require_once("footer.php") ?>