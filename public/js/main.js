// Создаем переменные для работы
let sorting_data = '';
    categories_array = [];
    price_array =[0,2100];
    size_clicked = '';
    id_array = [];

// Когда страница полностью загружена срабатывает этот код
$(document).ready(function () {
// подключаемся к api и получаем json
    getJSON('/api');

// слайдер цены
    $( "#slider-range" ).slider({
        range: true,
        min: 0,
        max: 2100,
        values: [0, 2100 ],
        slide: function( event, ui ) {
            $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        },
        change: function (event, ui) {
            //console.log(ui.values[ 0 ] + " - " + ui.values[ 1 ])
            price_array = [ui.values[ 0 ], ui.values[ 1 ]];
        }
    });
    // Вывод цены слайдера 'Price range:'
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" +
        $( "#slider-range" ).slider( "values", 1 ));

//  При нажатие на фильтры срабатывают события
    $(".filters, .ui-corner-all").click(function () {
// Сортировка
        // Выбрана засовывается значение в переменную
        sorting_data = $('#sorting :selected').val();

// категории
         size_clicked = $(this).attr("data-filter"); // при выборе будет закидыватся атрибут сюда
         if ($(this).is(":checked")) {  // идет проверка если выбран то кидаем сюда
             // как то добавить сюда ключ типа checkbox
             categories_array.push(size_clicked);  // добовляем в конец масива то что выбрал
        } else {
             //Галочку убрали то удоляем
             categories_array = categories_array.filter(function (elem) {
                 return elem !== size_clicked;
             });
         }
         // Форимруем Гет запрос в url с выбраными параметрами
         let url = '?sorting=' + sorting_data + '&price=' + price_array + '&categories=' + categories_array;
        // console.log(url); // смотрим что получилось
        // Запускаем функцию по получение JSON с гет параметрами
        getJSON('/api/' + url);
        // проверяем что в фильтрах
        // console.log(categories_array);
        //  console.log(sorting_data);
        // console.log(price_array);
    });
});

// Функция по получение и отображению товаров через json
function getJSON(url){
        // Получаем сылку перехода и
        $.getJSON(url, function(json) {
            // console.log(json); // проверка
            // Проходимся по масиву циклом и подставляем данные
            let count = json.length;
            let a = '';
            for (product of json) {
                let b =  '<div class="card" style="width: 18rem;"><img src="pic/mob/' + product.Picture + '"class="card-img-top" alt="Product photo"  height="350px"><div class="card-body"><h5 class="card-title product-name">' + product.ProductName + '</h5><h6 class="card-title product-price" style="color: #dc3545">Цена: ' + product.Price + '</h6><h7 class="card-title product-ram">RAM: ' + product.RAM_name + '</h7><br><h7 class="card-title product-color">Цвет: ' + product.Color_name + '</h7><br><h7 class="card-title product-manufacturer">Марка: ' + product.Manufacturer_name + '</h7><br><h7 class="card-title product-display">Разрешение: ' + product.Display_name + '</h7><p class="card-text product-description id' + product.Product_id + '">' + product.Description + '</p><br><p class="card-text product-data id' + product.Product_id + '"><b>Дата добовление товара: </b><br>' + product.Date + '</p><a href="" class="more" data-info="id' + product.Product_id + '" style="text-decoration: none;">more...</a></br><a href="' + product.Product_id + '"  class="btn btn-primary add-cart">Add to cart</a></div></div>';
                     a = a+b;
            }

            // Вставляем html код на страницу
            $('.product-grids').html(a);
            // Вставляем подсчет сколько у нас товаров на боковую фильтр цен
            $('p span').text(count);
            // спрятали все
             $('.card-text').hide()

// При нажатие на сылку она раздвигает информация о товаре
            // при нажатие срабатывает событие. Отменяем действие перехода. Получаем id поста на который нажали - это
            // будет у нас класс для обрашение к посту. Проверяем через консоль что все работает
            $('.more').click(function (e) {
                e.preventDefault();
                let idPost =  '.' + $(this).attr('data-info') ;
                //console.log(idPost);
                // Проверяем если текст 'more...' то мы показываем дескрипшон, меняем текст на 'hide'.
                // Иначе прячем и ставим опять more...
                if($(this).text() === 'more...'){
                    $(idPost).show(500);
                    $(this).text('hide');
                }else {
                    $(idPost).hide(200);
                    $(this).text('more...');
                }
            });

            $('.add-cart ').click(function (e) {
                e.preventDefault();
                let id = $(this).attr('href');
                cart(id);
            })

        });

}
// Функция для карзины в модальное окно
function cart(id) {
    // Если новый айдишник то он добовляется в конце масива
    if (!id_array.includes(id)) {
        id_array.push(id);
    }
    // Формируем URL
    let url = '/api/cart?order=' + id_array;
    // console.log(url)
    // Получаем JSON фаил и обрабатываем его. Выводим проходясь по масиву и подставляем все
    $.getJSON(url, function(json) {
        // console.log(json); // проверка
        // Проходимся по масиву циклом и подставляем данные
        let a = '';
        for (product of json) {
            b = ' <tr><td><img src="pic/mob/' + product.Picture + '" alt="Product photo"  height="50px"></td><td>' + product.ProductName + '</td><td>' + product.Price + '</td></tr>';
            a = a + b;
        }
        // console.log(a);
        // Вставляем html код на страницу
        $('.cart-show').html(a);
    });

    // При нажатие на кнопку заказать в модальном окне мы отправляем заказ на сервер. Находится в функции карт - если корзина пустая то он не отправляет
    $('.modal-footer #order').click(function () {
        // console.log(id_array);
        $.ajax({
            url: '/order/',
            // запрос на id  товара
            data: {id: id_array},
            type: 'POST',
            // принимает ответ
            success: function(res){
                // обновляем модальное окно
                // console.log(res)
                // Переход на страничку заказа
                 window.location.href = '/order/';
            },
            // а случии ошибки то делаем ошибку
            error: function(){
                alert('Error!');
            }
        });
    })
}











