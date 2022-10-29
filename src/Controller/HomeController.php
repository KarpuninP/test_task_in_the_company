<?php

namespace App\Controller;

use App\Utils\Base\Controller;

class HomeController extends Controller
{
  public function index(): void
  {
      $data = [];
      $this-> setMeta (
          'Main page',
          'Test task',
          'test, online store, filters'
      );
      // Returns the template to the connection and data transfer
      $this->view('main.main', $data);
  }
}