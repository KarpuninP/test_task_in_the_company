CREATE USER 'admin'@'172.25.0.6' IDENTIFIED BY 'test';
GRANT ALL ON *.* TO 'admin'@'172.25.0.6';
FLUSH PRIVILEGES;

create table color
(
    Color_id   int auto_increment
        primary key,
    Color_name varchar(50) not null
);

INSERT INTO app.color (Color_id, Color_name) VALUES (1, 'Gold');
INSERT INTO app.color (Color_id, Color_name) VALUES (2, 'Black');
INSERT INTO app.color (Color_id, Color_name) VALUES (3, 'Space Gray');
INSERT INTO app.color (Color_id, Color_name) VALUES (4, 'Stainless Steel');

create table display
(
    Display_id   int auto_increment
        primary key,
    Display_name varchar(100) not null
);
INSERT INTO app.display (Display_id, Display_name) VALUES (1, '1280 x 720');
INSERT INTO app.display (Display_id, Display_name) VALUES (2, '1920 x 1080');
INSERT INTO app.display (Display_id, Display_name) VALUES (3, '2436 x 1125');
INSERT INTO app.display (Display_id, Display_name) VALUES (4, '2960 x 1440');

create table manufacturer
(
    Manufacturer_id   int auto_increment
        primary key,
    Manufacturer_name varchar(50) not null
);
INSERT INTO app.manufacturer (Manufacturer_id, Manufacturer_name) VALUES (1, 'Apple');
INSERT INTO app.manufacturer (Manufacturer_id, Manufacturer_name) VALUES (2, 'Meizu');
INSERT INTO app.manufacturer (Manufacturer_id, Manufacturer_name) VALUES (3, 'Samsung');
INSERT INTO app.manufacturer (Manufacturer_id, Manufacturer_name) VALUES (4, 'Xiaomi');

