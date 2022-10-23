--Problem Statement:
--How to convert a relational design into tables in SQL Server?

--1) Insert data into each of the above tables. With at least two rows in each of 
   --the table, make sure, that you have created respective foreign keys. 
--2) Delete all the data from each of the tables.

Create Table [Role]
( ID int primary key
, role_name	varchar(100) 
)

Create table user_has_role
( ID int primary key
, role_start_time datetime not null
, role_end_time datetime Null
, user_account_id int Not null
, role_id int not null
)

Create table user_account
( ID int primary key
, user_name varchar(100) Not null
, email varchar(254) Not null
, password varchar(200) Not null
, password_salt varchar(50) Null
, password_hash_algorithm varchar(50) Not null
)

Create table Status
(	ID int Primary key
	,Status_Name varchar(100) not null
	,is_user_working bit not null
)

Create table user_has_status
( ID int primary key
, status_start_time datetime Not null
, status_end_time datetime null
, User_account_id int Not null
, Status_id int Null
)

insert into role (Id,role_name) 
values(101,'Trader'),
      (102,'Fund Manager'),
      (103,'Receptionist'),
      (104,'Financial Advisor'),
      (105,'Investment Analyst'),
      (106,'Sales')


insert into user_has_role (Id,role_start_time,role_end_time,user_account_id,role_id)
values(670,'2014-11-23 11:30:34',Null,7303,106 ),
      (671,'2015-01-09 12:45:13','2019-12-15 03:12:11',7301,104),
	  (672,'2016-08-21 09:11:22',Null,7304,103 ),
	  (673,'2016-09-23 01:30:29','2020-01-11 04:19:09',7307,106 ),
	  (674,'2017-03-09 01:10:14',Null,7305,102 ),
	  (675,'2018-07-07 09:03:32',Null,7302,105 ),
	  (676,'2019-11-03 01:18:55',Null,7306,101 ),
	  (677,'2020-02-27 06:44:58',Null,7308,103 )

insert into user_account (Id,user_name,email,password,password_salt,password_hash_algorithm)
values(7301,'KevinThomas','kevitho123@hotmail.com',hashbytes('MD2','Irondata45@'),'bE3XiWw=','pbFwXWE99vobT6g+vPWFy93NtUU/orrIWafF01hccfM='),
      (7302,'Stepenchan15','chanyoof@gmail.com',hashbytes('MD2','Dhivila0--'),'wbPZqMw=','AC3F4536-BB2E-41C5-B70D-454BE460C1BD'),
	  (7303,'Xingkhu88','tianstepu@gmail.com',hashbytes('MD2','Gsyte45kv'),'PwSunQU=','B3FA4C24-2E96-477C-A923-0CB0F6FA5C80'),
	  (7304,'Marieclerk','lepapclerk@yahoo.com',hashbytes('MD2','Flowersfgh'),'a9GiLUA=','BBE788B9-8D6D-4799-87A7-7B85B6BD67DC'),
	  (7305,'Willamcurran','curranroot77@gmail.com',hashbytes('MD2','Hasding66*'),'FlCpzTU=','4FE51B60-130E-4209-9E67-28DC4D91446C'),
	  (7306,'Jamieanderson01','andersongush@hotmail.com',hashbytes('MD2','Jigglingven++'),'K7dMpTY=','82F25F0C-5D75-4246-958A-B6DF67559D09'),
	  (7307,'KyleMitchell','seedkylewww@gmail.com',hashbytes('MD2','Manofpower2'),'ufS9t98=','6C52CCCA-C922-4FC3-AD0C-C4A651A9EF31'),
	  (7308,'Johnwilley','willeysams333@gmail.com',hashbytes('MD2','Karnalogs2323'),'jkd7f12=','4FC3-AD0C-C4A651A9EF31-6C52CCCA-C922')


insert into user_has_status (Id,status_start_time,status_end_time,user_account_id,status_id)
values(11,'2015-01-09 12:45:13','2019-12-15 03:12:11',7301,201),
      (12,'2016-08-21 09:11:22',Null,7304,203),
      (13,'2019-11-03 01:18:55',Null,7306,203),
      (14,'2018-07-07 09:03:32',Null,7302,203),
      (15,'2021-02-18 11:30:34','2021-03-08 01:10:14',7303,202),
      (16,'2020-02-27 06:44:58',Null,7308,203),
      (17,'2017-03-09 01:10:14',Null,7305,203),
	  (18,'2016-09-23 01:30:29','2020-01-11 04:19:09',7307,201)


insert into status (Id,status_name,is_user_working)
values(201,'Terminated','False'),
      (202,'Leave','False'),
      (203,'Active','True')


select * from role
select * from user_has_role
select * from user_account
select * from user_has_status
select * from status



Alter table user_has_role
ADD Constraint Foreignkey_User_account_id foreign key (user_account_id) references user_account(ID)
,Constraint Foreignkey_role_id foreign key (role_id) references role(ID)
 ;

Alter table user_has_status
ADD Constraint FK_User_account_id foreign key (user_account_id) references user_account(ID)
,Constraint FK_status_id foreign key (status_id) references status(ID)
 ;


--Deleting all records

Alter table user_has_role
drop Constraint Foreignkey_User_account_id,Foreignkey_role_id


Alter table user_has_status
drop Constraint FK_User_account_id,FK_status_id


Truncate table role
Truncate table user_has_role
Truncate table user_account
Truncate table user_has_status
Truncate table status


select * from role
select * from user_has_role
select * from user_account
select * from user_has_status
select * from status
