<?php

namespace App\Controller;

use App\Utils\Base\Controller;


class ApiController extends Controller
{
    // Getting data from the filter and outputting json format
    public function index(): void
    {
        // Перевод в json
       header('Content-type: json/application');

// ?sorting=3&price=93,2100&categories=r:1,r:2,r:3,r:4,m:1,m:2,m:3,m:4,c:1,c:2,c:3,c:4,d:1,d:2,d:3,d:4
//        var_dump($_GET);
//        var_dump( $_SESSION['getParam']);

        // Add a get parameter to the session so that the result is saved upon reboot
        if (!empty($_GET) & $_GET != $_SESSION['getParam']) {
            $_SESSION['getParam'] = $_GET;
        }else {
            $_SESSION['getParam'] = '?sorting=0&price=0,2100&categories=';
        }

        // validation
        $sorting = $_SESSION['getParam']['sorting'] ?? '';
        $price = $_SESSION['getParam']['price'] ?? '';
        $categories = $_SESSION['getParam']['categories'] ?? '';

        // Price sorting
        $sortingCheck = '';
        if($sorting == 1){
            $sortingCheck = 'ORDER BY products.Price ASC';
        }elseif ($sorting == 2) {
            $sortingCheck = 'ORDER BY products.ProductName';
        }elseif ($sorting == 3) {
            $sortingCheck = 'ORDER BY products.Date';
        }
//        var_dump($sortingСheck);

        // Work with the price
        $priceArr = explode(',' , $price);
        foreach ($priceArr as $v){
            if(!is_numeric($v)){
                $priceArr = [0,2100];
            }
        }
        //var_dump($priceArr);

        // Filters
        $categoriesArr = explode(',' , $categories);
        $categoriesArrCheck = [];
        foreach ($categoriesArr as $v) {
            // Take the first letter
            $checkThemeK = substr($v, 0, 1);
            // We take the number (last) and check for a number, if not a number returns true
            $checkThemeV = !is_numeric(substr($v, 2, 1)) ? '': substr($v, 2, 1);
            // Create an array with selected products
            if ($checkThemeV !== '') {
                if ($checkThemeK == 'r') {
                    $categoriesArrCheck['RAM_id'][] = $checkThemeV;
                } elseif ($checkThemeK == 'm') {
                    $categoriesArrCheck['Manufacturer_id'][] = $checkThemeV;
                } elseif ($checkThemeK == 'c') {
                    $categoriesArrCheck['Color_id'][] = $checkThemeV;
                } elseif ($checkThemeK == 'd') {
                    $categoriesArrCheck['Display_id'][] = $checkThemeV;
                }
            }
        }
//        var_dump($categoriesArrСheck);

        // Passing the entire request to the database
        $arr= $this->db->getAllSort($sortingCheck, $priceArr, $categoriesArrCheck);

//        debug($arr);
        // Output response as json
        echo $this->addJson($arr);
    }

    // Caches the result
    public function addJson(array $arr): string
    {
        $str = json_encode($arr);
        file_put_contents(ROOT . '/tmp/products.json', $str);
        return $str;
    }

    public function cart(): void
    {
        // Translation to json
        header('Content-type: json/application');
//        http://localhost/api/cart?order=1,2,3,6
//        var_dump($_GET);
        $order = $_GET['order'] ?? '';
        $orderArr = explode(',', $order);
//        var_dump($orderArr);
        $cart = $this->db->getOrder($orderArr);

//        debug($cart);
        // Output response as json
       echo json_encode($cart);
    }
}