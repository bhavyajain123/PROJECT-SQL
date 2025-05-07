
create database project ;
use project;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);


CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    JobTitle VARCHAR(100) NOT NULL,
    MinSalary DECIMAL(10, 2),
    MaxSalary DECIMAL(10, 2)
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    HireDate DATE,
    DepartmentID INT,
    JobID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    CHECK (Status IN ('Present', 'Absent', 'Leave'))
);


INSERT INTO Departments VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'Engineering'),
(104, 'Sales');


INSERT INTO Jobs VALUES
(1, 'HR Manager', 40000, 80000),
(2, 'Accountant', 35000, 70000),
(3, 'Software Engineer', 50000, 120000),
(4, 'Sales Executive', 30000, 60000);


INSERT INTO Employees VALUES
(1, 'Alice', 'Johnson', 'alice@company.com', '9876543210', '2021-04-12', 101, 1, 65000),
(2, 'Bob', 'Smith', 'bob@company.com', '9876543211', '2020-06-15', 102, 2, 55000),
(3, 'Charlie', 'Lee', 'charlie@company.com', '9876543212', '2022-01-10', 103, 3, 85000),
(4, 'Diana', 'Brown', 'diana@company.com', '9876543213', '2019-11-05', 104, 4, 45000);


INSERT INTO Attendance VALUES
(1, 1, '2025-05-01', 'Present'),
(2, 1, '2025-05-02', 'Absent'),
(3, 2, '2025-05-01', 'Present'),
(4, 3, '2025-05-01', 'Leave'),
(5, 4, '2025-05-01', 'Present'),
(6, 4, '2025-05-02', 'Present');


show tables;
select*from Employees;
select*from Departments;
SELECT FirstName, LastName, DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE DepartmentName = 'Engineering';
SELECT e.FirstName, e.LastName, j.JobTitle, e.Salary
FROM Employees e
JOIN Jobs j ON e.JobID = j.JobID;

select*from Jobs;
select *from Attendance;




