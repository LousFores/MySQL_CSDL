create database quanlydiem;
use quanlydiem;
create table LOP(
malop varchar(10) primary key,
tenlop varchar(100)
);

insert into LOP values('PT13301','Ứng dụng phần mềm 1'),
('PT13302','Ứng dụng phần mềm 2'),
('PT13303','Ứng dụng phần mềm 3'),
('PT13304','Ứng dụng phần mềm 4'),
('PT13305','Ứng dụng phần mềm 5'),
('PT13306','Ứng dụng phần mềm 6'),
('PT13307','Ứng dụng phần mềm 6'),
('PT13308','Ứng dụng phần mềm 7'),
('PT13309','Ứng dụng phần mềm 9');
create table MONHOC(
mamh varchar(10) primary key,
tenmh nvarchar(100),
sotiet int
);

insert into MONHOC values('mob1013','lập trình java1',36);
insert into MONHOC values('mob1022','lập trình java2',36);
insert into MONHOC values('sof203','lập trình java3',36);
insert into MONHOC values('com2012','Cơ sở dữ liệu',36);
insert into MONHOC values('com2032','Hệ quản trị CSDL',30);
create table SINHVIEN
(
masv varchar(10) primary key,
hoten nvarchar(100),
ngaysinh date,
quequan nvarchar(100),
Gioitinh varchar(5),
malop varchar(10),
foreign key(malop) references LOP(malop)
);
Insert into SINHVIEN values('ph06230','Trần Lê Huy','2000-06-07','Hà Nội','Nam','PT13302');
Insert into SINHVIEN values('ph06231','Nguyễn Thị Mỹ Duyên','2001-07-07','Hà Nội','Nữ','PT13302');
Insert into SINHVIEN values('ph06232','Võ Tá Nhật Anh','2003-09-07','Hà Tĩnh','Nam','PT13302');
Insert into SINHVIEN values('ph06233','Trần Thị Thùy Trang','2000-06-03','Hải Phòng','Nữ','PT13302');
Insert into SINHVIEN values('ph06234','Nguyễn Thị Mừng','2000-06-02','Hà Nội','Nữ','PT13305');
Insert into SINHVIEN values('ph06235','Nguyễn Xuân Trường','2000-06-06','Hà Nội','Nam','PT13305');
Insert into SINHVIEN values('ph06236','Nguyễn Lê Huy','2005-06-07','Hà Nội','Nam','PT13306');
Insert into SINHVIEN values('ph06237','Nguyễn An','2003-06-07','Hà Nội','Nam','PT13306');
Insert into SINHVIEN values('ph06238','Nguyễn An','2003-06-07','Hà Nội','Nam','PT13301');
create table KETQUA(
masv varchar(10) ,
mamh varchar(10) ,
lanthi int ,
diemthi double,
primary key(masv,mamh,lanthi),
foreign key(masv) references SINHVIEN(masv),
foreign key(mamh) references MONHOC(mamh)
);
insert into KETQUA values('ph06230','sof203',1,3);
insert into KETQUA values('ph06230','sof203',2,6);
insert into KETQUA values('ph06230','com2012',1,8);
insert into KETQUA values('ph06233','sof203',1,7);
insert into KETQUA values('ph06234','sof203',1,9);
select * from lop

-- drop table ketqua,sinhvien,lop,monhoc


-- c1: sử dụng bí danh cho bảng
select masv,hoten,tenlop
from sinhvien s,lop l
where s.malop=l.malop and quequan=N'Hà Nội'
-- c2:sử dụng join
select masv,hoten,tenlop
from sinhvien inner join lop on sinhvien.malop=lop.malop
where quequan=N'Hà Nội'
-- c2:sử dụng join : bí danh bảng
select masv,hoten,tenlop
from sinhvien s inner join lop l on s.malop=l.malop
where quequan=N'Hà Nội'


-- 1.đưa ra thông tin sinh viên
select * from sinhvien
-- 2.đưa ra thong tin bảng môn hoc
select * from monhoc
-- 3.đưa ra thông tin sinh viên: Masv,hoten
select masv,hoten
from sinhvien
-- 4đưa ra thông tin sinh viên: Masv,hoten của sv có quê la ha noi
select masv,hoten
from sinhvien
where quequan='Hà Nội'
-- dk:quequan: hanoi, gioitinh:Nam 
select masv,hoten
from sinhvien
where quequan='Hà Nội' and gioitinh='Nam'

