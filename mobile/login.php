<?PHP
    require_once("../includes.php");
    require_once("../functions.php");
    $error = "";
    $register = false;
    $success = false;
    if (isset($_REQUEST["email"]))
    {
        if ($_REQUEST["email"] == "")
            echo "{\"success: -2\"}";
        else if (!filter_var($_REQUEST["email"], FILTER_VALIDATE_EMAIL))
            echo "{\"success: -2\"}";
        else if ($_REQUEST["password"] == "")
            echo "{\"success: -3\"}";
        else
        {
            $res = login($_REQUEST["email"], $_REQUEST["password"]);
            if ($res == 1) // Account doesn't exist
            {
                echo "{\"success: -2\"}";
            }
            else if ($res == 3 || $res == 0)
            {
                echo "{\"success: 1\"}";
            }
            else if ($res == 2)
            {
                echo "{\"success: -4\"}";
            }
            else if ($res == 4)
            {
                echo "{\"success: -1\"}";
            }
        }
    }
    ?>