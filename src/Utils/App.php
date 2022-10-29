<?php

namespace App\Utils;

class App
{
    public function __construct()
    {
        // Старт сессии
        session_start();

        // Создаем класс с нашими эксепшонами, что бы они подключились
        new ErrorHandler();

        // Подключаем наш роутер (маршрутизатор)
       $router = new Router();
        // Запускаем метод
        $router->process();

    }
}