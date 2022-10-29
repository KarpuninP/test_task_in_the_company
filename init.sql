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
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (3, 'Apple iPhone 6s', 'iPhone 6 стал не просто больше, но и лучше во всех отношениях. Больше, но при этом тоньше. Более мощный, но удивительно энергоэффективный. С гладкой металлической поверхностью, плавно переходящей в новый дисплей Retina HD. Это одна непрерывная форма, где аппаратная платформа и программное обеспечение работают в унисон, создавая новое поколение iPhone, лучшее, чем когда-либо.', 'Apple_iPhone_6s.jpg', 660.00, 2, 2, 1, 3, '2022-10-01 11:58:59');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (4, 'Apple iPhone 8 Plus', 'Прогресс не стоит на месте и то, что несколько лет назад казалось невозможным, сегодня поместилось в небольшой телефон. Компания Apple радует своих потребителей высококачественной продукцией, которая полностью соответствует всем современным требованиям, касающимся смартфонов. В этом году мир увидел новый Apple iPhone 8 Plus Space Gray, задняя и передняя панель которого выполнена из особого стекла, прочностью на 50% выше. Аппарат открывает перед своими владельцами новые возможности, о которых раньше никто и не подозревал.', 'Apple_iPhone_8_Plus.jpg', 1152.60, 2, 1, 1, 2, '2022-10-02 12:08:00');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (5, 'Apple iPhone 11', 'Не дивлячись на цифру 11 в назві, дана модель, по суті, є прямим наступником iPhone XR. Основні відмінності криються в камерах, тепер вони здвоєні (основна і фронтальна); в процесорі, який, судячи з результатів тестів, став мінімум на 50% потужнішим; а також в акумуляторі більшої ємності. Що стосується функціоналу, то, хоча головний акцент на фото- і відеозйомку був зроблений в моделях 11 Pro і 11 Pro Max, базовий iPhone 11 також отримав безліч поліпшень, які стосуються фото і відео.', 'Apple_iPhone_11.jpg', 489.00, 3, 4, 1, 3, '2022-10-03 12:08:05');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (6, 'Apple iPhone 13', 'Довгоочікуваний екран підвищеної «герцовки» дебютував на борту 13-го iPhone у версії Pro. Однак модель примітна не тільки «швидким» дисплеєм. Чим вона ще викликає пильний інтерес? Давайте розбиратися.

', 'Apple_iPhone_13.jpg', 999.99, 3, 4, 1, 2, '2022-09-28 12:08:08');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (7, 'Apple iPhone 14 Pro', 'За останні роки дизайн лицьової панелі у «Айфонів» практично не змінювався. Однак еволюція бере своє і у версії 14 Pro замість «чубчика», що приївся, зовсім іншим чином обіграли дизайн вирізу під фронтальну камеру і службові сенсори.', 'Apple_iPhone_14.jpg', 2050.00, 4, 4, 1, 2, '2022-10-06 12:08:14');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (8, 'Apple iPhone Xs', 'Базова модель у новому поколінні iPhone прийшла на зміну оригінальній «десятці», наробила чимало галасу навколо власної персони за рахунок неординарної зовнішності з характерною «чубчиком» на лицьовій панелі. Тим не менш, Apple iPhone X S — аж ніяк не революційне, а еволюційне продовження «яблучної» серії.', 'Apple_iPhone_Xs .jpg', 565.00, 2, 3, 1, 4, '2022-10-02 12:08:16');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (9, 'Samsung Galaxy A53', 'Швидкість. На шляху до інновацій Станьте частиною Galaxy разом з 5G. Надшвидке з''єднання забезпечує безперебійну потокову...', 'Samsung _Galaxy_A53.jpg', 423.00, 2, 2, 3, 2, '2022-10-02 12:23:52');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (10, 'Samsung Galaxy S21', 'Samsung Galaxy S21 Fan Edition — потенційний хіт продажів серед полегшених версій флагманських смартфонів. На борту моделі встановлено топове «залізо» і просунуті камери, а спрощення зводяться по більшій мірі до пластикових матеріалів «спинки».', 'Samsung_Galaxy_S21.jpg', 523.00, 2, 3, 3, 3, '2022-10-03 12:23:56');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (11, 'Samsung Galaxy S22 ', 'Флагман Samsung Galaxy S22 Ultra разюче відрізняється від колег з продуктової лінійки кращих творінь південнокорейського вендора електроніки станом на початок 2022 року. Він ближчий по духу відійшовшій у минуле серії смартфонів Galaxy Note.', 'Samsung_Galaxy_S22.jpg', 989.99, 3, 4, 3, 2, '2022-10-03 12:23:59');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (12, 'Samsung Galaxy M52', 'Витриманий смартфон медіум-Ланки з гідним апаратним оснащенням і підтримкою роботи в високошвидкісних мобільних мережах 5G. пристрій володіє екраном великого калібру з розмірами по діагоналі 6.7 дюймів. В основі дисплея лежить швидка і соковита матриця типу Super AMOLED Plus з адаптивною частотою оновлення до 120 Гц. По центру "лобової" частки екрану Samsung Galaxy M52 5g 128GB / 6gb розташований круглий отвір під об''єктив 32 МП Селфі-камери.', 'Samsung_Galaxy_M52.jpg', 260.00, 1, 1, 3, 2, '2022-10-02 12:24:03');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (13, 'Samsung Galaxy A52', 'Samsung Galaxy A52 – линейка смартфонов компании, которая является разумным балансом между практичной строгостью и передовыми...', 'Samsung_Galaxy_A52.jpg', 355.00, 1, 2, 3, 2, '2022-10-02 12:24:06');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (14, 'Meizu Pro 7 Plus', 'Внедрение новых технологий – основная стратегия развития компании Meizu. Дополнительный цветной сенсорный дисплей Pro 7 является уникальным решением, не имеющим аналогов. Высококачественный AMOLED дисплей в сочетании с продуманным интерфейсом дают пользователям возможность окунуться в мир новых впечатлений.', 'Meizu_Pro_7_Plus.jpg', 365.00, 1, 2, 2, 1, '2022-10-06 12:28:12');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (15, 'Xiaomi Redmi Note 11', 'Черговий бестселер від Xiaomi, що претендує на незаперечне лідерство в нижньому дивізіоні медіум-сегмента мобільних пристроїв. Перша ланка на шляху до успіху моделі — швидкий AMOLED-екран 6.43-дюймової розмірності по діагоналі. Дозвіл відображуваної на ньому картинки відповідає формату Full HD +(2400х1080 пікселів). Частота оновлення у дисплея становить 90 Гц. Апаратно Xiaomi Redmi Note 11 64 GB грунтується на восьмиядерному мобільному процесорі Snapdragon 680, який доповнюється графікою Adreno 610.', 'Xiaomi_Redmi_Note_11.jpg', 425.50, 2, 2, 4, 3, '2022-10-06 12:38:10');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (16, 'Xiaomi Redmi 10', 'Майже повна копія анонсованого роком раніше Xiaomi Redmi 10, в якій чомусь відмовилися від окремого лотка під карту розширення пам''яті і злегка змінили набір підтримуваних діапазонів LTE. В іншому апарат абсолютно нічим не відрізняється від попередника. Його апаратна платформа все так же грунтується на мобільному чіпсеті MediaTek Helio G88 укупі з 4/64 ГБ пам''яті. На передній панелі смартфона розпростерся IPS-екран з розмірами по діагоналі 6.5 дюймів, роздільною здатністю картинки Full HD+ (2400х1080 пікселів), адаптивною частотою оновлення до 90 Гц.', 'Xiaomi_Redmi_10.jpg', 350.00, 2, 1, 4, 4, '2022-10-06 12:38:13');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (17, 'Xiaomi Redmi 9A ', 'Ласа пропозиція в сегменті мобільних гаджетів під егідою доступності від відомої китайської марки Xiaomi. Модель бере своє ігровим чипсетом базової ланки MediaTek Helio G25 в поєднанні з ємною акумуляторною батареєю на 5000 мАгод. Енергоефективна платформа укупі з екраном традиційного формату HD+ виступають гарантами двох повноцінних днів автономної роботи Xiaomi Redmi 9A в режимі помірно-середніх навантажень.', 'Xiaomi_Redmi_9A .jpg', 152.99, 1, 1, 4, 2, '2022-10-12 12:38:14');
INSERT INTO app.products (Product_id, ProductName, Description, Picture, Price, RAM_id, Display_id, Manufacturer_id, Color_id, Date) VALUES (18, 'Xiaomi Redmi Note 10 Pro', 'Китайський брат-близнюк популярного смартфона Poco X3 GT, наступаючий на п''яти флагманської кавалерії мобільних пристроїв. За гідну продуктивність апарату відповідає потужна електронна "начинка" у складі восьмиядерного процесора MediaTek Dimensity 1100 і 6/128 ГБ нерозширюваної пам''яті. Чіпсет забезпечує впевнене ворочання ігор на середньо-високих налаштуваннях графіки і має вбудований модем 5G.', 'Xiaomi_Redmi_Note_10_Pro.jpg', 322.00, 2, 3, 4, 3, '2022-10-16 12:38:18');

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
