<?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE); ?>
<head>
<title><?php echo $title . ' | ' . WEBSITE_NAME ?></title>
<link type="text/css" rel="stylesheet" href="styles.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>
</head>
<body>
<div id="content">
<div id="header">
<img src="logo.jpg" height="50" style="margin-right: 10px; margin-top: 10px; display: inline; margin-bottom: -5px"/><h1 id="title"><a href="<?php echo "/" . SITE_ROOT ?>"><?php echo WEBSITE_NAME ?></a></h1>
<div style="clear:both; display: block"></div>
<hr>
</div>
<div id="page">