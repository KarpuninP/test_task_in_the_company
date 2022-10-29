<?php
// The configuration file

// Debug mode 1 - debugging, 0 - production
define("DEBUG", 1);
// Direction to working folder
define("ROOT", dirname(__DIR__));
define("WWW", ROOT . '/public');
define("VIEW", ROOT . '/view');
define("APP", ROOT . '/app');
define("CORE", ROOT . 'App\Utils');
define("CONF", ROOT . '/config');

// Our url
$app_path = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['PHP_SELF']}";
$app_path = preg_replace("#[^/]+$#", '', $app_path);
define("PATH", $app_path);



