-- SELECT - Truy vấn dữ liệu trong bảng
-- CREATE - Tạo bảng, databasee
-- UPDATE - Cập nhập thuộc tính, giá trị của 1 bảng
-- INSERT - Nhập giá trị mới của 1 hàng vào bảng
-- INNER JOIN - Lấy các giá trị chung của n bảng
-- GROUP BY - Gộp các giá trùng lặp trong bảng
-- WHERE - Xác định điều liện truy vấn 
-- LIKE - Lấy kí tự gần giống với điều kiện
-- ORDER BY - Sắp xếp giá trị tăng dần hoặc giảm dần


-- Tao Database
create database quanlydiem;
use quanlydiem;
-- Tao bang lop
create table LOP(
malop varchar(10) primary key,
tenlop varchar(100)
);

-- Them du lieu vao lop
insert into LOP values('PT13301','Ứng dụng phần mềm 1');
insert into LOP values('PT13302','Ứng dụng phần mềm 2');
insert into LOP values('PT13303','Ứng dụng phần mềm 3');
insert into LOP values('PT13304','Ứng dụng phần mềm 4');
insert into LOP values('PT13305','Ứng dụng phần mềm 5');
insert into LOP values('PT13306','Ứng dụng phần mềm 6');
insert into LOP values('PT13307','Ứng dụng phần mềm 6');
insert into LOP values('PT13308','Ứng dụng phần mềm 7');
insert into LOP values('PT13309','Ứng dụng phần mềm 9');

-- Tao bang mon hoc
create table MONHOC(
mamh varchar(10) primary key,
tenmh nvarchar(100),
sotiet int
);

-- Them du lieu vao bang

insert into MONHOC values('mob1013','lập trình java1',36);
insert into MONHOC values('mob1022','lập trình java2',36);
insert into MONHOC values('sof203','lập trình java3',36);
insert into MONHOC values('com2012','Cơ sở dữ liệu',36);
insert into MONHOC values('com2032','Hệ quản trị CSDL',30);

-- Tao bang sinh vien
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

-- Them du lieu vao bang
Insert into SINHVIEN values('ph06230','Trần Lê Huy','2000-06-07','Hà Nội','Nam','PT13302');
Insert into SINHVIEN values('ph06231','Nguyễn Thị Mỹ Duyên','2001-07-07','Hà Nội','Nữ','PT13302');
Insert into SINHVIEN values('ph06232','Võ Tá Nhật Anh','2003-09-07','Hà Tĩnh','Nam','PT13302');
Insert into SINHVIEN values('ph06233','Trần Thị Thùy Trang','2000-06-03','Hải Phòng','Nữ','PT13302');
Insert into SINHVIEN values('ph06234','Nguyễn Thị Mừng','2000-06-02','Hà Nội','Nữ','PT13305');
Insert into SINHVIEN values('ph06235','Nguyễn Xuân Trường','2000-06-06','Hà Nội','Nam','PT13305');
Insert into SINHVIEN values('ph06236','Nguyễn Lê Huy','2005-06-07','Hà Nội','Nam','PT13306');
Insert into SINHVIEN values('ph06237','Nguyễn An','2003-06-07','Hà Nội','Nam','PT13306');
Insert into SINHVIEN values('ph06238','Nguyễn An','2003-06-07','Hà Nội','Nam','PT13301');

-- Tao bang ketqua

create table KETQUA(
masv varchar(10) ,
mamh varchar(10) ,
lanthi int ,
diemthi double,
primary key(masv,mamh,lanthi),
foreign key(masv) references SINHVIEN(masv),
foreign key(mamh) references MONHOC(mamh)
);

-- Them du lieu vao bang ket qua
insert into KETQUA values('ph06230','sof203',1,3);
insert into KETQUA values('ph06230','sof203',2,6);
insert into KETQUA values('ph06230','com2012',1,8);
insert into KETQUA values('ph06233','sof203',1,7);
insert into KETQUA values('ph06234','sof203',1,9);

