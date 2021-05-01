DROP TABLE IF EXISTS Department_Emp;
DROP TABLE IF EXISTS Department_Manager;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Employees;


CREATE TABLE Titles (
    Title_ID VARCHAR   PRIMARY KEY,
    Title VARCHAR   NOT NULL
);

CREATE TABLE Employees (
    Emp_no INTEGER   PRIMARY KEY,
    Emp_Title_ID VARCHAR   NOT NULL,
    Birth_Date VARCHAR   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Sex VARCHAR   NOT NULL,
    Hire_Date VARCHAR   NOT NULL,
	CONSTRAINT fk_Employees_Emp_Title_ID
		FOREIGN KEY(Emp_Title_ID)
		REFERENCES Titles (Title_ID)
		ON DELETE CASCADE
);

CREATE TABLE Departments (
    Dept_no VARCHAR   PRIMARY KEY,
    Dept_Name VARCHAR   NOT NULL
);

CREATE TABLE Department_Emp (
    Emp_no INTEGER   NOT NULL,
    Dept_no VARCHAR   NOT NULL,
	CONSTRAINT fk_Department_Emp_Emp_no
		FOREIGN KEY(Emp_no)
		REFERENCES Employees (Emp_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_Department_Emp_Dept_no
		FOREIGN KEY(Dept_no)
		REFERENCES Departments (Dept_no)
		ON DELETE CASCADE
);

CREATE TABLE Department_Manager (
	Dept_no VARCHAR   NOT NULL,
    Emp_no INTEGER   NOT NULL,
	CONSTRAINT fk_Department_Manager_Emp_no
		FOREIGN KEY(Emp_no)
		REFERENCES Employees (Emp_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_Department_Manager_Dept_no
		FOREIGN KEY(Dept_no)
		REFERENCES Departments (Dept_no)
		ON DELETE CASCADE
);

CREATE TABLE Salaries (
    Emp_no INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
	CONSTRAINT fk_Salaries_Emp_no
		FOREIGN KEY(Emp_no)
		REFERENCES Employees (Emp_no)
		ON DELETE CASCADE
);