<?php

namespace App\Utils\Base;

use App\Model\Shop;
use App\Utils\App;

abstract class Controller
{
    public $template = '';
    public $layout = 'shop';
    public $data = [];
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

    // For page rendering. We receive parameters from the base controller and throw this class View
    public function getView(): void
    {
        // Create an object of the View class and pass the parameters of this class there
        $viewObject = new View($this->layout, $this->template, $this->meta);
        $viewObject->show($this->data);

    }

    // Generate metadata
    public function setMeta($title = '', $desc = '', $keywords = ''): void
    {
        $this->meta['title'] = $title;
        $this->meta['desc'] = $desc;
        $this->meta['keywords'] = $keywords;
    }

    // Work with date
    public function view(string $template, array $data = []): void
    {
        $this->template = $template;
        $this->data['siteData'] = $data;
    }

}