-- 5dua ra thong tin 2 sv dau tien: masv, Hoten,gt cua sv co que ha noi va gioitinh nam
select  masv,hoten
from sinhvien
where quequan='Hà Nội' and gioitinh='Nam'
limit 2
-- 6.dua ra thong tin 2 sv dau tien: masv, Hoten,gt cua sv co que ha noi va gioitinh nam sắp xêp tăng dân theo hoten
 

-- 7.dưa ra thông tin sinh viên có họ nguyễn
select * from sinhvien
where hoten like 'Nguyễn%'

-- 8.đưa ra thông tin sv có ho dem la van
select * from sinhvien
where hoten like '%Văn%'
-- 9.đưa ra thông tin sv có tên la Duyên
select * from sinhvien
where hoten like '%Duyên'

-- 9a hiển thị thông tin: masv,hoten,tuoi của những sinh viên có tuổi >20 và họ nguyễn
select masv,hoten, year(now()) -year(ngaysinh)
from sinhvien
where year(now()) -year(ngaysinh)>20 and hoten like 'Nguyễn%'

-- 9b. hiển thị thông tin sinh viên ph06230,ph06231,ph06235
select * from sinhvien
where masv='ph06230' or masv='ph06231' 
      or masv='ph06232'
-- cách 2
select * from sinhvien
where masv in('ph06230','ph06231','ph06232')
-- 9c. hiển thị kết quả của sinh viên có điểm từ 7 đến 10
select * from ketqua
where diemthi between 7 and 10
-- 9d.Hiển thị ra những lớp không có sinhvien
select * from lop
where malop not in (
					select malop
                    from sinhvien
                    )
-- đưa ra tt sv của nhưng sv hà noi, gt: nam,sắp xếp giảm dần theo hoten
select * from sinhvien
where quequan='Hà Nội' and gioitinh='Nam'
order by hoten desc

-- 10.thống kê sô lương sv của từng lớp
select malop,count(masv) as soluong
from sinhvien
group by malop




-- 1.đưa ra thông tin sinh viên
select * from sinhvien
-- 2.đưa ra thong tin bảng môn hoc
select * from monhoc
-- 3.đưa ra thông tin sinh viên: Masv,hoten
select masv,hoten
from sinhvien

-- Hiển thị thông tin kết quả điểm của sv trong khoang tu 7 đến 10
select * from ketqua
where diemthi between 7 and 10
-- 4đưa ra thông tin 2 sinh viên đầu tiên: Masv,hoten của sv có quê la ha noi
select masv,hoten
from sinhvien
where quequan='Hà Nội'
limit 2
-- 5dua ra thong tin 2 sv dau tien: masv, Hoten,gt cua sv co 
-- que ha noi va gioitinh nam
select masv,hoten,gioitinh
from sinhvien
where quequan like '%Hà Nội' and gioitinh='Nam'
limit 2
-- 6.dua ra thong tin 2 sv dau tien: masv, Hoten,gt cua sv 
-- co que ha noi va gioitinh nam sắp xêp tăng dân theo hoten
select masv,hoten,gioitinh
from sinhvien
where quequan like '%Hà Nội' and gioitinh='Nam'
order by hoten ASC
limit 2

-- 7.dưa ra thông tin sinh viên có họ nguyễn
select * from sinhvien
where hoten like 'Nguyễn%'

-- 8.đưa ra thông tin sv có ho dem la van
select * from sinhvien
where hoten like '%Văn%'
-- 9.đưa ra thông tin sv có tên la Duyên
select * from sinhvien
where hoten like '%Duyên'
-- 9a hiển thị thông tin: masv,hoten,tuoi của những sinh viên 
-- có tuổi >20 và họ nguyễn
select masv,hoten,year(now())-year(ngaysinh) as tuoi
from sinhvien
where year(now())-year(ngaysinh)>20 and hoten like 'Nguyễn%'

