<?php

namespace App\Controller;

use App\Utils\Base\Controller;

class OrderController extends Controller
{
    public function index(): void
    {
        // Проверяем что пришло
//        var_dump($_POST['id']);
        // Если нечего не пришло то ставим строку
        $post = $_POST['id'] ?? '';
        // Проверяем если неравно пустоте, то мы масив переводим в строку и засовываем в куки на час
        if ($post !== '') {
            $order = implode(',' , $post);
            setcookie('getOrder', $order, time() + 60 * 60);
        }

       var_dump($_COOKIE['getOrder']);

        // обычное отражение для странице
        $data = [];
        $this-> setMeta (
            'Главная страница',
            'Тестовое задание',
            'тест, интернет магазин'
        );
        // возвращает к подключению шаблон и передача данных
        $this->view('order.order', $data);
    }
}