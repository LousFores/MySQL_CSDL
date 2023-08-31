create database QuanLiDonHang;
use QuanLiDonHang;
create table KhachHang (
   MaKH varchar(6) primary key,
   HoTenKH varchar(50),
   NgaySinh int, 
   QueQuan varchar(50),
   GioiTinh varchar(10)
);

insert into KhachHang values 
   ('KH1001', 'Nguyen Van A', 2006,'Thanh Hoa', 'Nam'),
   ('KH1002', 'Tran Thi B', 2005, 'Ninh Binh', 'Nu'),
   ('KH1003', 'Hoang Van C', 2004, 'Quang Ninh', 'Nam'),
   ('KH1004', 'Chu Van D', 1990, 'Quang Ninh', 'Nam'),
   ('KH1005', 'Nguyen Thi E', 2000, 'Hung Yen', 'Nu'),
   ('KH1006', 'Dao Nguyen H', 2000, 'Ha Noi', 'Nam'),
   ('KH1007', 'Phan Ngoc G', 2001, 'Ha Noi', 'Nu');
   
create table NhanVien(
   MaNV varchar(6) primary key,
   HotenNV varchar(50),
   NamLamViec int,
   Luong double
);

insert into NhanVien values 

   ('NV1001', 'Le Hoai Anh', 2012, 500000),
   ('NV1002', 'Phan Huy An', 2010, 670000),
   ('NV1003', 'Tran Bich Ngoc', 2020, 300000),
   ('NV1004', 'Tran Van D', 2023, 700000),
   ('NV1005', 'Nguyen Van An', 2018,450000),
   ('NV1006', 'Tran Van A', 2022, 670000),
   ('NV1007', 'Ly Hoang A', 2023, 800000);
   
create table DonDatHang (
   SoHD varchar(6) primary key,
   MaKH varchar(6),
   MaNV varchar(6),
   TenSP varchar(50),
   SoLuong int,
   foreign key (MaKH) references KhachHang(MaKH),
   foreign key (MaNV) references NhanVien(MaNV) 
);

insert into DonDatHang values 
   ('HD1001', 'KH1001', 'NV1001', 'My pham', 210000),
   ('HD1002', 'KH1002', 'NV1003', 'Luong thuc', 103000),
   ('HD1003', 'KH1005', 'NV1004', 'Thuoc men', 50550),
   ('HD1004', 'KH1005', 'NV1002', 'Do gia dung', 130400),
   ('HD1005', 'KH1003', 'NV1003', 'Do dien tu', 16500),
   ('HD1006', 'KH1004', 'NV1002', 'Trai cay', 200000);
-- 1.5
select * from KhachHang;
select * from NhanVien;
select * from DonDatHang;
-- 1.6 
select MaKH, HoTenKH, year(now()) - NgaySinh as Tuoi
from KhachHang
where year(now()) - NgaySinh > 18 and QueQuan = 'Ha Noi'; 

-- 1.7
select MaNV, HotenNV, Luong 
from NhanVien
where NamLamViec > 2020 and HotenNV like '%An';

-- 1.8
select KH.MaKH, HoTenKH, GioiTinh
from KhachHang KH
join DonDatHang DDH on KH.MaKH = DDH.MaKH
where TenSP = 'My pham';

-- 1.9
select NV.MaNV, HotenNV, SoLuong
from NhanVien NV
join DonDatHang DDH on DDH.MaNV = NV.MaNV
where SoLuong = (select max(SoLuong) from DonDatHang);

-- 1.10
update NhanVien
set NamLamViec = 2021
where HoTenNV = 'Phan Huy An';

-- 1.11
delete from NhanVien
where MaNV not in (select MaNV from DonDatHang);

-- 1.12
delimiter $$
drop procedure if exists ShowDonHang $$
create procedure ShowDonHang() 
begin
  select * from DonDatHang
  where SoLuong > 100000;
end; $$
delimiter ; 

call ShowDonHang();

-- 1.13
delimiter $$
drop procedure if exists ShowKhachHang $$
create procedure ShowKhachHang(in q_quequan varchar(50)) 
begin
  select KH.MaKH, HoTenKH, year(now()) - NgaySinh as Tuoi, TenSP
  from KhachHang KH 
  join DonDatHang DDH on KH.MaKH = DDH.MaKH
  where QueQuan = q_quequan;
end; $$
delimiter ; 

call ShowKhachHang('Thanh Hoa');