-- 9b. hiển thị thông tin sinh viên ph06230,ph06231,ph06235
--  cách 1
select * from sinhvien
where masv='ph06230' or masv='ph06231' or masv='ph06232'
-- cách 2:
select * from sinhvien
where masv in ('ph06230','ph06231','ph06232')
-- 9c. hiển thị kết quả của sinh viên có điểm từ 7 đến 10
select * from ketqua
where diemthi between 7 and 10
-- 9d.Hiển thị ra những lớp không có sinhvien
where malop not in
                  (select malop 
                  from sinhvien)
-- 10.thống kê sô lương sv của từng lớp
select malop, count(masv) as soluong
from sinhvien
group by malop
-- 10.ĐƯa ra thông tin số lượng sv của từng lớp 
-- có số lượng >2
select malop, count(masv) as soluong
from sinhvien
group by malop
having count(masv)>2
-- 11. Đưa ra những môn học có số tiết>30 
select * from monhoc
where sotiet>30
-- 12.Đưa ra thông tin : masv,hoten,quequan của sv 
-- có giới tính là nam, tuổi>18 và tuổi <65
select masv,hoten,quequan
from sinhvien
where gioitinh='Nam' and year(now())-year(ngaysinh) between 18 and 65
-- hiển thị thông tin những môn học Lập trình ,có số tiết >40
select * from monhoc
where tenmh like 'Lập trình%' and sotiet>40

-- quanlydiem
-- lop(malop,tenlop)
-- monhoc(mamh,tenmh,sotiet)
-- sinhvien(masv,hoten,ngaysinh,quequan,gioitinh,malop)
-- ketqua(masv,mamh,lanthi,diemthi)

-- 1a.ĐƯA RA THÔNG TIN: MASV, HOTEN, TENLOP CỦA SV CÓ QUÊ HANOI
select masv,hoten,tenlop
from sinhvien inner join lop on sinhvien.malop=lop.malop
where quequan like '%Hà Nội'
-- sử dụng bí danh cho bảng
select masv,hoten,tenlop
from sinhvien s inner join lop l on s.malop=l.malop
where quequan like '%Hà Nội'
-- cách 2
select masv,hoten,tenlop
from sinhvien,lop
where sinhvien.malop=lop.malop and lop.malop=sinhvien.malop
-- 1đưa ra thông tin masv, hoten, quequan
-- cua sv thuoc lop Ứng dụng phần mềm 1
select masv,hoten, quequan
from sinhvien s inner join lop l on s.malop=l.malop
where tenlop ='Ứng dụng phần mềm 1'
-- cau2: dua ra thông tin:masv,hoten,tenmh,diemthi,lanthi
-- cua những sv có quê quan hà nôi
select s.masv,hoten,tenmh,diemthi,lanthi
from sinhvien s inner join ketqua k on s.masv=k.masv
     inner join monhoc m on k.mamh=m.mamh
where quequan like 'Hà Nội%'
-- câu 3: đưa ra thông tin masv, hoten học môn lt java3
select s.masv,hoten
from sinhvien s inner join ketqua k on s.masv=k.masv
     inner join monhoc m on m.mamh=k.mamh
where tenmh='Lập trình java3'
-- câu 4a:thống kê số lượng sv của mỗi lớp:malop,tenlop,soluong
select l.malop,tenlop, count(masv) as soluong
from lop l left join sinhvien s on s.malop=l.malop
group by l.malop,tenlop
-- câu 4b:thống kê số lượng sv của mỗi lớp:malop,tenlop,soluong
-- co so luong >3
select l.malop,tenlop, count(masv) as soluong
from lop l left join sinhvien s on s.malop=l.malop
group by l.malop,tenlop
having count(masv) >3
-- câu 5:thống kê số lượng sv của mỗi lớp:malop,tenlop,soluong
-- có sô lượng lớn nhất
select l.malop,tenlop, count(masv) as soluong
from lop l inner join sinhvien s on s.malop=l.malop
group by l.malop,tenlop
having count(masv) >=all(select count(masv)
                     from sinhvien
                     group by malop)
-- c6 đưa ra thông tin những sinh viên có cùng ngay sinh
select a.masv,a.hoten
from sinhvien a,sinhvien b
where a.masv<>b.masv and a.ngaysinh=b.ngaysinh
-- câu 7: Đưa ra thông tin: masv, hoten, tuổi,tênmon,
-- điemthi của những sinh viên có Họ nguyễn và tuổi >20
select s.masv,hoten, year(now())-year(ngaysinh) as tuổi,tenmh,diemthi
from sinhvien s inner join ketqua k on s.masv=k.masv
     inner join monhoc m on m.mamh=k.mamh
