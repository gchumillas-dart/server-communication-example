<?php
header("Content-Type: text/xml; charset=utf-8");
require_once "vendor/autoload.php";
require_once "config.php";
use app\ListController;

$c = new ListController();
echo $c->getDocument();
