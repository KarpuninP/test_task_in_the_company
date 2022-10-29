<?php

namespace App\Utils\Base;

use PDO;
use App\Utils\Db;

abstract class Model
{
    protected static PDO $db;

    public function __construct()
    {
        // Connect pdo
        self::$db = Db::getDb();
    }




}