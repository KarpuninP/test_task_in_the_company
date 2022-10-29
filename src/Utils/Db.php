<?php

namespace App\Utils;

use PDO;

trait Db
{
    public static function getDb(): PDO
    {
        // Конфигурационные файлы нашей бд засовываем в переменую для подключение
        $db = require_once CONF . '/config_db.php';
//         var_dump($db );
        $dbh = new PDO($db['dsn'], $db['user'], $db['pass']);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
        return $dbh;
    }
}