
<a href="select"><img src="gear_icon.png" height="30" style="position: absolute; left: 93%; top: 5%"/></a>
<h1>Your Courses</h1>
<?php $account_info = get_account_info($account);
    $registered = get_registered_courses($account);
    foreach($registered as $course)
    {
        $users = get_users_in_vicinity($account_info["lat"], $account_info["long"], $course["id"]);
        ?>
<a href="posts?course=<?php echo $course['id']?>"><div class="bubble"><div class="num"><?php echo count($users) - 1 ?></div><h2><?php echo $course["department"] . $course["number"] ?></h2></div></a>
<?php
    }
    ?>
