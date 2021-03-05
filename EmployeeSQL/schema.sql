-- DATA ENGINEERING
-- ------------------------------------------------------------------------------------
-- SQL:		Employee Database: A Mystery in Two Parts
-- AUTHOR:  TANIA ANGELINA ROSAS ORTIZ
-- DATE:    MARCH 6, 2021
-- SCHEMA:	db_schema.png
-- ------------------------------------------------------------------------------------

-- Drop tables if existing
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


-- departments table
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
  	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

-- titles table
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
  	title VARCHAR,
	PRIMARY KEY (title_id)
);

-- employees table
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
  	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

-- salaries table
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
  	salary INTEGER,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
  	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- dept_emp table
CREATE TABLE dept_emp (
  	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

-- Query each table confirming data
SELECT 'departments' as t, count(*) FROM departments
union
SELECT 'dept_emp' as t, count(*)  FROM dept_emp
union
SELECT 'dept_manager' as t, count(*)  FROM dept_manager
union
SELECT 'employees' as t, count(*)  FROM employees
union
SELECT 'salaries' as t, count(*)  FROM salaries
union
SELECT 'titles' as t, count(*)  FROM titles;