create table products
(
    Product_id      int auto_increment
        primary key,
    ProductName     varchar(30)    not null,
    Description     text           not null,
    Picture         varchar(30)    not null,
    Price           decimal(10, 2) not null,
    RAM_id          int            not null,
    Display_id      int            not null,
    Manufacturer_id int            not null,
    Color_id        int            not null,
    Date            datetime       null
);
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (3, 'Apple iPhone 6s', 'iPhone 6 ???????? ???? ???????????? ????????????, ???? ?? ?????????? ???? ???????? ????????????????????. ????????????, ???? ?????? ???????? ????????????. ?????????? ????????????, ???? ?????????????????????? ??????????????????????????????????. ?? ?????????????? ?????????????????????????? ????????????????????????, ???????????? ?????????????????????? ?? ?????????? ?????????????? Retina HD. ?????? ???????? ?????????????????????? ??????????, ?????? ???????????????????? ?????????????????? ?? ?????????????????????? ?????????????????????? ???????????????? ?? ????????????, ???????????????? ?????????? ?????????????????? iPhone, ????????????, ?????? ??????????-????????.', 'Apple_iPhone_6s.jpg', 660.00, 2, 2, 1, 3, '2022-10-01 11:58:59');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (4, 'Apple iPhone 8 Plus', '???????????????? ???? ?????????? ???? ?????????? ?? ????, ?????? ?????????????????? ?????? ?????????? ???????????????? ??????????????????????, ?????????????? ?????????????????????? ?? ?????????????????? ??????????????. ???????????????? Apple ???????????? ?????????? ???????????????????????? ???????????????????????????????????? ????????????????????, ?????????????? ?????????????????? ?????????????????????????? ???????? ?????????????????????? ??????????????????????, ???????????????????? ????????????????????. ?? ???????? ???????? ?????? ???????????? ?????????? Apple iPhone 8 Plus Space Gray, ???????????? ?? ???????????????? ???????????? ???????????????? ?????????????????? ???? ?????????????? ????????????, ???????????????????? ???? 50% ????????. ?????????????? ?????????????????? ?????????? ???????????? ?????????????????????? ?????????? ??????????????????????, ?? ?????????????? ???????????? ?????????? ?? ???? ????????????????????.', 'Apple_iPhone_8_Plus.jpg', 1152.60, 2, 1, 1, 2, '2022-10-02 12:08:00');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (5, 'Apple iPhone 11', '???? ?????????????????? ???? ?????????? 11 ?? ??????????, ???????? ????????????, ???? ????????, ?? ???????????? ?????????????????????? iPhone XR. ?????????????? ?????????????????????? ???????????????? ?? ??????????????, ?????????? ???????? ?????????????? (?????????????? ?? ????????????????????); ?? ??????????????????, ????????, ???????????? ?? ?????????????????????? ????????????, ???????? ?????????????? ???? 50% ????????????????????; ?? ?????????? ?? ?????????????????????? ?????????????? ??????????????. ???? ???????????????????? ??????????????????????, ????, ???????? ???????????????? ???????????? ???? ????????- ?? ?????????????????????? ?????? ?????????????????? ?? ?????????????? 11 Pro ?? 11 Pro Max, ?????????????? iPhone 11 ?????????? ?????????????? ???????????? ??????????????????, ?????? ???????????????????? ???????? ?? ??????????.', 'Apple_iPhone_11.jpg', 489.00, 3, 4, 1, 3, '2022-10-03 12:08:05');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (6, 'Apple iPhone 13', '?????????????????????????????? ?????????? ???????????????????? ???????????????????? ?????????????????? ???? ?????????? 13-???? iPhone ?? ???????????? Pro. ?????????? ???????????? ???????????????? ???? ???????????? ?????????????????? ????????????????. ?????? ???????? ???? ???????????????? ?????????????? ??????????????? ?????????????? ??????????????????????.

', 'Apple_iPhone_13.jpg', 999.99, 3, 4, 1, 2, '2022-09-28 12:08:08');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (7, 'Apple iPhone 14 Pro', '???? ?????????????? ???????? ???????????? ???????????????? ???????????? ?? ?????????????????? ?????????????????? ???? ????????????????????. ?????????? ???????????????? ???????? ???????? ?? ?? ???????????? 14 Pro ?????????????? ??????????????????, ???? ??????????????, ???????????? ?????????? ?????????? ???????????????? ???????????? ???????????? ?????? ???????????????????? ???????????? ?? ???????????????? ??????????????.', 'Apple_iPhone_14.jpg', 2050.00, 4, 4, 1, 2, '2022-10-06 12:08:14');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (8, 'Apple iPhone Xs', '???????????? ???????????? ?? ???????????? ?????????????????? iPhone ?????????????? ???? ?????????? ???????????????????????? ??????????????????, ???????????????? ???????????? ???????????? ?????????????? ?????????????? ?????????????? ???? ?????????????? ???????????????????????? ?????????????????????? ?? ?????????????????????? ???????????????????? ???? ???????????????? ????????????. ?????? ???? ????????, Apple iPhone X S ??? ???? ???????? ???? ??????????????????????, ?? ???????????????????? ?????????????????????? ???????????????????? ??????????.', 'Apple_iPhone_Xs .jpg', 565.00, 2, 3, 1, 4, '2022-10-02 12:08:16');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (9, 'Samsung Galaxy A53', '??????????????????. ???? ?????????? ???? ?????????????????? ?????????????? ???????????????? Galaxy ?????????? ?? 5G. ?????????????????? ??''?????????????? ???????????????????? ???????????????????????? ????????????????...', 'Samsung _Galaxy_A53.jpg', 423.00, 2, 2, 3, 2, '2022-10-02 12:23:52');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (10, 'Samsung Galaxy S21', 'Samsung Galaxy S21 Fan Edition ??? ?????????????????????? ?????? ???????????????? ?????????? ???????????????????? ???????????? ???????????????????????? ????????????????????. ???? ?????????? ???????????? ?????????????????????? ???????????? ???????????????? ?? ?????????????????? ????????????, ?? ?????????????????? ?????????????????? ???? ?????????????? ???????? ???? ?????????????????????? ???????????????????? ????????????????.', 'Samsung_Galaxy_S21.jpg', 523.00, 2, 3, 3, 3, '2022-10-03 12:23:56');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (11, 'Samsung Galaxy S22 ', '?????????????? Samsung Galaxy S22 Ultra ???????????? ?????????????????????????? ?????? ?????????? ?? ?????????????????????? ?????????????? ???????????? ?????????????? ?????????????????????????????????????? ?????????????? ?????????????????????? ???????????? ???? ?????????????? 2022 ????????. ?????? ?????????????? ???? ???????? ?????????????????????? ?? ???????????? ?????????? ???????????????????? Galaxy Note.', 'Samsung_Galaxy_S22.jpg', 989.99, 3, 4, 3, 2, '2022-10-03 12:23:59');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (12, 'Samsung Galaxy M52', '???????????????????? ???????????????? ????????????-?????????? ?? ???????????? ?????????????????? ???????????????????? ?? ???????????????????? ???????????? ?? ???????????????????????????????? ?????????????????? ?????????????? 5G. ???????????????? ?????????????? ?????????????? ???????????????? ?????????????? ?? ?????????????????? ???? ?????????????????? 6.7 ????????????. ?? ???????????? ?????????????? ???????????? ???????????? ?? ???????????????? ?????????????? ???????? Super AMOLED Plus ?? ???????????????????? ???????????????? ?????????????????? ???? 120 ????. ???? ???????????? "??????????????" ???????????? ???????????? Samsung Galaxy M52 5g 128GB / 6gb ???????????????????????? ?????????????? ?????????? ?????? ????''?????????? 32 ???? ??????????-????????????.', 'Samsung_Galaxy_M52.jpg', 260.00, 1, 1, 3, 2, '2022-10-02 12:24:03');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (13, 'Samsung Galaxy A52', 'Samsung Galaxy A52 ??? ?????????????? ???????????????????? ????????????????, ?????????????? ???????????????? ???????????????? ???????????????? ?????????? ???????????????????? ???????????????????? ?? ????????????????????...', 'Samsung_Galaxy_A52.jpg', 355.00, 1, 2, 3, 2, '2022-10-02 12:24:06');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (14, 'Meizu Pro 7 Plus', '?????????????????? ?????????? ???????????????????? ??? ???????????????? ?????????????????? ???????????????? ???????????????? Meizu. ???????????????????????????? ?????????????? ?????????????????? ?????????????? Pro 7 ???????????????? ???????????????????? ????????????????, ???? ?????????????? ????????????????. ???????????????????????????????????? AMOLED ?????????????? ?? ?????????????????? ?? ?????????????????????? ?????????????????????? ???????? ?????????????????????????? ?????????????????????? ?????????????????? ?? ?????? ?????????? ??????????????????????.', 'Meizu_Pro_7_Plus.jpg', 365.00, 1, 2, 2, 1, '2022-10-06 12:28:12');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (15, 'Xiaomi Redmi Note 11', '???????????????? ?????????????????? ?????? Xiaomi, ???? ?????????????????? ???? ?????????????????????? ?????????????????? ?? ???????????????? ?????????????????? ????????????-???????????????? ?????????????????? ??????????????????. ?????????? ?????????? ???? ?????????? ???? ???????????? ???????????? ??? ?????????????? AMOLED-?????????? 6.43-???????????????? ?????????????????????? ???? ??????????????????. ???????????? ???????????????????????????? ???? ?????????? ???????????????? ???????????????????? ?????????????? Full HD +(2400??1080 ????????????????). ?????????????? ?????????????????? ?? ?????????????? ?????????????????? 90 ????. ???????????????? Xiaomi Redmi Note 11 64 GB ?????????????????????? ???? ???????????????????????????? ???????????????????? ?????????????????? Snapdragon 680, ???????? ???????????????????????? ???????????????? Adreno 610.', 'Xiaomi_Redmi_Note_11.jpg', 425.50, 2, 2, 4, 3, '2022-10-06 12:38:10');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (16, 'Xiaomi Redmi 10', '?????????? ?????????? ?????????? ???????????????????????? ?????????? ???????????? Xiaomi Redmi 10, ?? ???????? ???????????? ?????????????????????? ?????? ???????????????? ?????????? ?????? ?????????? ???????????????????? ??????''?????? ?? ???????????? ?????????????? ?????????? ?????????????????????????? ???????????????????? LTE. ?? ???????????? ???????????? ?????????????????? ?????????? ???? ?????????????????????????? ?????? ??????????????????????. ???????? ???????????????? ?????????????????? ?????? ?????? ???? ?????????????????????? ???? ???????????????????? ?????????????? MediaTek Helio G88 ?????????? ?? 4/64 ???? ??????''??????. ???? ???????????????? ???????????? ?????????????????? ???????????????????????? IPS-?????????? ?? ?????????????????? ???? ?????????????????? 6.5 ????????????, ???????????????????? ?????????????????? ???????????????? Full HD+ (2400??1080 ????????????????), ???????????????????? ???????????????? ?????????????????? ???? 90 ????.', 'Xiaomi_Redmi_10.jpg', 350.00, 2, 1, 4, 4, '2022-10-06 12:38:13');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (17, 'Xiaomi Redmi 9A ', '???????? ???????????????????? ?? ???????????????? ?????????????????? ???????????????? ?????? ???????????? ?????????????????????? ?????? ?????????????? ???????????????????? ?????????? Xiaomi. ???????????? ???????? ???????? ?????????????? ???????????????? ?????????????? ?????????? MediaTek Helio G25 ?? ?????????????????? ?? ?????????? ?????????????????????????? ???????????????? ???? 5000 ??????????. ?????????????????????????????? ?????????????????? ?????????? ?? ?????????????? ???????????????????????? ?????????????? HD+ ???????????????????? ?????????????????? ???????? ?????????????????????? ???????? ???????????????????? ???????????? Xiaomi Redmi 9A ?? ???????????? ??????????????-???????????????? ??????????????????????.', 'Xiaomi_Redmi_9A .jpg', 152.99, 1, 1, 4, 2, '2022-10-12 12:38:14');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (18, 'Xiaomi Redmi Note 10 Pro', '???????????????????? ????????-?????????????? ?????????????????????? ?????????????????? Poco X3 GT, ?????????????????????? ???? ??''?????? ???????????????????????? ?????????????????? ?????????????????? ??????????????????. ???? ?????????? ???????????????????????????? ?????????????? ???????????????????? ?????????????? ???????????????????? "??????????????" ?? ???????????? ???????????????????????????? ?????????????????? MediaTek Dimensity 1100 ?? 6/128 ???? ???????????????????????????? ??????''??????. ???????????? ???????????????????? ???????????????? ?????????????????? ???????? ???? ????????????????-?????????????? ?????????????????????????? ?????????????? ?? ?????? ???????????????????? ?????????? 5G.', 'Xiaomi_Redmi_Note_10_Pro.jpg', 322.00, 2, 3, 4, 3, '2022-10-16 12:38:18');

create table ram
(
    RAM_id   int auto_increment
        primary key,
    RAM_name varchar(10) not null
);
INSERT INTO app.ram (RAM_id, RAM_name) VALUES (1, '3 Gb');
INSERT INTO app.ram (RAM_id, RAM_name) VALUES (2, '4 Gb');
INSERT INTO app.ram (RAM_id, RAM_name) VALUES (3, '8 Gb');
INSERT INTO app.ram (RAM_id, RAM_name) VALUES (4, '16 Gb');
