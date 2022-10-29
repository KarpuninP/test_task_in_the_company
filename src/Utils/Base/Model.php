<?php

namespace App\Utils\Base;

use PDO;
use App\Utils\Db;

abstract class Model
{
    protected static PDO $db;

    public function __construct()
    {
        // подключаем пдо
        self::$db = Db::getDb();
    }




}