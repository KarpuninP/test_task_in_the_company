<?php //var_dump($siteData);?>
<main>
    <div class="container">
        <div class="row main-body">
            <!-- Filters-->
            <div class="col-3 " >
                <div class="main-filter">
                    <!-- Sorting -->
                    <div class="sorting box">
                        <label for="sorting">Sorting</label>
                        <select class="form-select filters" id="sorting" aria-label="Default select example">
                            <option  value="0" id="sorting0" selected>Kind of sorting</option>
                            <option   value="1" id="sorting1">From cheap to expensive</option>
                            <option  value="2" id="sorting2" >Alphabetically</option>
                            <option  value="3" id="sorting3" >Novelties</option>
                        </select>
                    </div>
                    <!-- Price carousel -->
                    <div class="price box">
                        <p>
                            <label for="amount">Price range:</label>
                            <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold; width: 100%">
                        </p>
                        <div id="slider-range"></div>
                        <p style="margin-top: 5px ">Selected <span> </span> </p>
                    </div>
                    <!-- Categories -->
                    <div class="categories box">
                        <div class="ram-filter">
                            <label class="form-check-label" for="flex1">
                               RAM
                            </label>
                            <div class="form-check" id="flex1">
                                <input class="form-check-input filters" type="checkbox" value="" id="3gb" data-filter="r:1">
                                <label class="form-check-label" for="3gb">
                                    3 GB
                                </label>
                            </div>
                            <div class="form-check" id="flex1">
                                <input class="form-check-input filters" type="checkbox" value="" id="4gb" data-filter="r:2">
                                <label class="form-check-label" for="4gb">
                                    4 GB
                                </label>
                            </div>
                            <div class="form-check" id="flex1">
                                <input class="form-check-input filters" type="checkbox" value="" id="8gb" data-filter="r:3">
                                <label class="form-check-label" for="8gb">
                                    8 GB
                                </label>
                            </div>
                            <div class="form-check" id="flex1">
                                <input class="form-check-input filters" type="checkbox" value="16GB" id="16gb"  data-filter="r:4">
                                <label class="form-check-label" for="16gb">
                                    16 GB
                                </label>
                            </div>
                        </div>
                        <div class="manufacturer-filter">
                            <label class="form-check-label " for="flex2">
                                Manufacturer
                            </label>
                            <div class="form-check" id="flex2">
                                <input class="form-check-input filters" type="checkbox" value="" id="apple" data-filter="m:1">
                                <label class="form-check-label" for="apple">
                                    Apple
                                </label>
                            </div>
                            <div class="form-check" id="flex2">
                                <input class="form-check-input filters" type="checkbox" value="" id="meizu" data-filter="m:2">
                                <label class="form-check-label" for="meizu">
                                    Meizu
                                </label>
                            </div>
                            <div class="form-check" id="flex2">
                                <input class="form-check-input filters" type="checkbox" value="" id="samsung" data-filter="m:3">
                                <label class="form-check-label" for="samsung">
                                   Samsung
                                </label>
                            </div>
                            <div class="form-check" id="flex2">
                                <input class="form-check-input filters" type="checkbox" value="" id="xiaomi" data-filter="m:4">
                                <label class="form-check-label" for="xiaomi">
                                   Xiaomi
                                </label>
                            </div>
                        </div>
                        <div class="color-filter">
                            <label class="form-check-label" for="flex3">
                                Color
                            </label>
                            <div class="form-check" id="flex3">
                                <input class="form-check-input filters" type="checkbox" value="" id="gold" data-filter="c:1">
                                <label class="form-check-label" for="gold">
                                    Gold
                                </label>
                            </div>
                            <div class="form-check" id="flex3">
                                <input class="form-check-input filters" type="checkbox" value="" id="black" data-filter="c:2">
                                <label class="form-check-label" for="black">
                                    Black
                                </label>
                            </div>
                            <div class="form-check" id="flex3">
                                <input class="form-check-input filters" type="checkbox" value="" id="space-gray" data-filter="c:3">
                                <label class="form-check-label" for="space-gray">
                                    Space Gray
                                </label>
                            </div>
                            <div class="form-check" id="flex3">
                                <input class="form-check-input filters" type="checkbox" value="" id="stainless-steel" data-filter="c:4">
                                <label class="form-check-label" for="stainless-steel">
                                    Stainless Steel
                                </label>
                            </div>
                        </div>
                        <div class="resolution-filter">
                            <label class="form-check-label" for="flex4">
                                Resolution
                            </label>
                            <div class="form-check" id="flex4">
                                <input class="form-check-input filters" type="checkbox" value="" id="r1" data-filter="d:1">
                                <label class="form-check-label" for="r1">
                                    1280 x 720
                                </label>
                            </div>
                            <div class="form-check" id="flex4">
                                <input class="form-check-input filters" type="checkbox" value="" id="r2" data-filter="d:2">
                                <label class="form-check-label" for="r2">
                                    1920 x 1080
                                </label>
                            </div>
                            <div class="form-check" id="flex4">
                                <input class="form-check-input filters" type="checkbox" value="" id="r3" data-filter="d:3">
                                <label class="form-check-label" for="r3">
                                    2436 x 1125
                                </label>
                            </div>
                            <div class="form-check" id="flex4">
                                <input class="form-check-input filters" type="checkbox" value="" id="r4" data-filter="d:4">
                                <label class="form-check-label" for="r4">
                                    2960 x 1440
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Products-->
            <div class="col-9">
                <div class="product-grids"></div>
            </div>
        </div>
    </div>
</main>






