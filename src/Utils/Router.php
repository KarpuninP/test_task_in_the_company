<?php

namespace App\Utils;

class Router
{
    // start here
    public function process(): void
    {
            // We get an array with the full path of the controller and the name of the method that we want to pull (we got it all in the url)
            $action = $this->getAction();
            // We define it in our full path of the controller
            $controller = $action[0];
            // We define this as the name of the method
            $method = $action[1];
//          var_dump($method . ' - ' . $controller);
            // Create a controller
            $object = new $controller;
            // Run the method
            $object->$method();
            // Run base template
        if($controller !== '\App\Controller\ApiController') {
            $object->getView();
        }
    }

    /**
     * @throws \Exception
     */
    // Breaks the url link and returns the name of the controller and method as an array.
    private function getAction(): array
    {
        $url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        // We split the reference to the array by elements. 0 key is empty, 1 is controller, 2 is action(method)
        $url = explode('/', $url);

        if (empty($url[1])) {
            $controller = '\App\Controller\HomeController';
        } else {
            $controller = '\App\Controller\\' . ucfirst($url[1]) . 'Controller';
            if (!class_exists($controller)) {
                throw new \Exception('No such class: ' . '"' . $controller . '"', 404);
            }
        }

        if (empty($url[2])) {
            $method = 'index';
        } else {
            $method = $url[2];
            //var_dump($method);
        }
       // var_dump($method);
        if (!method_exists($controller, $method)) {
            throw new \Exception('No method: "' . $method  . '" in the class: ' . '"' . $controller . '"', 404);
        }

        return [$controller, $method];
    }
}