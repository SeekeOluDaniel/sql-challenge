-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/



CREATE TABLE "Titles" (
    "Title_ID" VARCHAR(5)   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);

CREATE TABLE "Employees" (
    "Emp_No" INTEGER   NOT NULL,
    "Emp_Title" VARCHAR   NOT NULL,
    "Birth_Date" DATE   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Departments" (
    "Dept_No" VARCHAR(4)   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" VARCHAR(4)   NOT NULL,
    "Emp_No" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "Dept_No","Emp_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" INTEGER   NOT NULL,
    "Dept_No" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "Emp_No","Dept_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title" FOREIGN KEY("Emp_Title")
REFERENCES "Titles" ("Title_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

