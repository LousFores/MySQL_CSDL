create database mydb;
use mydb;
create table Categories (
   CateID int primary key auto_increment,
   CateName varchar(40),
   Descriptions varchar(100)
);
create table Products (
   ProID int primary key auto_increment,
   ProName varchar(40),
   CateID int,
   Detail varchar(40),
   Quantity smallint,
   Price float,
   foreign key (CateID) references Categories (CateID) 
);

insert into Categories (CateName, Descriptions) values 
   ('Laptop', 'Máy tính xách tay'),
   ('Desktop', 'Máy tính để bàn'),
   ('CPU', 'Bộ vi xử lí'),
   ('Monitor', 'Màn hình');
   
insert into Products (ProName, CateID, Detail, Quantity, Price ) values
   ('HP compaqnx 9040', 1, 'Máy tính xách tay HP compaq nx 9040', 10, 1500),
   ('HP compaq NC 4540', 1, 'Máy tính xách tay HP compaq NC 4540', 15, 1800),
   ('Intel Pentium 4',3,'Bộ vi xử lý Intel Pentium 4',30,120),
   ('LG LCD 17', 4, 'Màn hình LG – LCD 17 inch', 10, 140);
   
--    4.2 Sử dụng lệnh Select với các hàm Aggregate: sum(), count(), min(), max(), avg()
select max(Quantity) as Max
from Products;

-- “Hôm nay là: 29/03/2010”
-- “Hôm nay là: Monday, March  29th, 2010”
-- “Bây giờ là: 18:30:45”

SELECT CONCAT('Hôm nay là: ', DATE_FORMAT(NOW(), '%d/%m/%Y'));

select concat('Hôm nay là ngày: ', DATE_FORMAT(now(), '%D/%M/%Y'));
select concat('Bay gio la: ',  date_format(now(), '%W,%M,%D,%Y'));
select concat('Thoi gian: ', time_format(now(), '%h/%i/%s'));

select concat ('Thoigian: ', time_format(now(), '%H/%i/%s'));
select concat ('Ngay hom nay la: ', date_format(now(), '%w/%d/%m/%Y'));