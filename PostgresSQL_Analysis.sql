
-- -- -- -- -- -- -- [PART 1]  
--List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT * FROM employees;


-- -- -- -- -- -- -- [PART 2] 
-- List first name, last name, and hire date for employees who were hired in 1986
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;


-- -- -- -- -- -- -- [PART 3] 
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT * FROM departments;
SELECT * FROM dept_manager; 
SELECT * FROM employees; 

SELECT employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name,
employees.hire_date
FROM employees 
INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no;

SELECT employees.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, 
employees.first_name,employees.hire_date
FROM employees INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no;

-- -- -- -- -- -- -- [PART 5]
-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name LIKE 'Hercules' 
AND last_name LIKE 'B%';

-- -- -- -- -- -- -- [PART 6]
-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


-- -- -- -- -- -- -- [PART 7]
-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';


-- -- -- -- -- -- -- [PART 8]
-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
-- Learned how to change the name of the column from Anthony

SELECT last_name AS "LAST NAME",
COUNT(last_name) AS "FREQUENCY COUNT OF EMPLOYEE LAST NAMES"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