-- Câu 1:  
-- Đưa ra toàn bộ thông tin của bảng sinhvien
select * from SINHVIEN;
-- Đưa ra thông tin bảng môn học
select * from MONHOC;
-- Đưa ra mã sinh viên và năm sinh của sinh viên có quê là Hải phòng
select masv, ngaysinh 
from SINHVIEN
where quequan = "Hải Phòng";
-- Đưa ra thông tin sinh viên có giới tính là Nam, sinh năm 2000
select * from SINHVIEN
where Gioitinh = "Nam" and ngaysinh like "2000%";
-- Đưa ra thông tin của 2 sinh viên đầu tiên có giới tính là Nam, sinh năm 2000 
select * from SINHVIEN 
where Gioitinh = "Nam" and ngaysinh like "2000%"
limit 2;
-- Đưa ra thông tin sinh viên có họ Trần
select * from SINHVIEN
where hoten like "Trần%";
-- Đưa ra thông tin sinh viên có tên đệm là Thị
select * from SINHVIEN
where hoten like "%Thị%";
-- Đưa ra thông tin sinh viên có tên là An
select * from SINHVIEN 
where hoten like "%An";
-- Đưa ra thông tin của sinh viên có họ là Nguyễn sắp xếp theo thứ tự giảm dần dựa theo mã sinh viên
select * from SINHVIEN
where hoten like "Nguyễn%" 
order by masv desc;
-- Hiển thị tên, mã sv, của những sinh viên có tuổi < 20
select hoten, masv
from SINHVIEN
where year(now()) - year(ngaysinh) < 20;
-- Hiển thị thông tin sinh viên có mã sinh viên là ph06235,ph06238,ph06231,ph06230
select * from SINHVIEN
where masv in ("h06235","ph06238","ph06231","ph06230");
-- Hiển thị kết quả sinh viên có điểm từ 3 đến 7.
select * from KETQUA 
where diemthi between 3 and 7;
-- Câu 2.
-- Đưa ra thông tin sinh viên có quê là Hà Nội sắp xếp theo họ tên
select * from SINHVIEN
where quequan = "Hà Nội"
order by hoten asc;
-- Đưa ra số lượng sinh viên hiện tại của toàn khối
select count(masv) as soluongSV
from SINHVIEN;
-- Đưa số lượng sinh viên của các lớp có số lượng sinh viên > 2
select malop, count(masv) as Soluong
from SINHVIEN
group by malop
having Soluong > 2;
-- Đưa ra những môn học có số tiết < 36
select tenmh, sotiet
from MONHOC
where sotiet < 36;
-- Thống kê số lượng sinh viên của các lớp
select malop, count(masv) as SoLuong
from SINHVIEN
group by malop;
-- Đưa ra số lượng sinh viên có tuổi từ 18 đến 65
select count(masv) as SoLuong
from SINHVIEN
where year(now()) - year(ngaysinh) between 20 and 65;
-- Câu 3. 
-- Đưa ra mã sinhvien, ho tên, tên lớp của sinh viên có quê là Hà Tĩnh.
select masv, hoten, L.tenlop
from SINHVIEN as SV
join LOP as L on SV.malop = L.malop
where quequan = "Hà Tĩnh";
-- Cũng như câu 1 nhưng dùng bí danh
select masv, hoten, L.tenlop
from SINHVIEN SV
join LOP L on SV.malop = L.malop
where quequan = "Hà Tĩnh";
-- Đưa ra thông tin masv, hoten, giới tính của sv thuộc lớp Ứng dụng phần mềm 2
select SV.masv, hoten, gioitinh
from SINHVIEN SV
join LOP L on L.malop = SV.malop
where L.tenlop = "Ứng dụng phần mềm 1";
-- Đưa ra masv,hoten,tenmh,diem thi,lanthi của những sinh viên có quê là Hà Nội
select SV.masv, hoten, MH.tenmh, diemthi, lanthi
from SINHVIEN SV
join KETQUA KQ on KQ.masv = SV.masv
join MONHOC MH on MH.mamh = KQ.mamh
where quequan = "Hà Nội";
-- Thống kê số lượng sinh viên của lớp có số lượng sinh viên là thấp nhất
select malop, count(masv) Soluong
from SINHVIEN
group by malop
limit 1;
-- Đưa ra thông tin những sinh viên có cùng ngày sinh
-- Câu 4
-- thay đổi malop của Trần Lê Huy thành It18301
Update SINHVIEN
set malop = 'IT18301'
where hoten = "Nguyễn Thị Mừng";
-- Cập nhật thông tin của sv có mã ph06238:  quê quán thành Hà Tĩnh, giới tình:nữ
update SINHVIEN
set quequan = "Hà Tĩnh", gioitinh = 'Nữ'
where masv = 'ph06238';
-- Cập nhật lại môn học Tin Văn Phòng thành Cơ sở dữ liệu
update MONHOC
set tenmh = 'Cơ sở dữ liệu'
where tenmh = 'Tin học văn phòng';

-- cập nhật sotiet cua của môn học có tên "Tri Tue Nhan Tao" lai 30 tiet.
update MONHOC
set sotiet = 30
where tenmh = 'Trí tuệ nhân tạo';
-- cập nhật sinhvien có tên 'Nguyễn Thị Lam' thành 'Nguyen Thanh Son' và giới tính thành 'Nam'
update SINHVIEN
set hoten='Nguyễn Thanh Lam'
where hoten = 'Nguyễn Thị Mừng';
-- Chuyen sinh vien 'Lê Thị Lan Anh' sang lớp It18302
update SINHVIEN
set malop = 'PT13305'
where hoten = 'Lê Thị Lan Anh';
-- Câu 5
-- 1.Xóa thông tin kết quả học tập của sv có mã ph1234
delete from KETQUA
where masv="ph1234";
-- 2. Xóa những lớp không có sinhvien
delete from LOP
where malop not in 
   (select malop
   from SINHVIEN
   group by malop
   having count(masv) > 0);
-- 3.xóa môn học không có sinhvien hoc
delete from MONHOC
where mamh not in
(select mamh
from KETQUA
group by mamh);
-- 4.xóa kết quả của sinhvien có hoten là Nguyễn Văn Huy
delete from SINHVIEN
where hoten = 'Nguyễn Văn Huy';
-- 5.xóa sinhvien học môn có tên monhoc là Cơ sỡ dữ liệu
Alter table KETQUA
drop foreign key KETQUA_ibfk_1;
delete from SINHVIEN
where masv in 
(select KQ.masv 
from KETQUA KQ
join MONHOC MH on KQ.mamh = MH.mamh
where tenmh='Cơ sở dữ liệu');
-- tang 10% số tiết của các môn học
update MONHOC
set sotiet = sotiet*0.1 + sotiet;
-- tăng 15% số tiết của môn cơ sở dữ liệu
update MONHOC
set sotiet = sotiet*0.15 + sotiet
where tenmh = 'Cơ sở dữ liệu';





























