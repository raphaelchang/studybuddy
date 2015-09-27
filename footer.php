</div>
<hr>
<div id="footer">
<div id="container">
&copy; 2015 StudyBuddy
<?php if ($account !== false) { ?>
<div style="float:right">Logged in as: <?php
    $account_info = get_account_info($account);
    echo $account_info["email"] ?> | <a href="logout">Logout</a></div>
<?php } ?>
</div>
</div>
</div>
</body>
