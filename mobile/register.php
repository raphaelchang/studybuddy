<?PHP
    $error = "";
            $register = true;
            $fail = false;
            if ($_POST["email"] != $_POST["emailconfirm"])
            {
                $fail = true;
                $error = "<span style=\"color:red\">Emails do not match.</span><br>";
            }
            if ($_POST["password"] != $_POST["passwordconfirm"])
            {
                $fail = true;
                $error = "<span style=\"color:red\">Passwords do not match.</span><br>";
            }
            if ($_POST["firstname"] == "")
            {
                $fail = true;
                $error = "<span style=\"color:red\">Please enter your first name.</span><br>";
            }
            if ($_POST["lastname"] == "")
            {
                $fail = true;
                $error = "<span style=\"color:red\">Please enter your last name.</span><br>";
            }
            if (!$fail)
            {
                $activation = register($_POST["email"], $_POST["password"], $_POST["firstname"], $_POST["lastname"]);
                if ($activation != -1)
                {
                    $msg = "Thank you for creating a StudyBuddy account. You may activate your account through this link: <a href=" . DOMAIN . SITE_ROOT . "/activate?key=$activation>" . DOMAIN . SITE_ROOT . "/activate?key=$activation</a>.";
                    //mail($_POST["email"], "SchedulePoll - Activate Your Account", $msg, "From: info@schedulepoll.com");
                    $success = true;
                }
                else
                {
                    $error = "<span style=\"color:red\">This account already exists.</span><br>";
                }
            }
    ?>