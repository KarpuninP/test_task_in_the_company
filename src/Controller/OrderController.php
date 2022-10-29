<?php

namespace App\Controller;

use App\Utils\Base\Controller;

class OrderController extends Controller
{
    public function index(): void
    {
//        var_dump($_POST['id']);
        $post = $_POST['id'] ?? '';
        // We check if it is not empty, then we translate the array into a string and put it in cookies for an hour
        if ($post !== '') {
            $order = implode(',' , $post);
            setcookie('getOrder', $order, time() + 60 * 60);
        }

       var_dump($_COOKIE['getOrder']);

        // Normal reflection for the page
        $data = [];
        $this-> setMeta (
            'Main page',
            'Test task',
            'test, online store, filters'
        );
        $this->view('order.order', $data);
    }
}