create database QLNS;
use QLNS;
create table PhongBan(
   MaPB int auto_increment primary key,
   TenPB varchar(50) not null,
   ChucNang varchar(50)
);

insert into PhongBan (TenPB, ChucNang) values
   ("QL1", "Quan li"),
   ("KK2", "Kiem ke"),
   ("TQ3", "Thu quy"),
   ("TT4", "Tiep thi"),
   ("BH5", "Ban hang");
   
create table NhanVien(
   MaNV varchar(6) primary key,
   HoDem varchar(50) not null,
   Ten varchar(50),
   NgaySinh datetime, 
   DiaChi varchar(50) default 'Ha Noi',
   ChucVu varchar(50),
   NamCongTac tinyint, 
   BacLuong decimal(3,2),
   MaPB int,
   foreign key (MaPB) references PhongBan(MaPB) 
); 
insert into NhanVien values
   ('NV1001', 'Le', 'Thanh', '2000-03-05', 'Ha Noi', 'Nhan vien', 5, 6.88, 3),
   ('NV1002', 'Nguyen', 'Linh', '2000-07-12', 'Nam Dinh', 'Truong ban', 4, 7.97, 1),
   ('NV1003', 'Hoang', 'Vinh', '2001-05-23', 'Bac Ninh', 'Giam sat', 2, 3.34, 2),
   ('NV1004', 'Ly', 'Thai', '1995-07-03', 'Tuyen Quan', 'Nhan vien', 2, 3.96, 5),
   ('NV1005', 'Pham', 'Uyen', '2002-01-25', 'Dien Bien', 'Pho phong', 4, 4.65, 4),
   ('NV1006', 'Le', 'Minh', '2002-04-09', 'Thanh Hoa', 'Giam doc', 6, 5.42,3);

create table Luong (
   MaNV varchar(6) primary key,
   Thang tinyint,
   ThuNhap float,
   foreign key (MaNV) references NhanVien(MaNV)
);

insert into Luong values 
    ('NV1001', 3, 67895),
    ('NV1002', 2, 35453),
    ('NV1003', 2, 23442),
    ('NV1004', 5, 32423),
    ('NV1005', 4, 23424),
    ('NV1006', 6, 74534);


delimiter $$
drop procedure if exists SelectNV $$
create procedure SelectNV()
begin 
  select MaNV, concat(HoDem, ' ', Ten), ChucVu, PB.TenPB, year(now()) - year(NgaySinh) as Tuoi
  from NhanVien NV
  join PhongBan PB on NV.MaPB = PB.MaPB;
end; $$
delimiter ;

call SelectNV();

delimiter $$
drop procedure if exists SelectNV1 $$
create procedure SelectNV1() 
begin
  select MaNV, concat(HoDem,' ', Ten) as HoTen, NamCongTac, BacLuong
  from NhanVien;    
end; $$
delimiter ;

call SelectNV1();

delimiter $$ 
drop procedure if exists SelectNV2 $$
create procedure SelectNV2()
begin
  select NV.MaNV, concat(HoDem,' ', Ten) as HoTen, ChucVu, PB.TenPB, Thang, ThuNhap
  from NhanVien NV
  join PhongBan PB on PB.MaPB = NV.MaPB
  join Luong L on L.MaNV = NV.MaNV;
end; $$
delimiter ;


use QLNS;
delimiter $$
drop procedure if exists UpdateLuong $$ 
create procedure UpdateLuong(
                   in p_manv varchar(6),
                   in P_thang tinyint) 
begin
   Declare BL decimal(3,2) default 0;
   Declare NCT tinyint default 0;
   Declare luong float default 1;
   
   select BacLuong into BL from NhanVien where MaNV = p_manv;
   select NamCongTac into NCT from NhanVien where MaNV = p_manv;
   
   set luong = BL * 830000;
   if (NCT > 5) and (NCT < 10) then set luong = luong + 300000;
   elseif (NCT >= 10) then set luong = luong + 500000;
   end if; 
   
   update Luong
   set ThuNhap = luong, Thang = thang
   where MaNV = p_manv;
end ; $$
delimiter ; 

call UpdateLuong('NV1001', 4)

delimiter $$
drop procedure if exists SelectIPNV $$
create procedure SelectIPNV(in p_manv varchar(6))
begin
   select * from NhanVien
   where MaNV = p_manv;
end; $$
delimiter ;

call SelectIPNV('NV1004');

delimiter $$
drop procedure if exists selectNV_Name $$
create procedure selectNV_Name(in nameNV varchar(50))
begin
   select * from NhanVien
   where Ten = nameNV;
end $$
delimiter ;

call selectNV_Name('Vinh');

delimiter $$
drop procedure if exists selectNV_Thunhap $$
create procedure selectNV_ThuNhap(in t_thunhap float)
begin
  declare p_maNV varchar(6);
  select MaNV into p_maNV
  from Luong 
  where ThuNhap >= t_thunhap
  limit 1;
  select * from NhanVien
  where MaNV = p_manV;
end $$
delimiter ;

call  updateLuong('NV1002',  6);
call  updateLuong('NV1003',  9);
call  updateLuong('NV1004',  7);
call  updateLuong('NV1005',  6);
call  updateLuong('NV1006',  12);

call selectNV_ThuNhap(2000000);