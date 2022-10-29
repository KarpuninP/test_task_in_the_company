<?php

namespace App\Model;

use App\Utils\Base\Model;
use PDO;

class Shop extends Model
{
    public function getAllSort(string $sortingCheck, array $priceArr, array $categoriesArrCheck): array
    {
        //Проверяем что пришло
//        var_dump($sortingCheck);
//        var_dump($priceArr);
//        var_dump($categoriesArrCheck);

        // Формируем запрос к нашему запросу сортировки
        $categoriesMysql = '';
        // Если масив не пустой то проходимся по масиву и создаем строку подставляя нужные элементы
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

        // формируем строку и вставляем данные (sql иньекции) Генерируем запрос к базе данных
        $sql = sprintf('SELECT products.Product_id, products.ProductName, products.Description, products.Picture, products.Price,
                        ram.RAM_name, display.Display_name, manufacturer.Manufacturer_name, color.Color_name, products.Date
                        FROM products
                            JOIN ram ON products.RAM_id = ram.RAM_id
                            JOIN display ON products.Display_id = display.Display_id
                            JOIN manufacturer ON products.Manufacturer_id = manufacturer.Manufacturer_id
                            JOIN color ON products.Color_id = color.Color_id 
                        WHERE products.Price > ? AND products.Price < ?  ' . $categoriesMysql . $sortingCheck
           );
        // Подготавливаем и подставляем данные получаем асоциативный масив и возрашаем его
        $stm = self::$db->prepare($sql);
        $stm->execute($priceArr);
        return $stm->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getOrder(array $order): array
    {
        // Подсчитываем сколько в масиве значений
        $numberArr = count($order);
        // с помощю цикла получаем знаки вопроса для sql иньекции
        $i = 1;
        $str = ', ?';
        $mark  = '';
        while ($i <= $numberArr) {
            $mark .=  $str;
            $i++;
        }
        // убираем первую запятую
        $markArr = substr($mark, 1);

        // формирует запрос и подвляем туда знаки вопроса
        $sql = sprintf('SELECT ProductName, Picture, Price FROM products WHERE Product_id IN (' . $markArr .')');

        // подключение к пдо и у него в свойствах мы подготавливаем запрос
        $stm = self::$db->prepare($sql);
        // передает параметр вместо ?
       $stm->execute($order);
        // если вернется фолс, то ретурн пустой масив
        return $stm->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }


}