<?php

// тут будем писать какие то функци которые будут вне класов и их можно будет в любом момент дергать.
// функция для дебага (типа var_dump();)
function debug($arr)
{
    echo '<pre>' . print_r($arr, true) . '</pre>';
}

// Функция перенаправление
function redirect($http = false)
{
    if($http) {
        // если у нас есть какойто адрес то сделаем редирект на него
        $redirect = $http;
    }else {
        // если нечего не передали то надо обновить страницу f5 туда откуда он пришол
        // если в масиве сервер (адрес который он пришол) если нет то на главную страницу
        $redirect = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : PATH;
    }
    // И отправят нас на страницу которая получилось выше
    header("Location: $redirect");
    exit;
}
