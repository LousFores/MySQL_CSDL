create database QUANLIHANGHOA;
use QUANLIHANGHOA;
create table MATHANG (
   MAHANG varchar(10) primary key,
   TENHANG varchar(50),
   DONGIA float
);

create table KHACHHANG (
    MAKH varchar(10) primary key,
    TENKH varchar(50),
    GIOITINH varchar(10),
    QUEQUAN varchar(50)
);

create table HOADON (
     SOPHIEU varchar(10) primary key,
     NGAYLAP date,
     MAKH varchar(10),
     foreign key (MAKH) references KHACHHANG(MAKH)
);

create table CTHOADON (
     SOPHIEU varchar (10),
     MAHANG varchar(10),
     SOLUONG int, 
     primary key (SOPHIEU, MAHANG),
     foreign key (SOPHIEU) references HOADON(SOPHIEU),
     foreign key (MAHANG) references MATHANG(MAHANG)
);

insert into MATHANG values 
   ('M1', 'Dưỡng môi Ohui', 200000),
   ('M2', 'Tinh chất Ohui', 1000000),
   ('M3', 'Kem dưỡng Ohui', 550000);
   
insert into KHACHHANG values 
    ('K1', 'Trần Triệu Vy', 'Nữ', 'Hà Nội'),
    ('K2', 'Trần Đình Trọng', 'Nam', 'Thái Nguyên'),
    ('K3', 'Minh Hà', 'Nữ', 'Sài Gòn');
    
insert into HOADON values 
    ('P1', '2019-03-3', 'K1'),
    ('P2', '2019-3-8', 'K1'),
    ('P3', '2019-4-8', 'K3');
    
insert into CTHOADON values 
     ('P1', 'M1', 2),
     ('P1', 'M2', 3),
     ('P2', 'M2', 1);
     
-- Câu 2: Đưa ra thông tin: Makh, Tenkh, Gioitinh của những khách hàng có Họ Nguyễn và Quequan là ‘Hà Nội’. 
select MAKH, TENKH, QUEQUAN
from KHACHHANG
where TENKH like '%Nguyễn%' and QUEQUAN = 'Hà Nội';
-- Câu 3: Đưa ra thông tin danh sách các khách hàng (Makh, Tenkh, tổng tiền) 
-- có tổng thành tiền của các hóa đơn từ 1.000.000 trở lên. 
-- Trong đó tổng tiền=số lượng*Đơn giá 
select KH.MAKH, TENKH, SOLUONG * DONGIA AS TONGTIEN
from KHACHHANG KH
join HOADON HD on HD.MAKH = KH.MAKH
join CTHOADON CT on CT.SOPHIEU = HD.SOPHIEU
join MATHANG MH on MH.MAHANG = CT.MAHANG
where SOLUONG * DONGIA >= 1000000;
 
-- Câu 4: Cho biết thông tin khách hàng chưa đặt đơn hàng nào. Thông tin gồm: Makh, Tenkh 
SELECT MAKH, TENKH
FROM KHACHHANG
WHERE MAKH NOT IN (SELECT MAKH FROM HOADON);
-- Câu 5: Liệt kê thông tin: Makh, Tenkh, Mahang, Tenhang, Dongia, Soluong 
-- của khách hàng có tên khách hàng là Trần Triệu Vy .
SELECT KH.MAKH, TENKH, MH.MAHANG, TENHANG, DONGIA, SOLUONG
FROM KHACHHANG KH
JOIN HOADON HD ON HD.MAKH = KH.MAKH
JOIN CTHOADON CT ON CT.SOPHIEU = HD.SOPHIEU
JOIN MATHANG MH ON MH.MAHANG = CT.MAHANG
WHERE TENKH = 'Trần Triệu Vy';
-- Câu 6: Thêm một bản ghi mới vào chitiethoadon,dữ liệu phù hợp( không được nhập giá trị null). 
INSERT INTO CTHOADON VALUES ('P3', 'M3',6);
-- Câu 7: Thay đổi quê quán của khách hàng Minh Hà thành ‘Miền Tây’ 
UPDATE KHACHHANG
SET QUEQUAN = 'Miền Tây'
WHERE TENKH = 'Minh Hà';
-- Câu 8: Xóa mặt hàng có tên hàng ‘Kem dưỡng Ohui’ 
DELETE FROM CTHOADON 
WHERE MAHANG = (SELECT MAHANG FROM MATHANG 
				WHERE TENHANG = 'Kem dưỡng Ohui'); 
DELETE FROM MATHANG
WHERE TENHANG = 'Kem dương Ohui';