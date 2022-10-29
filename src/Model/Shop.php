<?php

namespace App\Model;

use App\Utils\Base\Model;
use PDO;

class Shop extends Model
{
    public function getAllSort(string $sortingCheck, array $priceArr, array $categoriesArrCheck): array
    {
//        var_dump($sortingCheck);
//        var_dump($priceArr);
//        var_dump($categoriesArrCheck);

        // We form a request to our sort request
        $categoriesMysql = '';
        if (!empty($categoriesArrCheck)) {
            foreach ($categoriesArrCheck as $k => $v) {
               if ($k == 'RAM_id') {
                   $categoriesMysql .= ' AND ram.RAM_id IN (' . implode( ', ' , $v) . ') ' ;
               }elseif ($k == 'Manufacturer_id') {
                   $categoriesMysql .= ' AND manufacturer.Manufacturer_id IN (' . implode( ', ' ,$v) . ') ' ;
               } elseif ($k == 'Color_id') {
                   $categoriesMysql .= ' AND color.Color_id IN (' . implode( ', ' ,$v) . ') ' ;
               } elseif ($k == 'Display_id') {
                   $categoriesMysql .= ' AND display.Display_id IN (' . implode( ', ' ,$v) . ') ' ;
               }
            }
        }
//        var_dump($categoriesMysql);

        // Form a string and insert data (sql injection) Generate a query to the database
        $sql = sprintf('SELECT products.Product_id, products.ProductName, products.Description, products.Picture, products.Price,
                        ram.RAM_name, display.Display_name, manufacturer.Manufacturer_name, color.Color_name, products.Date
                        FROM products
                            JOIN ram ON products.RAM_id = ram.RAM_id
                            JOIN display ON products.Display_id = display.Display_id
                            JOIN manufacturer ON products.Manufacturer_id = manufacturer.Manufacturer_id
                            JOIN color ON products.Color_id = color.Color_id 
                        WHERE products.Price > ? AND products.Price < ?  ' . $categoriesMysql . $sortingCheck
           );
        // We prepare and substitute the data, get an associative array and return it
        $stm = self::$db->prepare($sql);
        $stm->execute($priceArr);
        return $stm->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getOrder(array $order): array
    {
        // Count how many values are in the array
        $numberArr = count($order);
        $i = 1;
        $str = ', ?';
        $mark  = '';
        while ($i <= $numberArr) {
            $mark .=  $str;
            $i++;
        }
        // Remove the first comma
        $markArr = substr($mark, 1);

        // Forms a query and puts question marks there
        $sql = sprintf('SELECT ProductName, Picture, Price FROM products WHERE Product_id IN (' . $markArr .')');

        // Connection to pdo and in its properties we prepare a request
        $stm = self::$db->prepare($sql);
        // Passes parameter instead of ?
       $stm->execute($order);
        return $stm->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }
}