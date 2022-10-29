<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--bootstrap-->
        <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <!--jquery ui-->
        <link href="/css/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
        <!--style-->
         <link href="/css/style1.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div class="color">
    <!-- верхушка сайта, оглавление, менюшка -->
            <header>
                <div class="container">
                    <nav class="navbar ">
                        <div class="container-fluid">
                            <a class="navbar-brand">
                                <img src="https://picsum.photos/100?random=1" alt="Logo" width="35" height="29" class="d-inline-block align-text-top">
                                Test Exercise
                            </a>
                            <a class="d-flex cart" href="" data-bs-toggle="modal"  data-bs-target="#cartModal">
                                <p >cart</p>
                                <img src="/pic/cart-png.png" alt="Bootstrap" width="30" height="24">
                            </a>
                        </div>
                    </nav>
                    <h1>Product filtering in the online store </h1>
                </div>
            </header>

            <!-- середина, она и будет менятся-->
            <?=$content;?>

        </div>
        <!-- Подняться  верх -->
        <div class="position-relative text-user ">
            <p class="position-absolute bottom-0 end-0">
                <a  href="#">Up</a>
            </p>
        </div>

        <!-- Подвал -->
        <footer>
            <div class="navbar-fixed-bottom row-fluid bg-dark p">
                <div class="navbar-inner">
                    <div class="container-fluid ">
                        <div class="container d-flex justify-content-evenly" >
                            <a href="https://drive.google.com/file/d/1kFFqk3jLNddWAl8uNWE3x1n01AZZ581-/view?usp=sharing">Resume</a>
                            <a href="https://github.com/KarpuninP" >Git</a>
                            <a href="https://www.linkedin.com/in/pasha-karpunin-php-developer" >LinkedIn</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- модальное окно старт-->
        <div class="modal fade " id="cartModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cartModalLabel" >Cart</h5>
                        <button type="button"  class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="order-title">
                            <table class="table">

                                <tbody class="cart-show">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary close"  data-bs-dismiss="modal" >Close</button>
                            <button type="button" class="btn btn-primary"  id="order">order</button>
                        </div>
                </div>
            </div>
        </div>
        <!-- подключение js -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>


