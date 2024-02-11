# Database Design

address table:

- address_id (primary key)
- city
- employee_id (foreign key referencing employee table)
- state
- street
- zip_code

attendance table:

- attendance_id (primary key)
- date
- employee_id (foreign key referencing employee table)
- time_in
- time_out

contact_information table:

- contact_id (primary key)
- employee_email
- employee_id (foreign key referencing employee table)
- employee_phone

department table:

- department_head_id (foreign key referencing employee table)
- department_id (primary key)
- department_name

employee table:

- date_of_birth
- department_id (foreign key referencing department table)
- employee_id (primary key)
- first_name
- gender
- hire_date
- last_name
- manager_id (foreign key referencing employee table)
- position
- salary

leave_management table:

- employee_id (foreign key referencing employee table)
- end_date
- leave_id (primary key)
- leave_type
- reason
- start_date
