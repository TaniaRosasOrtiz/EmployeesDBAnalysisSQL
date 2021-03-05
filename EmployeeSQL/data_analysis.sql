-- DATA ANALYSIS
-- ------------------------------------------------------------------------------------
-- SQL:		Employee Database: A Mystery in Two Parts
-- AUTHOR:  TANIA ANGELINA ROSAS ORTIZ
-- DATE:    MARCH 6, 2021
-- ------------------------------------------------------------------------------------

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no; 

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name as "First Name", e.last_name as "Last Name", e.hire_date as "Hire Date"
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT d.dept_no as "Department Number", d.dept_name as "Department Name",
	dm.emp_no as "Employee Number of Manager",
	e.last_name as "Last Name", e.first_name as "First Name"
FROM departments d
JOIN dept_manager dm
ON dm.dept_no = d.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.
SELECT de.emp_no as "Employee Number", 
	e.last_name as "Last Name", e.first_name as "First Name", 
	d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d
ON de.dept_no = d.dept_no
JOIN employees e
ON de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name as "First Name", e.last_name as "Last Name", e.sex as "Sex"
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no as "Employee Number", 
	e.last_name as "Last Name", e.first_name as "First Name", 
	d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d
ON de.dept_no = d.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no as "Employee Number", 
	e.last_name as "Last Name", e.first_name as "First Name", 
	d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d
ON de.dept_no = d.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name as "Last Name", COUNT(*) as "Frequency"
FROM employees e
GROUP BY 1 
ORDER BY 2 DESC;

-- BONUS: average salary by title
SELECT s.salary, t.title
FROM titles t
JOIN employees e
ON t.title_id = e.emp_title_id
JOIN salaries s
ON e.emp_no = s.emp_no;

-- EPILOGUE:
SELECT e.*, t.title, s.salary FROM employees e
JOIN titles t
ON t.title_id = e.emp_title_id
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.emp_no=499942
-- Very Funny :) April Foolsday 
-- THIS DB IS COMPLETLY WRONG, I AM WAY YOUNGER THAN THE RECORD INDICATES
