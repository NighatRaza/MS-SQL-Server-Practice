-- SQL SERVER JOINS PRACTICE DATASET
-- Realistic Company Database
-- =============================================

-- Create Database
CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO

-- =============================================
-- CREATE TABLES
-- =============================================

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    ManagerID INT
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    HireDate DATE,
    DepartmentID INT,
    JobTitle VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Projects Table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Employee_Projects (Junction Table)
CREATE TABLE Employee_Projects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked DECIMAL(6,2),
    Role VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Salaries Table
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(10,2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- =============================================
-- INSERT SAMPLE DATA
-- =============================================

-- Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location, ManagerID) VALUES
(1, 'Engineering', 'San Francisco', 101),
(2, 'Marketing', 'New York', 105),
(3, 'Sales', 'Chicago', 108),
(4, 'Human Resources', 'Austin', 112),
(5, 'Finance', 'Boston', 115),
(6, 'Customer Support', 'Seattle', NULL),  -- No manager assigned yet
(7, 'Research', 'San Diego', NULL);        -- New department, no employees yet

-- Insert Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, DepartmentID, JobTitle) VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 1, 'Engineering Manager'),
(102, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '2019-06-20', 1, 'Senior Developer'),
(103, 'Michael', 'Williams', 'michael.williams@company.com', '2020-01-10', 1, 'Developer'),
(104, 'Emily', 'Brown', 'emily.brown@company.com', '2020-08-05', 1, 'Junior Developer'),
(105, 'David', 'Jones', 'david.jones@company.com', '2017-11-12', 2, 'Marketing Director'),
(106, 'Jessica', 'Garcia', 'jessica.garcia@company.com', '2019-04-18', 2, 'Marketing Specialist'),
(107, 'Daniel', 'Martinez', 'daniel.martinez@company.com', '2021-02-22', 2, 'Content Writer'),
(108, 'Amanda', 'Rodriguez', 'amanda.rodriguez@company.com', '2018-09-30', 3, 'Sales Manager'),
(109, 'James', 'Wilson', 'james.wilson@company.com', '2020-05-14', 3, 'Sales Representative'),
(110, 'Lisa', 'Anderson', 'lisa.anderson@company.com', '2019-12-01', 3, 'Sales Representative'),
(111, 'Robert', 'Taylor', 'robert.taylor@company.com', '2021-07-19', 3, 'Junior Sales Rep'),
(112, 'Jennifer', 'Thomas', 'jennifer.thomas@company.com', '2017-05-08', 4, 'HR Director'),
(113, 'Christopher', 'Moore', 'christopher.moore@company.com', '2020-03-25', 4, 'HR Specialist'),
(114, 'Michelle', 'Jackson', 'michelle.jackson@company.com', '2021-09-12', 4, 'Recruiter'),
(115, 'Matthew', 'White', 'matthew.white@company.com', '2016-08-22', 5, 'Finance Director'),
(116, 'Ashley', 'Harris', 'ashley.harris@company.com', '2019-10-30', 5, 'Accountant'),
(117, 'Joshua', 'Martin', 'joshua.martin@company.com', '2020-11-05', 5, 'Financial Analyst'),
(118, 'Rachel', 'Thompson', 'rachel.thompson@company.com', '2021-03-17', 6, 'Support Specialist'),
(119, 'Andrew', 'Garcia', 'andrew.garcia@company.com', '2021-08-28', 6, 'Support Specialist'),
(120, 'Kevin', 'Lee', 'kevin.lee@company.com', '2022-01-15', NULL, 'Consultant');  -- No department assigned

-- Insert Projects
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget, DepartmentID) VALUES
(201, 'Mobile App Development', '2023-01-15', '2023-06-30', 250000.00, 1),
(202, 'Website Redesign', '2023-02-01', '2023-05-15', 150000.00, 1),
(203, 'Social Media Campaign', '2023-03-10', '2023-09-10', 75000.00, 2),
(204, 'Brand Refresh', '2023-01-20', '2023-07-20', 100000.00, 2),
(205, 'Q2 Sales Initiative', '2023-04-01', '2023-06-30', 50000.00, 3),
(206, 'Employee Wellness Program', '2023-02-15', '2023-12-31', 30000.00, 4),
(207, 'Financial System Upgrade', '2023-05-01', '2023-11-30', 200000.00, 5),
(208, 'Customer Feedback System', '2023-06-01', '2023-08-31', 80000.00, 6),
(209, 'AI Research Initiative', '2023-07-01', '2024-06-30', 500000.00, NULL);  -- Not assigned to department yet

-- Insert Employee_Projects (who works on what)
INSERT INTO Employee_Projects (EmployeeID, ProjectID, HoursWorked, Role) VALUES
(101, 201, 120.5, 'Project Lead'),
(102, 201, 280.0, 'Lead Developer'),
(103, 201, 320.5, 'Developer'),
(104, 201, 250.0, 'Developer'),
(102, 202, 150.0, 'Lead Developer'),
(103, 202, 180.5, 'Developer'),
(105, 203, 100.0, 'Campaign Manager'),
(106, 203, 200.5, 'Marketing Lead'),
(107, 203, 180.0, 'Content Creator'),
(105, 204, 80.0, 'Brand Director'),
(106, 204, 150.0, 'Brand Strategist'),
(108, 205, 90.5, 'Sales Lead'),
(109, 205, 120.0, 'Sales Rep'),
(110, 205, 115.5, 'Sales Rep'),
(112, 206, 60.0, 'Program Director'),
(113, 206, 100.5, 'Program Coordinator'),
(115, 207, 80.0, 'Project Sponsor'),
(116, 207, 150.5, 'Implementation Lead'),
(117, 207, 140.0, 'Analyst'),
(118, 208, 120.0, 'System Lead'),
(119, 208, 130.5, 'Developer');

-- Insert Salaries
INSERT INTO Salaries (SalaryID, EmployeeID, Salary, EffectiveDate) VALUES
(1, 101, 125000.00, '2023-01-01'),
(2, 102, 105000.00, '2023-01-01'),
(3, 103, 85000.00, '2023-01-01'),
(4, 104, 65000.00, '2023-01-01'),
(5, 105, 115000.00, '2023-01-01'),
(6, 106, 75000.00, '2023-01-01'),
(7, 107, 60000.00, '2023-01-01'),
(8, 108, 110000.00, '2023-01-01'),
(9, 109, 70000.00, '2023-01-01'),
(10, 110, 72000.00, '2023-01-01'),
(11, 111, 55000.00, '2023-01-01'),
(12, 112, 120000.00, '2023-01-01'),
(13, 113, 68000.00, '2023-01-01'),
(14, 114, 62000.00, '2023-01-01'),
(15, 115, 130000.00, '2023-01-01'),
(16, 116, 78000.00, '2023-01-01'),
(17, 117, 82000.00, '2023-01-01'),
(18, 118, 58000.00, '2023-01-01'),
(19, 119, 56000.00, '2023-01-01');
-- Note: Employee 120 (Kevin Lee) has no salary record yet

