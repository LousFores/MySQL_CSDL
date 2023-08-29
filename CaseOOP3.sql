create database UserData;
use UserData;
create table People(
  ID varchar(6) primary key,
  FirstName varchar(50),
  LastName varchar(50),
  Birthday datetime,
  Gmail varchar(50),
  Address varchar(50)
);

INSERT INTO People VALUES (?,?,?,?,?,?);
UPDATE People 
SET FirstName = ?, LastName = ?, Birthday = ?, Gmail = ?, Address = ?
WHERE ID = ?;
SELECT * FROM UserData.People;
SELECT * FROM UserData.People
WHERE IP = ?;

DELETE FROM UserData.People
WHERE ID = ?;