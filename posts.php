<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
    require_once("includes.php");
    if (!isset($_GET["course"]) || $_GET["course"] == "")
        header("Location: /" . SITE_ROOT);
    $course = get_course_info($_GET["course"]);
    if (!is_course_registered($course["id"], $account))
        header("Location: /" . SITE_ROOT);
    $title = $course["department"] . $course["number"];
    require_once("header_home.php");
    if ($account === false)
    header("Location: /" . SITE_ROOT);
    if (isset($_POST["content"]) && $_POST["content"] != "")
    {
        add_post($account, $course["id"], $_POST["content"]);
    }
    if (isset($_GET["attend"]) && $_GET["attend"] != "")
    {
        if (is_attending($account, $_GET["attend"]))
            leave_post($account, $_GET["attend"]);
        else
            attend_post($account, $_GET["attend"]);
        header("Location: /" . SITE_ROOT . "/posts?course=" . $_GET["course"]);
    }
    if (isset($_GET["finish"]) && $_GET["finish"] != "")
    {
        finish_post($_GET["finish"]);
        header("Location: /" . SITE_ROOT . "/posts?course=" . $_GET["course"]);
    }
    ?>
<?php $account_info = get_account_info($account); ?>
<h1><?php echo $title ?> - <?php echo $course["title"] ?></h1>
<?php $users = get_users_in_vicinity($account_info["lat"], $account_info["long"], $course["id"]); ?>
<h2 style="color: #aaa"><?php echo count($users) - 1 ?> classmate<?php echo (count($users) != 2 ? "s" : "") ?> nearby</h2>
<form method="POST" action="">
<input type="text" required="required" size="60" placeholder="Where can others meet you?" name="content" /><input type="submit" value="Post" style="margin-left: 5px"/>
</form>
<?php
    $posts = get_posts_in_vicinity($account_info["lat"], $account_info["long"], $course["id"]);
    $first = true;
    foreach($posts as $p)
    {
        if ($p["active"] == "0")
            continue;
        $poster = get_account_info($p["user_id"]);
        if (!$first)
            echo "<hr>";
        $first = false;
        echo '<div class="post">';
        echo '<div class="userpic">' . substr($poster["first_name"], 0, 1) . '</div>';
        echo "<span style=\"font-weight: bold\">" . $poster["first_name"] . " " . $poster["last_name"] . "</span> <span style=\"color: #888\">&mdash; " . date("n/j/Y g:i A", strtotime($p["post_time"])) . "</span>";
        if ($p["user_id"] == $account)
            echo "<a href=\"?course=" . $_GET["course"] . "&finish=" . $p["id"] . "\"><div class=\"button finish\">Finished Studying</div></a>";
        else
            echo "<a href=\"?course=" . $_GET["course"] . "&attend=" . $p["id"] . "\"><div class=\"button attend\">" . (is_attending($account, $p["id"]) ? "Leave Session" : "Attend Session") . "</div></a>";
        echo "<br>";
        echo "<div style=\"clear: both\"></div>";
        echo "<p>" . $p["content"] . "</p>";
        $attendees = get_attendees($p["id"]);
        if (count($attendees) > 0)
        {
            echo "<div class=\"attendees\">";
            foreach($attendees as $a)
            {
                echo '<div class="userpic"><div>' . $a["first_name"] . " " . $a["last_name"] . '</div>' . substr($a["first_name"], 0, 1) . '</div>';
            }
            echo "</div>";
        }
        
        echo '</div>';
        echo "<div style=\"clear: both\"></div>";
    }
    ?>
<?php require_once("footer.php") ?>