SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;

CREATE TABLE "employees"(
	"emp_no" int NOT NULL,
	"emp_title" VARCHAR (30) NOT NULL,
	"birth_date" DATE NOT NULL,
	"first_name" VARCHAR (30) NOT NULL,
	"last_name" VARCHAR (30) NOT NULL,
	"sex" VARCHAR NOT NULL,
	"hire_date" DATE NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY(
		"emp_no"
	)
);

CREATE TABLE "departments" (
     "dept_no" VARCHAR(30)   NOT NULL,
     "dept_name" varchar(30)   NOT NULL,
     CONSTRAINT "pk_departments" PRIMARY KEY (
         "dept_no"
	)
);

CREATE TABLE "salaries" (
     "emp_no" int   NOT NULL,
     "salary" int   NOT NULL
);


CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" varchar(30)   NOT NULL
);

CREATE TABLE "dept_employee" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" int   NOT NULL
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

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
