--UC 12 Entity framework for AddressBookDB
use Address_BookDB

-- Create basic contact detail table
create table contactdetails
(FirstName varchar(30) not null,
LastName varchar(30) not null,
PhoneNumber varchar(10) not null,
Email varchar(50) not null,
Primary key(FirstName,LastName)
)

-- alter table to check the length of phone number
alter table contactdetails
add constraint Len_Phone check(len(PhoneNumber) = 10)

-- alter table to add zip
alter table contactdetails
add address varchar(60) not null default' ',Zip varchar(6) not null  default'686574' foreign key references Zip(zip)

-- Insert values to table
Insert into contactdetails values
('Kamalakar','Rao','7896541233','Kamalakars04@gmail.com'),
('Prasad','sk','8965414589','prasad@gmail.com'),
('Ravi','kumar','1236547899','ravi@gmail.com'),
('Kamalakar','s','8523697411','skvrks@gmail.com'),
('Ram','raju','8957463211','Ram@gmail.com');

update contactdetails set Zip = '136119' where FirstName = 'Ram' or FirstName = 'Ravi'

select * from contactdetails

-- Create zip table to save city and state which is in one to many reation with contacts
create table Zip
(Zip varchar(6) not null,
city varchar(20) not null,
state varchar(25) not null
primary key(Zip),
Constraint Zip_Len check(len(zip) = 6)
)

--Insert values to zip
insert into Zip values
('686574','pala','kerala'),('136119','kurukshetra','haryana')

--Create a BookName and ContactType table having unique combinations of Book and Type
-- It is in many to many relation with contacts
create table BookNameContactType
( NameTypeid int not null identity(1,1),
AddressBookName varchar(60) not null,
ContactType varchar(60) not null,
unique(AddressBookName, ContactType),
primary key(NameTypeid)
)

--Insert into table
insert into BookNameContactType values
('Mybook','Friend'),('Mybook','family'),('BroBook','Friend'),('Brobook','relative')

select * from BookNameContactType

--Create a intermediate table between Contact details and ContactType BookName tables
create table ContactTypeMap
(FirstName varchar(30) not null,
LastName varchar(30) not null,
NameTypeid int not null foreign key references BookNameContactType(NameTypeId),
Foreign key(FirstName, LastName) references contactdetails( FirstName,LastName),
unique(FirstName,LastName,NameTypeid)
)

--Insert to the table
Insert into ContactTypeMap values
('Kamalakar','Rao','1'),('Prasad','sk','1'),('Ravi','kumar','4'),('Kamalakar','s','3'),
('Ram','raju','3'),('Kamalakar','Rao','3')

select * from ContactTypeMap
