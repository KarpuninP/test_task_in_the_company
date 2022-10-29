let sorting_data = '';
    categories_array = [];
    price_array =[0,2100];
    size_clicked = '';
    id_array = [];

// When the page is fully loaded, this code is executed
$(document).ready(function () {
// Сonnect to api and get json
    getJSON('/api');

// price slider
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
    // Inference price range
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" +
        $( "#slider-range" ).slider( "values", 1 ));

//  When clicking on filters, events are triggered
    $(".filters, .ui-corner-all").click(function () {
// Sorting
        sorting_data = $('#sorting :selected').val();

// Categories
         size_clicked = $(this).attr("data-filter");
         if ($(this).is(":checked")) {
             categories_array.push(size_clicked);
        } else {
             categories_array = categories_array.filter(function (elem) {
                 return elem !== size_clicked;
             });
         }
         // Create url
         let url = '?sorting=' + sorting_data + '&price=' + price_array + '&categories=' + categories_array;
        // console.log(url);
        getJSON('/api/' + url);

        // console.log(categories_array);
        //  console.log(sorting_data);
        // console.log(price_array);
    });
});

// Function for receiving and displaying goods via json
function getJSON(url){
        $.getJSON(url, function(json) {
            // console.log(json);
            let count = json.length;
            let a = '';
            for (product of json) {
                let b =  '<div class="card" style="width: 18rem;"><img src="pic/mob/' + product.Picture + '"class="card-img-top" alt="Product photo"  height="350px"><div class="card-body"><h5 class="card-title product-name">' + product.ProductName + '</h5><h6 class="card-title product-price" style="color: #dc3545">Цена: ' + product.Price + '</h6><h7 class="card-title product-ram">RAM: ' + product.RAM_name + '</h7><br><h7 class="card-title product-color">Цвет: ' + product.Color_name + '</h7><br><h7 class="card-title product-manufacturer">Марка: ' + product.Manufacturer_name + '</h7><br><h7 class="card-title product-display">Разрешение: ' + product.Display_name + '</h7><p class="card-text product-description id' + product.Product_id + '">' + product.Description + '</p><br><p class="card-text product-data id' + product.Product_id + '"><b>Дата добовление товара: </b><br>' + product.Date + '</p><a href="" class="more" data-info="id' + product.Product_id + '" style="text-decoration: none;">more...</a></br><a href="' + product.Product_id + '"  class="btn btn-primary add-cart">Add to cart</a></div></div>';
                     a = a+b;
            }

            // Inserting html code into a page
            $('.product-grids').html(a);
            // We insert the count of how many products we have on the side price filter
            $('p span').text(count);
            // Hide everything
             $('.card-text').hide()

// When you click on the link, it expands the information about the product
            $('.more').click(function (e) {
                e.preventDefault();
                let idPost =  '.' + $(this).attr('data-info') ;
                //console.log(idPost);
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
// Function for cart in modal window
function cart(id) {
    if (!id_array.includes(id)) {
        id_array.push(id);
    }
    let url = '/api/cart?order=' + id_array;
    // console.log(url)
    $.getJSON(url, function(json) {
        // console.log(json);
        let a = '';
        for (product of json) {
            b = ' <tr><td><img src="pic/mob/' + product.Picture + '" alt="Product photo"  height="50px"></td><td>' + product.ProductName + '</td><td>' + product.Price + '</td></tr>';
            a = a + b;
        }
        // console.log(a);
        // Inserting html code into a page
        $('.cart-show').html(a);
    });

    // When you click on the order button in the modal window, we send the order to the server. Located in the cards function - if the cart is empty, then it does not send
    $('.modal-footer #order').click(function () {
        // console.log(id_array);
        $.ajax({
            url: '/order/',
            data: {id: id_array},
            type: 'POST',
            success: function(res){
                // console.log(res)
                 window.location.href = '/order/';
            },
            error: function(){
                alert('Error!');
            }
        });
    })
}











