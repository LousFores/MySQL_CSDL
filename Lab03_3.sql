create database QLSinhVien;
use QLSinhVien;
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
   StdID varchar(6) primary key,
   MSubject varchar(30),
   MType varchar(1),
   Mark decimal(4.2),
   foreign key (StdID) references Students(StdID)
);

insert into Batchs values 
   ('C0809I', 20, '13h30-17h00', 1, 1),
   ('C0812I', 2024, '12h30-14h30', 2, 3),
   ('C0909L', 2024, '15h00-16h00', 5, 4),
   ('T0906G', 2021, '15h30-17h00', 4, 2),
   ('T0909G', 2025, '14h30-17h00', 6, 6);


insert into Students values 
   ('C00111', 'Hieu', 'Le', 'CL1003', '2004-3-29', 'Thanh Hoa', 'lh@'),
   ('C00112', 'Bang', 'Pham', 'CL1004', '2004-4-20', 'Ha Noi', 'bp@'),
   ('C00113', 'Minh', 'Le', 'CL1002', '2004-5-12', 'Nghe An', 'lm@'),
   ('C00114', 'Do', 'Tran', 'CL1005', '2003-7-6', 'Hue', 'td@'),
   ('C00115', 'Tram', 'Vu', 'CL1002', '2002-12-25', 'Ha Tinh', 'tv@');

insert into Marks values 
   ('C00111', 'Tin hoc', 'T', 94.33),
   ('C00112', 'Toan hoc', 'P', 98.45),
   ('C00113', 'Vat li', 'T', 84.12),
   ('C00114', 'Tieng anh', 'P', 64.65),
   ('C00115', 'Lich su', 'P', 74.35);