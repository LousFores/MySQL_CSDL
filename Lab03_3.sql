create database QLSinhVienLab3_3;
use QLSinhVienLab3_3;
create table Batchs(
   BatchID varchar(6) primary key,
   BYear int,
   BTime varchar(50),
   ClassRoom tinyint,
   LabRoom tinyint
);

create table Students (
   StdID varchar(6) primary key,
   FirstName varchar(50),
   LastName varchar(50),
   BatchID varchar(6),
   Birthday datetime,
   Address varchar(100),
   Email varchar(50),
   foreign key (BatchID) references Batchs (BatchID)
);

create table Marks (
   StdID varchar(6),
   MSubject varchar(30),
   MType varchar(1),
   Mark decimal(4.2),
   foreign key (StdID) references Students(StdID)
);

insert into Batchs values 
   ('C0809I', 2008, '13h30-17h30', 1, 1),
   ('C0812I', 2008, '13h30-17h30', 2, 2),
   ('C0909L', 2009, '17h30-19h30', 2, 2),
   ('T0906G', 2009, '7h30-11h30', 1, 1),
   ('T0908I', 2009, '13h30-17h30', 3, 3),
   ('T0909G', 2009, '14h30-17h00', 2, 2);


insert into Students values 
   ('1', 'Nguyen Van', 'A', 'C0909L', '1987-12-3', 'Ha Noi', 'lh@'),
   ('2', 'Tran Thi', 'B', 'T0909G', '1988-8-13', 'Hai Phong', 'bp@'),
   ('3', 'Nguyen Van', 'C', 'T0909G', '1984-11-25', 'Nam Dinh', 'lm@'),
   ('4', 'Le Thi', 'D', 'T0908I', '1987-6-27', 'Hoa Binh', 'td@'),
   ('5', 'Tran Van', 'E', 'T0906G', '1987-11-21', 'Ha Noi', 'tv@');

insert into Marks values 
   ('1', 'CF', 'W', 12.50),
   ('1', 'C', 'W', 15.25),
   ('1', 'C', 'P', 14.00),
   ('2', 'CF', 'W', 14.50),
   ('2', 'C', 'P', 16.50),
   ('3', 'C', 'W', 18.25),
   ('3', 'C', 'P', 17.00),
   ('4', 'CF', 'W', 13.50),
   ('4', 'C', 'P', 15.50),
   ('5', 'C', 'W', 12.50),
   ('5', 'C', 'P', 17.50);   
   
   
-- 4.1 Liệt kê các lớp học khai giảng năm 2009
select * from Batchs
Where BYear = 2009;
-- 4.2 Liệt kê các học sinh học lớp 'T0909G'
select * from Students
where BatchID = 'T0909G';
-- 4.3 Liệt kê các lớp học sử dụng Class 2 và Lab 2
select * from Batchs
where ClassRoom = 2 and LabRoom = 2;
-- 4.4 Đếm số học viên(sử dụng count())
select count(StdID)
from Students;
-- 4.5 Liệt kê các học sinh có năm sinh từ 1985 – 1990
select * from Students
where Birthday between '1985-1-1' and '1990-12-31';
-- 4.6 Liệt kê các học viên có Họ là “Nguyen”
select * from Students
where FirstName like 'Nguyen%';
-- 4.7 Lấy top 3 học viên dựa theo tên tăng dần A-Z
select * from Students
order by LastName asc
limit 3;
-- 4.8 Lấy top 3 học sinh dựa theo tuổi giảm dần
select * from Students
order by year(now()) - year(Birthday) desc
limit 3;
-- 4.9 Lấy học viên nhỏ tuổi nhất
select * from Students
where year(Birthday) = (select max(year(Birthday)) from Students);
-- 4.10 Liệt kê điểm thi lý thuyết môn C của tất cả các học viên
select * from Marks
where MSubject = 'C' and Mtype = 'W';
-- 4.11 Liệt kê các điểm thi của học viên “Nguyen Van A”
select * from Marks
where StdID = (select StdID from Students where concat(FirstName,' ',LastName) = 'Nguyen Van A');
-- 4.12 Lấy điểm thi cao nhất môn C - thực hành
select max(Mark)
from Marks 
where MSubject = 'C' and MType = 'P';
-- 4.13 Tính điểm trung bình thi Lý thuyết C
select avg(Mark)
from Marks
where MSubject = 'C' and MType = 'W';
-- 4.14 Thống kê điểm thi cao nhất, thấp nhất, trung bình của các môn thi (phân biệt Lý thuyết, thực hành).
drop view if exists ViewSubject;
create view ViewSubject as
select max(Mark), min(Mark), avg(Mark) 
from Marks
where MType = 'P'
union   
select max(Mark), min(Mark), avg(Mark) 
from Marks
where MType = 'W';
  
select * from ViewSubject;
   
create view ViewSubject2(VSubject, VType) as
select MSubject, MType
from Marks 
group by MSubject, MType;

select * from ViewSubject2;


select max(Mark), min(Mark), avg(Mark) 
from Marks
where MSubject = (select VSubject from ViewSubject2) and
	  MType = (select VType from ViewSubject2);
      
      
      
      
      
      