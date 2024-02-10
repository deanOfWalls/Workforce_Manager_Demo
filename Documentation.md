## Initial Setup
- Install mariadb
> sudo pacman -S mariadb

- Initialize the MariaDB Data Directory
> sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

- Start and Enable MariaDB Service
> sudo systemctl start mariadb
> sudo systemctl enable mariadb

- Secure MariaDB Installation
> sudo mysql_secure_installation

- Log into MariaDB (Use the password you set during the previous step)
> sudo mariadb -u root -p

- Create a new database
> CREATE DATABASE your_database_name;

- Create a New User and Grant Permissions
> CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
> GRANT ALL PRIVILEGES ON your_database_name.* TO 'your_username'@'localhost';
> FLUSH PRIVILEGES;

- Test the New User
> EXIT;
> mariadb -u your_username -p
> USE your_database_name;

## Create Tables
> CREATE TABLE employee (
> employee_id INT PRIMARY KEY
> );

> CREATE TABLE department (
> department_id INT PRIMARY KEY
> );

> CREATE TABLE contact_information (
> contact_id INT PRIMARY KEY
> );

> CREATE TABLE address (
> address_id INT PRIMARY KEY
> );

> CREATE TABLE attendance (
> attendance_id INT PRIMARY KEY
> );

> CREATE TABLE leave_management (
> leave_id INT PRIMARY KEY
> );
