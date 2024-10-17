create database testdb;
use testdb;

create table Customer_master(
Customer_id int not null primary key,
Customer_Firstname varchar(300) not null,
Customer_Lastname varchar(300),
Age int not null,
Email varchar(250) unique,
Contact int not null
);

create table City_Master(
City_id int not null primary key,
City_name varchar(250) not null
);

create table Addresstype_Master(
Addtype_id int not null primary key,
Address_type varchar(500) not null
);

create table Country_Master(
Country_id int not null primary key,
Country_Name varchar(500) not null
);

create table Customer_Address_Info(
Add_detail_id int not null primary key,
Address varchar(600) not null,
Addtype_id int foreign key references Addresstype_Master(Addtype_id) on delete no action on update cascade,
City_id int foreign key references City_Master(City_id) on delete no action on update cascade,
Country_id int foreign key references Country_Master(Country_id) on delete no action on update cascade,
Customer_id int foreign key references Customer_master(Customer_id) on delete no action on update cascade
);