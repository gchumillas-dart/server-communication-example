<?php
header("Content-Type: text/xml; charset=utf-8");
require_once "vendor/autoload.php";
require_once "config.php";
use app\EditController;

$c = new EditController();
echo $c->getDocument();

