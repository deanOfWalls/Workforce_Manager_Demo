## Initial Setup
- Install MariaDB

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
- Start by creating tables that do not depend on foreign keys, followed by those that do.

```sql
CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATE,
  gender ENUM('female', 'male'),
  hire_date DATE,
  department_id INT,
  position VARCHAR(255),
  salary DECIMAL(10, 2),
  manager_id INT,
  INDEX (department_id),
  INDEX (manager_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

CREATE TABLE department (
  department_id INT PRIMARY KEY,
  department_head_id INT,
  department_name VARCHAR(255),
  FOREIGN KEY (department_head_id) REFERENCES employee(employee_id)
);

CREATE TABLE contact_information (
  contact_id INT PRIMARY KEY,
  employee_id INT,
  employee_phone VARCHAR(255),
  employee_email VARCHAR(255),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE address (
  address_id INT PRIMARY KEY,
  city VARCHAR(255),
  employee_id INT,
  state VARCHAR(255),
  street VARCHAR(255),
  zip_code INT,
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE attendance (
  attendance_id INT PRIMARY KEY,
  date DATE,
  employee_id INT,
  time_in TIME,
  time_out TIME,
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE leave_management (
  leave_id INT PRIMARY KEY,
  employee_id INT,
  start_date DATE,
  end_date DATE,
  leave_type ENUM('personal', 'sick', 'vacation'),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);
