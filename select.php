<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
    require_once("includes.php");
    $title = "Select Your Courses";
    require_once("header_home.php");
    if ($account === false)
    header("Location: /" . SITE_ROOT);
    ?>
<?php $account_info = get_account_info($account); ?>
<?php
    if(isset($_POST["submit"]))
    {
        $selected = array();
        foreach($_POST as $key => $value)
        {
            if (substr($key, 0, 3) == "num" && is_numeric($value))
                array_push($selected, $value);
        }
        set_user_courses($account, $selected);
        header("Location: /" . SITE_ROOT);
    }
    ?>
<h1>Select Your Courses</h1>
<h3>College: <?php
    $college = get_college_from_email($account_info["email"]);
    echo $college["name"] ?></h3>
<script type="text/javascript">
$(function() {
  $(document).on('click', "#btnAdd", function() {
                     var num        = $('.clonedInput').length;    // how many "duplicatable" input fields we currently have
                     var newNum    = new Number(num + 1);        // the numeric ID of the new input field being added
                     
                     // create the new element via clone(), and manipulate it's ID using newNum value
                     var newElem = $('#input' + num).clone().attr('id', 'input' + newNum).val("");
                     
                     // manipulate the name/id values of the input inside the new element
                     newElem.children('select:first').attr('id', 'dep' + newNum).attr('name', 'dep' + newNum);
                     newElem.children('select:last').attr('id', 'num' + newNum).attr('name', 'num' + newNum);
                     $('#input' + num).find('img').replaceWith('<img class="btnDel" id="' + num + '" src="x.png" height="20" style="cursor: hand; margin-bottom: -5px"/>');
                     
                     // insert the new element after the last "duplicatable" input field
                     $('#input' + num).after(newElem);
                     });
  
  $(document).on('click', ".btnDel", function() {
                 var num    = $(this).attr('id');
                 $('#input' + num).remove();
                 $('.clonedInput').each( function(i,e) {
                                        $(e).attr('id', 'input' + (i + 1));
                                        $(e).children('select:first').attr('id', 'dep' + (i + 1)).attr('name', 'dep' + (i + 1));
                                        $(e).children('select:last').attr('id', 'num' + (i + 1)).attr('name', 'num' + (i + 1));
                                        if (i < $('.clonedInput').length - 1)
                                            $(e).find('img').attr('id', '' + (i + 1));
                                        });
                 });
  $(document).on('change', "select", function() {
                 if ($(this).attr('id').substring(0, 3) != "dep")
                 return false;
                 var index = $(this).attr('id').substring(3);
                 var dept = $(this).find("option:selected").text();
                 $.ajax({ // ajax call starts
                        url: 'request_course_list.php',
                        data: {dept: dept, college: <?php echo $college["id"] ?>},
                        dataType: 'json', // Choosing a JSON datatype
                        })
                 .done(function(data) { // Variable data contains the data we get from serverside
                       $('#num' + index).html('<option selected="selected">Course Number</option>');
                       for (var i in data) {
                       console.log(i);
                       $("#num" + index).append($('<option></option>').attr('value', data[i].id).text(data[i].department + data[i].number + (data[i].title.length > 0 ? " (" + data[i].title + ")" : "" )));
                       }
                       });
                 return false;
                 });
  });
</script>
<form method="POST" action="">
<?php
    $courses = get_registered_courses($account);
    if (count($courses) == 0)
    {
    ?>
<div id="input1" class="clonedInput">
<select name="dep1" id="dep1">
<option selected="selected">Course Department</option>
<?php
    $depts = get_departments_in_college($college["id"]);
    foreach($depts as $d)
    {
        echo "<option value=\"" . $d . "\">" . $d . "</option>";
    }
    ?>
</select>
<select name="num1" id="num1">
<option selected="selected">Course Number</option>
</select>
<img id="btnAdd" src="+.png" height="20" style="cursor: hand; margin-bottom: -5px"/>
</div>
<div>
</div>
<?php } else {
    for($i = 0; $i < count($courses); $i++)
{ ?>
<div id="input<?php echo $i + 1 ?>" class="clonedInput">
<select name="dep<?php echo $i + 1 ?>" id="dep<?php echo $i + 1 ?>">
<option>Course Department</option>
<?php
    $depts = get_departments_in_college($college["id"]);
    foreach($depts as $d)
    {
        echo "<option ";
        if ($d == $courses[$i]["department"])
            echo "selected ";
        echo "value=\"" . $d . "\">" . $d . "</option>";
    }
    ?>
</select>
<select name="num<?php echo $i + 1 ?>" id="num<?php echo $i + 1 ?>">
<option>Course Number</option>
<?php
    $ccs = get_courses_in_department($courses[$i]["department"], $college["id"]);
    foreach($ccs as $c)
    {
        echo "<option ";
        if ($c["number"] == $courses[$i]["number"])
            echo "selected ";
        echo "value=\"" . $c["id"] . "\">" . $c["department"] . $c["number"] . (strlen($c["title"]) > 0 ? " (" . $c["title"] . ")" : "" ) . "</option>";
    }
    ?>
</select>
<?php if ($i == count($courses) - 1) { ?>
<img id="btnAdd" src="+.png" height="20" style="cursor: hand; margin-bottom: -5px"/>
<?php } else { ?>
<img class="btnDel" id="<?php echo $i + 1 ?>" src="x.png" height="20" style="cursor: hand; margin-bottom: -5px"/>
<?php } ?>
</div>
<div>
</div>
<?php }} ?>
<input type="submit" name="submit" value="Continue" />
</form>
<?php require_once("footer.php") ?>