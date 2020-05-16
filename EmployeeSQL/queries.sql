--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
    JOIN salaries s
    ON e.emp_no = s.emp_no;

--2.List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date 
	BETWEEN '1986-01-01'
	AND '1986-12-31';

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.

--SELECT * FROM dept_manager
SELECT m.dept_no, d.dept_name, e.last_name, e.first_name, m.emp_no, m.from_date, m.to_date
FROM dept_manager m
    JOIN departments d
    ON m.dept_no = d.dept_no
    JOIN employees e
    ON m.emp_no = e.emp_no;

--4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.last_name, e.first_name, d.emp_no, dp.dept_name
FROM employees e
    JOIN dept_emp d
    ON e.emp_no = d.emp_no
    JOIN departments dp
    ON d.dept_no = dp.dept_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.last_name, e.first_name, d.emp_no, dp.dept_name
FROM employees e
    JOIN dept_emp d
    ON e.emp_no = d.emp_no
    JOIN departments dp
    ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.last_name, e.first_name, d.emp_no, dp.dept_name
FROM employees e
    JOIN dept_emp d
    ON e.emp_no = d.emp_no
    JOIN departments dp
    ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales'
    OR dp.dept_name = 'Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT first_name, count(last_name) AS "count employee last names"
FROM employees
GROUP BY first_name
ORDER BY "count employee last names" DESC;

