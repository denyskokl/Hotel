use hotel;

INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (1,'Пакет платных TV каналов',50,'шт');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (2,'Безпроводной доступ до интернета (Wi-Fi)',25,'доба');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (3,'Завтрак',0,'На час проживання');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (4,'Сейф',0,'На час проживання');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (5,'Телефон',1,'хв');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (6,'Холодильник',0,'На час проживання');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (7,'Мини-холодильник',25,'доба');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (8,'Оборудования для инвалидов',0,'На час проживання');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (9,'Химчистка',25,'шт');
INSERT INTO `service_type` (`id`,`name`,`price`,`type_count`) VALUES (10,'Няня\\Услуги по уходу за детьми',100,'година');

INSERT INTO `customers` (`id`,`name`,`surname`,`middlename`,`number_card`,`type_card`,`bonus_card`) VALUES (1,'Ключ','Денис','Віталійович','1111','золото',5);
INSERT INTO `customers` (`id`,`name`,`surname`,`middlename`,`number_card`,`type_card`,`bonus_card`) VALUES (3,'Прудиус','Владислав','Михайлович','2222','бронза',10);
INSERT INTO `customers` (`id`,`name`,`surname`,`middlename`,`number_card`,`type_card`,`bonus_card`) VALUES (4,'Пістряк','Руслан','Юрійович','3333','золото',5);
INSERT INTO `customers` (`id`,`name`,`surname`,`middlename`,`number_card`,`type_card`,`bonus_card`) VALUES (5,'Любчик','Михайло','Сергійович','4444','срібло',2);
INSERT INTO `customers` (`id`,`name`,`surname`,`middlename`,`number_card`,`type_card`,`bonus_card`) VALUES (6,'Бойко','Сергій','Володимировчи','5555','бронза',10);

INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (1,'Одномісний',100.00);
INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (2,'Двомісний',110.00);
INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (3,'Одномісний люкс',111.00);
INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (4,'Двомісний люкс',123.00);
INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (5,'Одномісний (великий)',423.00);
INSERT INTO `type_room` (`id`,`name`,`price`) VALUES (6,'Двомісний(два ліжка)',545.00);

INSERT INTO `rooms` (`id`,`number`,`type_room_id`,`price`) VALUES (1,'1',1,100.00);
INSERT INTO `rooms` (`id`,`number`,`type_room_id`,`price`) VALUES (2,'2',2,200.00);
INSERT INTO `rooms` (`id`,`number`,`type_room_id`,`price`) VALUES (3,'3',3,1000.00);

INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (5,'Ключ','Денис','Віталійович','2014-01-21','2014-01-21','2014-01-21',1,1);
INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (6,'Прудиус','Владислав','Михайлович','2014-01-22','2014-01-22','2014-01-11',3,3);
INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (7,'Бойко','Сергій','Володимировчи','2014-01-27','2014-01-26','2014-01-21',6,2);
INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (8,'Пістряк','Руслан','Юрієвич','2014-01-24','2014-01-26','2014-01-20',4,2);
INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (9,'Любчик','Михайло','Сергійович','2014-02-05','2014-02-03','2013-12-28',5,3);
INSERT INTO `orders` (`id`,`surname`,`name`,`middlename`,`date_arrival`,`date_departure`,`date_order`,`customer_id`,`id_room`) VALUES (10,'sdfdsf','sadfsf','sdd','2013-10-10','2013-10-10','2013-10-10',1,1);

INSERT INTO `orders_service` (`id`,`id_orders`,`id_service`,`price_service`,`count`) VALUES (2,5,10,50.00,3);
INSERT INTO `orders_service` (`id`,`id_orders`,`id_service`,`price_service`,`count`) VALUES (3,7,7,0.00,1);
INSERT INTO `orders_service` (`id`,`id_orders`,`id_service`,`price_service`,`count`) VALUES (4,8,7,50.00,2);