<?php

namespace App\Utils;

class App
{
    public function __construct()
    {
        // Session start
        session_start();

        // We create a class with our exceptions so that they connect
        new ErrorHandler();

        // We connect our router (router)
       $router = new Router();
        // Run the method
        $router->process();

    }
}