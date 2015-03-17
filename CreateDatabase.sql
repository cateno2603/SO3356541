use master
GO
create database SOFoo
GO
use SOFoo
GO

create table Company
(
	companyID INT IDENTITY(1,1),
	Name NVARCHAR(50),
	PRIMARY KEY (companyID)
)
GO

create table Employee
(
	employeeID INT IDENTITY(1,1),
	companyId INT NOT NULL,
	Name NVARCHAR(50),
	PRIMARY KEY (employeeID),
	FOREIGN KEY (companyId) REFERENCES Company(companyId)
)
GO

create table Employee_Car
(
	employee_CarId INT IDENTITY(1,1),
	employeeID INT NOT NULL,
	Name NVARCHAR(50),

	PRIMARY KEY (employee_CarId),
	FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
)
GO

create table Employee_Country
(
	Employee_CountryId INT IDENTITY(1,1),
	employeeID INT NOT NULL,
	Name NVARCHAR(50),

	PRIMARY KEY (Employee_CountryId),
	FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
)
GO

insert into company (name) VALUES ('Company1');
insert into company (name) VALUES ('Company2');
insert into Employee (companyid, name) VALUES (1, 'Employee1');
insert into Employee (companyid, name) VALUES (1, 'Employee2');
insert into Employee (companyid, name) VALUES (2, 'Employee3');
insert into Employee (companyid, name) VALUES (2, 'Employee4');
insert into Employee_Car(employeeID, name) values (1, 'Employee1 first car');
insert into Employee_Car(employeeID, name) values (1, 'Employee1 second car');
-- Emp 2 no car
insert into Employee_Car(employeeID, name) values (3, 'Employee3 only car');
insert into Employee_Car(employeeID, name) values (4, 'Employee4 first car');
insert into Employee_Car(employeeID, name) values (4, 'Employee4 second car');
insert into Employee_Country(employeeID, name) values (1, 'USA');
insert into Employee_Country(employeeID, name) values (2, 'USA');
insert into Employee_Country(employeeID, name) values (3, 'USA');
insert into Employee_Country(employeeID, name) values (4, 'Canada');
GO