<?php

namespace App\Utils\Base;

use App\Model\Shop;
use App\Utils\App;

abstract class Controller
{

    // название папки шаблон
    public $template = '';
    // название самого шаблона
    public $layout = 'shop';
    // Тут будет хранится данные
    public $data = [];
    // Тут будут мета даный хранится тайтл, дескрипшон
    public $meta = [
        'meta_author' => 'Karpunin Pavel',
        'meta_copyright' => 'amedomaro2@gmail.com',
        'meta_generator' => 'PhpStorm',
        'title' => '',
        'desc' => '',
        'keywords' => ''
    ];
    public $db ;



    public function __construct()
    {
        $this->db = new Shop();
    }

    // Для отрендование странички. Получаем параметры от базового контролера и перекидываем это class View
    public function getView(): void
    {
        //создаем обьект класса View и передаем туда параметры этого класса
        $viewObject = new View($this->layout, $this->template, $this->meta);
        $viewObject->show($this->data);

    }

    // формировать мето данные
    public function setMeta($title = '', $desc = '', $keywords = ''): void
    {
        $this->meta['title'] = $title;
        $this->meta['desc'] = $desc;
        $this->meta['keywords'] = $keywords;
    }

    // работа с датой
    public function view(string $template, array $data = []): void
    {
        // передаем название папки
        $this->template = $template;
        // засовываем все в свойства
        $this->data['siteData'] = $data;
    }

}