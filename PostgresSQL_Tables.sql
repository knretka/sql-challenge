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
