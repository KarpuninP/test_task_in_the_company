<?php

namespace App\Utils\Base;

class View
{
    public $template;
    public $layout;
    public $data = [];
    public $meta = [];


    public function __construct(string $layout, string $template, array $meta)
    {
        $this->layout = $layout;
        $this->template = $template;
        $this->meta = $meta;
    }

    /**
     *
     * @throws \Exception
     */
    // Here start the formation of the page (reading)
    public function show(array $data): void
    {
        // Work with the data that came
        extract($data, EXTR_OVERWRITE);

        // Working with a view
        if($this->template == '') {
            $template = 'main';
        } elseif ($this->template) {
             $template = $this->template;
        } else {
            throw new \Exception("No view", 500);
        }

        $templatePath = str_replace('.', '/', $template);
        $viewFile = VIEW  . '/' . $templatePath . '.template.php';
//       var_dump( $viewFile);

        if(is_file($viewFile)){
            // We connect buffering https://www.php.net/manual/ru/function.ob-start.php
            ob_start();
            require_once $viewFile;
            // We put it all in the $content variable
             $content = ob_get_clean();
//            echo $content;
        }else{
            throw new \Exception("On the found view {$viewFile}", 500);
        }

        // Working with a template
        if($this->layout) {
            $layoutFile = VIEW . "/layouts/{$this->layout}.template.php";
//            var_dump($layoutFile);

            if (is_file($layoutFile)) {
                require_once $layoutFile;
            } else {
                throw new \Exception("Template not found {$this->layout}", 500);
            }
        }else {
            throw new \Exception("Template name not received ", 500);
        }
    }

    // Let's add metadata
    public function getMeta() : string
    {
        // Brief description of the page. In some cases, it may appear as
        $output = ' <meta name="author" content="' . $this->meta['meta_author'] . '">'. PHP_EOL;
        $output .= '<meta name="copyright" Content="'. $this->meta['meta_copyright'] . '">'. PHP_EOL;
        $output .= '<meta name="generator" content="'. $this->meta['meta_generator'] . '">'. PHP_EOL;
        $output .= '<meta name="description" content="' . $this->meta['desc'] . '">' . PHP_EOL;
        $output .= '<meta name="keywords" content="' . $this->meta['keywords'] . '">' . PHP_EOL;
        $output .= '<title>' . $this->meta['title'] . '</title>' . PHP_EOL;
        return $output;
    }

}