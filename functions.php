<?php
require_once('PasswordHash.php');
    
session_start();

function login($email, $password)
{
	global $db;
	
	if(isset($_COOKIE['session']))
        return 3;
		
	$db->Prepare('SELECT * FROM `users` WHERE email=\'$0\'');
	$db->Execute($email);
	
    if($db->RowCount() <= 0)
        return 1;
    
    $row = $db->Fetch();
    $hasher = new PasswordHash(8, false);
    
    if(!$hasher->CheckPassword($password, $row['password']))
        return 2;
        
	if($row['activated'] == 0)
        return 4;
		
    $secure = $hasher->HashPassword($email . ':' . uniqid() . ':' . $password);
    
    $db->Prepare('SELECT id FROM `sessions` WHERE user_id=\'$0\'');
    $db->Execute($row['id']);
	
    if($db->RowCount() <= 0)
    {
        $db->Prepare('INSERT INTO `sessions` (ip, session, user_id) VALUES (\'$0\', \'$1\', \'$2\')');
		$db->Execute($_SERVER['REMOTE_ADDR'], $secure, $row['id']);
    }
    else
    {
        $sess_row = $db->Fetch();
        $db->Prepare('UPDATE `sessions` SET ip=\'$0\', session=\'$1\', user_id=\'$2\' WHERE id=$3');
		$db->Execute($_SERVER['REMOTE_ADDR'], $secure, $row['id'], $sess_row['id']);
    }
	
	setcookie('session', $secure);
	
	return 0;
}

function load_session()
{
	global $db;
	
	global $account;
	$account = false;
    if(isset($_COOKIE['session']))
    {
        $db->Prepare('SELECT * FROM `sessions` WHERE session=\'$0\' LIMIT 1');
		$db->Execute($_COOKIE['session']);
		if($db->RowCount() <= 0)
        {
            setcookie('session', "", time() - 1);
        }
        else
        {
			$row = $db->Fetch();
            $account = $row['user_id'];
        }
    }
}

function logout()
{
	global $db;
	
    if(isset($_COOKIE['session']))
    {
		$db->Prepare('DELETE FROM `sessions` WHERE session=\'$0\' LIMIT 1');
		$db->Execute($_COOKIE['session']);
	} else
		return -1;

    setcookie('session', "", time() - 1);
    
    return 0;
}

function register($email, $password, $first, $last)
{
	global $db;
    $db->Prepare('SELECT id FROM `users` WHERE email=\'$0\'');
	$db->Execute($email);
    if($db->RowCount() > 0)
        return -1;
	$hasher = new PasswordHash(8, false);
    $password = $hasher->HashPassword($password);
	$firstname = ucfirst($first);
	$lastname = ucfirst($last);
	$db->Prepare("INSERT INTO users (email, password, first_name, last_name, activated) VALUES ('$0', '$1', '$2', '$3', '$4')");
	$db->Execute(trim($email), $password, trim($firstname), trim($lastname), 0);
	$db->Prepare("SELECT LAST_INSERT_ID()");
	$db->Execute();
	$id = $db->Fetch();
	$id = implode($id, "");
	$db->Prepare("SELECT UUID()");
	$db->Execute();
	$uuid = $db->Fetch();
	$uuid = str_replace("-", "", implode($uuid, ""));
	$uuid = substr($uuid, 0, 16);
	$db->Prepare("INSERT INTO activation_keys (`key`, user_id) VALUES ('$0', '$1')");
	$db->Execute($uuid, $id);
	return $uuid;
}

