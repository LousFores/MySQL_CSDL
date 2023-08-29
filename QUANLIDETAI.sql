create database QUANLIDETAI;
use QUANLIDETAI;
create table GIAOVIEN (
    MaGV varchar(10) primary key,
    HoTen varchar(50),
    NgaySinh date,
    QueQuan varchar(50),
    GioiTinh varchar(10)
);
create table DETAI (
	MaDT varchar(10) primary key,
    TenDT varchar(50),
    NamTH int,
    MaGV varchar(10),
    foreign key (MaGV) references GIAOVIEN (MaGV)
);

create table SINHVIEN (
    MaSV varchar(10) primary key,
    HoTen varchar(50),
    NgaySinh date,
    QueQuan varchar(50),
    Diem double,
    MaDT varchar(10),
    foreign key (MaDT) references DETAI(MaDT)
);

insert into GIAOVIEN values 
    ('GV01', 'Trần Thị Loan', '1978-6-5', 'Nam Định', 'Nữ'),
    ('GV02', 'Lê Viết Trịnh', '1989-3-5', 'Hà Tĩnh', 'Nam'),
    ('GV03', 'Trần Hữu Thiện', '1991-1-9', 'Hà Nội', 'Nam');
    
insert into DETAI values
    ('D01', 'Công nghệ 4.0', 2017, 'GV01'),
    ('D02', 'Công nghệ Blockchain', 2018, 'GV03'),
    ('D03', 'Bitcoin', 2018, 'GV03');
    
insert into SINHVIEN values
    ('S001', 'Lê Quang Tèo', '2000-1-1', 'Hà Nội', 7, 'D02'),
    ('S002', 'Đỗ Mỹ Linh', '1998-8-5', 'Hà Tĩnh', 10, 'D01'),
    ('S003', 'Mai Phương Thúy', '1999-9-6', 'Nghệ An', 8, 'D02');
    
-- Câu 2: Đưa ra thông tin: mã sinh viên, họ tên, tên đề tài của các đề tài được giáo viên ‘Trần Thị Loan’ hướng dẫn
select SV.MaSV, SV.Hoten, TenDT 
from SINHVIEN SV
join DETAI DT on SV.MaDT = DT.MaDT
join GIAOVIEN GV on GV.MaGV = DT.MaGV
where GV.HoTen = 'Trần Thị Loan';
-- Câu 3: Đưa ra thông tin: Masv, Hoten, Tuoi của những sinh viên có tuổi>18 và Quequan là ‘Hà Nội’ 
select MaSV, HoTen, year(now()) - year(NgaySinh) as Tuoi
from SINHVIEN
where year(now()) - year(NgaySinh) > 18 and QueQuan = 'Hà Nội';
-- Câu 4: Đưa ra thông tin giáo viên hướng dẫn nhiều đề tài nhất.Thông tin hiển thị gồm có: Magv, Hoten, số đề tài hướng dẫn 
select GV.MaGV, Hoten, count(DT.MaGV) as SoDT
from GIAOVIEN GV
join DETAI DT on GV.MaGV = DT.MaGV
group by GV.MAGV 
order by SoDT desc
limit 1;
-- Câu 5: Đưa ra danh sách các đề tài và điểm trung bình của từng đề tài 
-- (điểm trung bình của từng đề tài = trung bình cộng điểm của các sinh viên tham gia vào đề tài đó).
-- thông tin gồm: Madt, Tendt, Điểm TB
select DT.MaDT, TenDT, AVG(SV.Diem) AS DiemTB
from DETAI DT
join SINHVIEN SV on SV.MaDT = DT.MaDT
group by DT.MaDT;
-- Câu 6: Thêm một bản ghi mới vào bảng,dữ liệu phù hợp( không được nhập giá trị null). 
-- Câu 7: Thay đổi quê quán của giáo viên Trần thị Loan  thành ‘Hà Nội’. 
update GIAOVIEN
SET QueQuan = 'Ha Noi'
WHERE HoTen = 'Trần Thị Loan';
-- Câu 8: Xóa đề tài không có sinh viên chọn. 
DELETE FROM DETAI
WHERE MaDT not in (SELECT MaDT FROM SINHVIEN);

delimiter $$
drop procedure if exists showTableGV $$
create procedure showTableGV()
begin 
  declare qq varchar(50) default 'Hà Tĩnh';
  select * from GIAOVIEN where QueQuan = qq;
end; $$
delimiter ; 

call showTableGV();

SELECT CONCAT('Hôm nay là: ', DATE_FORMAT(NOW(), '%d/%m/%Y'));
SELECT CONCAT('Hôm nay là: ', DATE_FORMAT(NOW(), '%W, %M %D, %Y'));
SELECT CONCAT('Bây giờ là: ', TIME_FORMAT(NOW(), '%H:%i:%s'));
-- Hiển thị ngày theo định dạng "dd/mm/yyyy": 
SELECT CONCAT('Hôm nay là: ', DATE_FORMAT(NOW(), '%d/%m/%Y'));
-- Hiển thị ngày theo định dạng "Day, Month ddth, yyyy": 
SELECT CONCAT('Hôm nay là: ', DATE_FORMAT(NOW(), '%W, %M %D, %Y'));
-- Hiển thị thời gian hiện tại theo định dạng "hh:mm:ss": 
SELECT CONCAT('Bây giờ là: ', TIME_FORMAT(NOW(), '%H:%i:%s'));