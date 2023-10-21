--List the employee number, last name, first name, sex, and salary of each employee

SELECT "Employees"."Emp_No", "Employees"."Last_Name", "Employees"."First_Name", "Employees"."Sex", "Salaries"."Salary"
FROM "Employees"

JOIN "Salaries"
ON "Employees"."Emp_No" = "Salaries"."Emp_No"; 


--List the first name, last name, and hire date for the employees who were hired in 1986
SHOW datestyle;

SELECT "First_Name", "Last_Name", "Hire_Date" FROM "Employees"
WHERE EXTRACT(YEAR FROM "Hire_Date") = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT "Departments"."Dept_No", "Departments"."Dept_Name", "Employees"."Emp_No", "Employees"."Last_Name", "Employees"."First_Name"
FROM "Departments"

JOIN "Dept_Manager"
ON "Departments"."Dept_No" = "Dept_Manager"."Dept_No"

JOIN "Employees"
ON "Dept_Manager"."Emp_No" = "Employees"."Emp_No";


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT "Employees"."Emp_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Dept_Name"
FROM "Employees"

JOIN "Dept_Emp"
ON "Employees"."Emp_No" = "Dept_Emp"."Emp_No"

JOIN "Departments"
ON "Dept_Emp"."Dept_No" = "Departments"."Dept_No";


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT "First_Name", "Last_Name", "Sex" FROM "Employees"
WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name
SELECT "Employees"."Emp_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Dept_Name"
FROM "Employees"

JOIN "Dept_Emp"
ON "Employees"."Emp_No" = "Dept_Emp"."Emp_No"

JOIN "Departments"
ON "Dept_Emp"."Dept_No" = "Departments"."Dept_No"

WHERE "Departments"."Dept_Name" = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT "Employees"."Emp_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Dept_Name"
FROM "Employees"

JOIN "Dept_Emp"
ON "Employees"."Emp_No" = "Dept_Emp"."Emp_No"

JOIN "Departments"
ON "Dept_Emp"."Dept_No" = "Departments"."Dept_No"

WHERE "Departments"."Dept_Name" = 'Sales' OR "Departments"."Dept_Name" = 'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT COUNT(*) FROM "Employees"
GROUP BY "Last_Name"
ORDER BY count DESC;