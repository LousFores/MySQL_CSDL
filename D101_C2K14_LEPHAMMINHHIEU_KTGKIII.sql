create database mydb;
use mydb;
-- 
create table Student(
   stuID int primary key,
   stuName text,
   age int, 
   gender boolean default 1,
   address text
); 
--
insert into Student values 
   (1, 'Nguyen Van Nam', 20, 1, 'Ha Noi'),
   (2, 'Truong Van Hoa', 18, 1, 'Ha Noi'),
   (3, 'Trinh Thi Minh', 20, 1, 'Ha Noi'),
   (4, 'Le Tuan Anh', 19, 1, 'Ha Noi'),
   (5, 'Tran Van Viet', 21, 1, 'Ha Noi');

select * from Student;
select * from Student where stuID = ?;
insert into Student values (?,?,?,?,?);