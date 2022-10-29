<?php

namespace App\Controller;

use App\Utils\Base\Controller;

class HomeController extends Controller
{
  public function index(): void
  {
      $data = [];
      $this-> setMeta (
          'Главная страница',
          'Тестовое задание',
          'тест, интернет магазин'
      );
      // возвращает к подключению шаблон и передача данных
      $this->view('main.main', $data);
  }
}