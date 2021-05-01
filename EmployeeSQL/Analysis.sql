--1
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, last_name, first_name, sex, Salaries.salary
FROM Employees
JOIN Salaries
	ON Employees.emp_no = Salaries.emp_no;

--2
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date LIKE '%1986';

--3
--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT Department_Manager.dept_no, Departments.dept_name, Department_Manager.emp_no, Employees.last_name, Employees.first_name
FROM Department_Manager
JOIN Employees
	ON Department_Manager.emp_no = Employees.emp_no
JOIN Departments
	ON Department_Manager.dept_no = Departments.dept_no;

--4
--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT Department_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Department_Emp
JOIN Employees
	ON Department_Emp.emp_no = Employees.emp_no
JOIN Departments
	ON Department_Emp.dept_no = Departments.dept_no;

--5
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Department_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Department_Emp
JOIN Employees
	ON Department_Emp.emp_no = Employees.emp_no
JOIN Departments
	ON Department_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name LIKE 'Sales';

--7
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Department_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Department_Emp
JOIN Employees
	ON Department_Emp.emp_no = Employees.emp_no
JOIN Departments
	ON Department_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name LIKE 'Sales' OR Departments.dept_name LIKE 'Development';

--8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS Frequency
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;