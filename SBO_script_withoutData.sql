
if DB_ID('Shopping_Bonsai_online') is not null
begin
	-- Delete database backup and restore history from MSDB System Database
	exec msdb.dbo.sp_delete_database_backuphistory @database_name = 'Shopping_Bonsai_online'
	-- query to get exclusive access of SQL Server Database before Dropping the Database
	use [master]
	alter database [Shopping_Bonsai_online] set SINGLE_USER with rollback immediate
	-- query to drop database in SQL Server
	drop database Shopping_Bonsai_online
end
else
begin
	create database Shopping_Bonsai_online
end
go

use Shopping_Bonsai_online
go

if OBJECT_ID ('Person', 'U') is not null
	drop table Person
else
begin
	create table Person
	(
		id int identity primary key,
		firstName nvarchar(255),
		lastName nvarchar(255),
		phone varchar(50),
		email varchar(255),
		address nvarchar(255),
		username varchar(255),
		password varchar(1000),
		isAddmin bit
	)
end
go

if OBJECT_ID('Product', 'U') is not null
	drop table Product
else
begin
	create table Product
	(
		id int identity not null primary key,
		name nvarchar(50),
		price float,
		type nvarchar(255),	--Loại mặt hàng
		status bit,	--Còn hàng/hết hàng
		producer nvarchar(255)	--Nhà phân phối
	)
end
go

if OBJECT_ID('ProductInCart', 'U') is not null
	drop table ProductInCart
else
begin
	create table ProductInCart
	(
		id int identity not null primary key,
		productRefId int,
		cartRefId int,
		count int,
		totalPrice float,

		foreign key(productRefId) references Product(id),
		foreign key(cartRefId) references Cart(id)
	)
end
go

if OBJECT_ID('Cart', 'U') is not null
	drop table Cart
else
begin
	create table Cart
	(
		id int identity not null primary key,
		personRefId int,
		totalPrice float,

		foreign key(personRefId) references Person(id)
	)
end
go

if OBJECT_ID('Evaluation', 'U') is not null
	drop table Evaluation
else
begin
	create table Evaluation
	(
		id int identity not null primary key,
		personRefId int,
		title nvarchar(100),
		message nvarchar(500),

		foreign key(personRefId) references Person(id)
	)
end
go

if OBJECT_ID('ProductInOrdered', 'U') is not null
	drop table ProductInOrdered
else
begin
	create table ProductInOrdered
	(
		id int identity not null primary key,
		productRefId int,
		orderedRefId int,
		count int,
		totalPrice float,

		foreign key(productRefId) references Product(id),
		foreign key(orderedRefId) references Ordered(id)
	)
end
go

if OBJECT_ID('Ordered', 'U') is not null
	drop table Ordered
else
begin
	create table Ordered
	(
		id int identity not null primary key,
		personRefId int,
		dateOfBought datetime,
		ProductInOrderedRefId int,
		totalPrice float,
		status bit,

		foreign key(personRefId) references Person(id),
		foreign key(ProductInOrderedRefId) references ProductInOrdered(id)
	)
end
go