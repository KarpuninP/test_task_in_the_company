<?php

namespace App\Utils;

class ErrorHandler
{
    // In the config->init.php file, we created the debag constant and here we will use it
    public function __construct()
    {
        // Error display
        // If debug constant is 1 (true) then we use error output. And if 0 (fulls) then no
        if(DEBUG){
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(-1);
        }else{
            error_reporting(0);
        }

        set_exception_handler([$this, 'exceptionHandler']);
    }

    // In this function, we catch errors and connect 2 functions that are written below, here we just interfere with what is needed in the function
    public function exceptionHandler(object $e): void
    {
        $this->displayError('Exception', $e->getMessage(), $e->getFile(), $e->getLine(), $e->getCode());
    }


    // Here we will create a public->errors folder and it will contain 3 files 404.php / dev.php / prod.php
    protected function displayError(string $errno, string $errstr, string $errfile, int $errline, int $responce = 404): void
    {
        http_response_code($responce);
        if($responce == 404 && !DEBUG) {
            require VIEW . '/errors/404.template.php';
            die;
        }

        if(DEBUG) {
            require VIEW . '/errors/dev.template.php';
        }else{
            require VIEW . '/errors/prod.template.php';
        }
        die;
    }
}