where hoten like 'Nguyễn%' and year(now())-year(ngaysinh)>20
-- câu 8. Đưa ra thông tin: masv, hoten, điểm thi của những sinh viên 
-- có điểm thi trong khoảng 7 đến 10 sắp xếp giảm dần theo điểm thi
select s.masv,hoten,diemthi
from sinhvien s inner join ketqua k on s.masv=k.masv
where diemthi between 7 and 10
order by diemthi desc
-- câu 9: đưa ra thông tin: masv, hoten, tuổi của sinh viên 
-- học môn com108, com107,com2012
select s.masv,hoten, year(now())-year(ngaysinh) as tuoi
from sinhvien s inner join ketqua k on s.masv=k.masv
where mamh in ('com108','com107','com2012')
-- cách 2
select s.masv,hoten, year(now())-year(ngaysinh) as tuoi
from sinhvien s inner join ketqua k on s.masv=k.masv
where mamh ='com108' or mamh='com107'or mamh='com2012'
-- cau 10: dưa ra thông tin những lớp không có sinh viên
select * from lop
where malop not in (select malop from sinhvien)
-- cau 11: đưa ra thông tin masv, hoten có tenlop:ung dung 1
select masv,hoten
from sinhvien s inner join lop l on s.malop=l.malop
where tenlop like 'Ứng dụng 1'
-- câu 12: đưa ra thông tin: masv, hoten, tuổi của sinhvien 
-- có điểm thi <8 ,tên môn cơ sở dữ liệu
select s.masv,hoten, year(now())-year(ngaysinh) as tuổi
from sinhvien s inner join ketqua k on s.masv=k.masv
     inner join monhoc m on m.mamh=k.mamh
where diemthi<8 and tenmh like 'Cơ sở dữ liệu'

-- 
SELECT côt 1, cột 2…
INTO bảng_mới
FROM bảng_nguồn [WHERE <điều
kiện> ]
[GROUP BY group_list]
[HAVING <điều kiện>]
[ORDER BY order_by_list ASC|DESC]

-- cập nhật dữ liệu
UPDATE tên_bảng
SET cột1= ‘biểu thức 1’ [, cột2= ‘biểu thức 2’] . . .
[WHERE <điều kiện>]
-- xóa
DELETE FROM tên_bảng
[WHERE <điều kiện>]
select * from sinhvien
-- update
-- 1: sửa đổi quequan của masv ph06230 thành Huế
update sinhvien
set quequan='Huế'
where masv='ph06230'
-- 2: sửa đổi quequan của masv ph06230 thành Huế
-- gioitinh thành nam
update sinhvien
set quequan='Huế',gioitinh='Nam'
where masv='ph06230'
-- 3sưả số tiết môn cơ sở dữ liệu thành 60
update monhoc
set sotiet=60
where tenmh='lập trình java1'

select * from monhoc
-- 4.thay đổi malop của Nguyen Huy thành It18301
-- 5.	Cập nhật thông tin của sv có mã ph06238: 
-- quê quán thành Hà Tĩnh, giới tình:nữ
-- 6.	Cập nhật lại môn học Tin Văn Phòng 
-- thành Cơ sở dữ liệu
-- 7.cập nhật sotiet cua của môn học có tên
-- "Tri Tue Nhan Tao" lai 30 tiet
-- 8.cập nhật sinhvien có tên 'Nguyễn Thị Lam' 
-- thành 'Nguyen Thanh Son' và giới tính thành 'Nam'
-- 9.Chuyen sinh vien 'Lê Thị Lan Anh' sang lớp It18302

-- delete from : xóa dữ liệu trong bảng
-- 1.Xóa thông tin kết quả học tập của sv có mã ph1234
-- 2. Xóa những lớp không có sinhvien

-- 3.xóa môn học không có sinhvien hoc

-- 4.xóa kết quả của sinhvien có hoten là Nguyễn Văn Huy

-- 5.xóa sinhvien học môn có tên monhoc là Cơ sỡ dữ liệu

-- tang 10% số tiết của các môn học

-- tăng 15% số tiết của môn cơ sở dữ liệu

