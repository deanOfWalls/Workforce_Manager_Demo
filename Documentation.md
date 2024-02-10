## Initial Setup
- First connect to your server
> maria -u username -p

OR

> sql -u username -p

- Create a new database
> CREATE DATABASE databaseName;

- Switch to the new database
> USE databaseName;

## Create Tables
> CREATE TABLE Employee (
> EmployeeID INT PRIMARY KEY
> );


> CREATE TABLE Department (
> DepartmentID INT PRIMARY KEY
> );

> CREATE TABLE ContactInformation (
> ContactID INT PRIMARY KEY
> );

> CREATE TABLE Address (
> AddressID INT PRIMARY KEY
> );

> CREATE TABLE Attendance (
> AttendanceID INT PRIMARY KEY
> );

> CREATE TABLE LeaveManagement (
> LeaveID INT PRIMARY KEY
> );
