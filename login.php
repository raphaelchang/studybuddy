<div class="half" style="float: left; border-right: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px">
<p>Contact nearby classmates.</p>
<p>Create study sessions.</p>
<p>Learn together.</p>
</div>
<div class="half" style="float: left">
<h2>Sign In/Register</h2>
<?PHP
    $error = "";
    $register = false;
    $success = false;
    if (isset($_POST["email"]))
    {
        if ($_POST["email"] == "")
            $error = "<span style=\"color:red\"Please enter your email.</span>";
        else if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL))
            $error = "<span style=\"color:red\">Please enter a valid email.</span>";
        else if ($_POST["password"] == "")
            $error = "<span style=\"color:red\">Please enter a password.</span>";
        else if (isset($_POST["register"]))
        {
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
        }
        else
        {
            $res = login($_POST["email"], $_POST["password"]);
            if ($res == 1) // Account doesn't exist
            {
                $register = true;
            }
            else if ($res == 3 || $res == 0)
            {
                header("Location: /" . SITE_ROOT);
            }
            else if ($res == 2)
            {
                $error = "<span style=\"color:red\">Password is incorrect.</span><br>";
            }
            else if ($res == 4)
            {
                $error = "<span style=\"color:red\">This account has not been activated. Please check your email for instructions to activate your account.</span><br>";
            }
        }
    }
    ?>
<?php if (!$success) { ?>
<?php echo $error ?>
<form action="" method="POST">
<input type="text" name="email" placeholder="Email (.edu)" size="30" <?php if ($register) echo "value=" . $_POST["email"] ?> required><br>
<?php if ($register) { ?>
<input type="text" name="emailconfirm" placeholder="Confirm Email" size="30" <?php if (isset($_POST["emailconfirm"])) echo "value=" . $_POST["emailconfirm"] ?> required><br>
<?php } ?>
<input type="password" name="password" placeholder="Password" size="30" <?php if ($register) echo "value=" . $_POST["password"] ?> required><br>
<?php if ($register) { ?>
<input type="password" name="passwordconfirm" placeholder="Password Confirm" size="30" <?php if (isset($_POST["passwordconfirm"])) echo "value=" . $_POST["passwordconfirm"] ?> required><br>
<input type="text" name="firstname" placeholder="First Name" size="30" <?php if (isset($_POST["firstname"])) echo "value=" . $_POST["firstname"] ?> required><br>
<input type="text" name="lastname" placeholder="Last Name" size="30" <?php if (isset($_POST["lastname"])) echo "value=" . $_POST["lastname"] ?> required><br>
<input type="hidden" name="register">
<?php } ?>
<input type="submit" value="<?php echo (!$register ? "Sign In/" : "") ?>Register">
</form>
<?php } else echo "Thank you for registering. Please check your email for instructions to activate your account.<br>"; ?>
</div>
<div style="clear: both"></div>