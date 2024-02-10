# Database Design

Employee Table:

- EmployeeID (Primary Key)
- FirstName
- LastName
- DateOfBirth
- Gender
- HireDate
- DepartmentID (Foreign Key referencing Department Table)
- Position
- Salary
- ManagerID (Foreign Key referencing Employee Table)

Department Table:

- DepartmentID (Primary Key)
- DepartmentName
- DepartmentHeadID (Foreign Key referencing Employee Table)

ContactInformation Table:

- ContactID (Primary Key)
- EmployeeID (Foreign Key referencing Employee Table)
- ContactType (e.g., Phone, Email)
- ContactValue

Address Table:

- AddressID (Primary Key)
- EmployeeID (Foreign Key referencing Employee Table)
- AddressType (e.g., Home, Work)
- Street
- City
- State
- ZipCode

Attendance Table:

- AttendanceID (Primary Key)
- EmployeeID (Foreign Key referencing Employee Table)
- Date
- TimeIn
- TimeOut

LeaveManagement Table:

- LeaveID (Primary Key)
- EmployeeID (Foreign Key referencing Employee Table)
- LeaveType
- StartDate
- EndDate
- Reason