function activate_account($key)
{
	global $db;
	$db->Prepare("SELECT user_id FROM activation_keys WHERE `key`='$0'");
	$db->Execute($key);
	if($db->RowCount() == 1)
	{
        $id = $db->Fetch();
		$db->Prepare("UPDATE users SET activated='1' WHERE id='$0'");
		$db->Execute($id["user_id"]);
		$db->Prepare("DELETE FROM activation_keys WHERE `key`='$0'");
		$db->Execute($key);
		return $id;
	}
	return false;
}
    
    function get_account_info($id)
    {
        global $db;
        $db->Prepare("SELECT * FROM users WHERE id='$0'");
        $db->Execute($id);
        return $db->Fetch();
    }
    
    function get_college_from_email($email)
    {
        global $db;
        $domain = substr(strrchr($email, "@"), 1);
        $db->Prepare("SELECT * FROM colleges WHERE domain='$0'");
        $db->Execute($domain);
        return $db->Fetch();
    }
    
    function get_registered_courses($id)
    {
        global $db;
        $db->Prepare("SELECT * FROM courses WHERE id IN (SELECT course_id FROM user_courses WHERE user_id='$0')");
        $db->Execute($id);
        $ret = array();
        while($result = $db->Fetch())
        {
            array_push($ret, $result);
        }
        return $ret;
    }
    
    function get_courses_in_department($dept, $college)
    {
        global $db;
        $db->Prepare("SELECT * FROM courses WHERE department='$0' AND college_id='$1'");
        $db->Execute($dept, $college);
        $ret = array();
        while($result = $db->Fetch())
        {
            array_push($ret, $result);
        }
        return $ret;
    }
    
    function get_departments_in_college($college)
    {
        global $db;
        $db->Prepare("SELECT DISTINCT(department) AS department FROM courses WHERE college_id='$0' ORDER BY department ASC");
        $db->Execute($college);
        $ret = array();
        while($result = $db->Fetch())
        {
            array_push($ret, $result["department"]);
        }
        return $ret;
    }
    
    function set_user_courses($user_id, $courses)
    {
        global $db;
        $db->Prepare("DELETE FROM user_courses WHERE user_id='$0'");
        $db->Execute($user_id);
        foreach($courses as $c)
        {
            $db->Prepare("INSERT INTO user_courses (user_id, course_id) VALUES ('$0', '$1')");
            $db->Execute($user_id, $c);
        }
    }
    
    function get_course_info($id)
    {
        global $db;
        $db->Prepare("SELECT * FROM courses WHERE id='$0'");
        $db->Execute($id);
        return $db->Fetch();
    }
    
    function is_course_registered($course, $user)
    {
        global $db;
        $db->Prepare("SELECT * FROM user_courses WHERE user_id='$0' AND course_id='$1'");
        $db->Execute($user, $course);
        return $db->RowCount() > 0;
    }
    
    function add_post($user, $course, $content)
    {
        global $db;
        $db->Prepare("INSERT INTO posts (user_id, course_id, content, active) VALUES ('$0', '$1', '$2', '1')");
        $db->Execute($user, $course, $content);
    }
    
    function get_users_in_vicinity($lat, $long, $course)
    {
        global $db;
        $db->Prepare("SELECT * FROM users WHERE id IN (SELECT user_id FROM user_courses WHERE course_id='$0')");
        $db->Execute($course);
        $users = array();
        while($result = $db->Fetch())
        {
            $dist = haversineGreatCircleDistance($lat, $long, $result["lat"], $result["long"]);
            if ($dist < 150)
                array_push($users, $result["id"]);
        }
        return $users;
    }
    
    function get_posts_in_vicinity($lat, $long, $course)
    {
        global $db;
        $db->Prepare("SELECT * FROM users");
        $db->Execute();
        $users = array();
        while($result = $db->Fetch())
        {
            $dist = haversineGreatCircleDistance($lat, $long, $result["lat"], $result["long"]);
            if ($dist < 150)
                array_push($users, $result["id"]);
        }
        $ret = array();
        foreach($users as $u)
        {
            $db->Prepare("SELECT * FROM posts WHERE user_id='$0' AND course_id='$1'");
            $db->Execute($u, $course);
            while($result = $db->Fetch())
            {
                array_push($ret, $result);
            }
        }
        $temp = array();
        foreach ($ret as $key => $row)
        {
            $temp[$key] = $row['post_time'];
        }
        array_multisort($temp, SORT_DESC, $ret);
        return $ret;
    }
    
    function attend_post($user, $post)
    {
        global $db;
        $db->Prepare("INSERT INTO attendees (user_id, post_id) VALUES ('$0', '$1')");
        $db->Execute($user, $post);
    }
    
    function leave_post($user, $post)
    {
        global $db;
        $db->Prepare("DELETE FROM attendees WHERE user_id='$0' AND post_id='$1'");
        $db->Execute($user, $post);
    }
    
    function is_attending($user, $post)
    {
        global $db;
        $db->Prepare("SELECT * FROM attendees WHERE user_id='$0' AND post_id='$1'");
        $db->Execute($user, $post);
        return $db->RowCount() > 0;
    }
    
    function finish_post($post)
    {
        global $db;
        $db->Prepare("UPDATE posts SET active='0' WHERE id='$0'");
        $db->Execute($post);
    }
    
    function get_attendees($post)
    {
        global $db;
        $db->Prepare("SELECT * FROM users WHERE id IN (SELECT user_id FROM attendees WHERE post_id='$0' ORDER BY `id` DESC)");
        $db->Execute($post);
        $ret = array();
        while($result = $db->Fetch())
        {
            array_push($ret, $result);
        }
        echo mysql_error();
        return $ret;
    }
    
    function set_user_location($id, $lat, $lng)
    {
        global $db;
        $db->Prepare("UPDATE users SET lat='$0', `long`='$1' WHERE id='$2'");
        $db->Execute($lat, $lng, $id);
    }
    
    function haversineGreatCircleDistance(
                                          $latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000)
    {
        // convert from degrees to radians
        $latFrom = deg2rad($latitudeFrom);
        $lonFrom = deg2rad($longitudeFrom);
        $latTo = deg2rad($latitudeTo);
        $lonTo = deg2rad($longitudeTo);
        
        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;
        
        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                               cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
        return $angle * $earthRadius;
    }
?>