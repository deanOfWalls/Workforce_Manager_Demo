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

## Create remaining fields for all tables
- address
> ALTER TABLE address
> ADD city VARCHAR(255),
> ADD employee_id INT,
> ADD state VARCHAR(255),
> ADD street VARCHAR(255),
> ADD zip_code INT;

- attendance
> ALTER TABLE attendance
> ADD date DATE,
> ADD employee_id INT, 
> ADD time_in TIME,
> ADD time_out TIME;

- contact_information
> ALTER TABLE contact_information
> ADD employee_email VARCHAR(255),
> ADD employee_id INT,
> ADD employee_phone VARCHAR(255);

- department
> ALTER TABLE department
> ADD department_head_id INT,
> ADD department_name VARCHAR(255);

- employee
> ALTER TABLE employee
> ADD date_of_birth DATE,
> ADD department_id INT,
> ADD first_name VARCHAR(255),
> ADD gender ENUM('female', 'male'),
> ADD hire_date DATE,
> ADD last_name VARCHAR(255),
> ADD manager_id INT,
> ADD position ENUM('ceo', 'production_lead', 'software_developer'),
> ADD salary DECIMAL(10, 2);

- leave_management
> ALTER TABLE leave_management
> ADD employee_id INT,
> ADD end_date DATE, 
> ADD leave_type ENUM('personal', 'sick', 'vacation'),
> ADD start_date DATE;

## Add Foreign Key Constraints
- address
> ALTER TABLE address
> ADD CONSTRAINT fk_address_employee
> FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

- attendance
> ALTER TABLE attendance
> ADD CONSTRAINT fk_attendance_employee
> FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

- contact information
> ALTER TABLE contact_information
> ADD CONSTRAINT fk_contact_information_employee
> FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

- department
> ALTER TABLE department
> ADD CONSTRAINT fk_department_head_employee
> FOREIGN KEY (department_id) REFERENCES employee(employee_id);

- employee
> ALTER TABLE employee
> ADD CONSTRAINT fk_employee_department
> FOREIGN KEY (department_id) REFERENCES department(department_id);

- employee
> ALTER TABLE employee
> ADD CONSTRAINT fk_employee_manager
> FOREIGN KEY (manager_id) REFERENCES employee(employee_id);

- leave_management
> ALTER TABLE leave_management
> ADD CONSTRAINT fk_leave_management_employee
> FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
