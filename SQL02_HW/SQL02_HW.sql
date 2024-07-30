CREATE TABLE DEPARTMENTS (
    department_id NUMBER(7) NOT NULL PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id NUMBER(7),
    location_id NUMBER(7)
);

CREATE TABLE JOBS (
    job_id NUMBER(7) NOT NULL PRIMARY KEY,
    job_title VARCHAR(100),
    min_salary NUMBER(7,2),
    max_salary  NUMBER(7,2)
);

CREATE TABLE EMPLOYEES (
    employee_id NUMBER(7) NOT NULL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone_number NUMBER(10),
    hire_date DATE,
    job_id NUMBER(7),
    salary NUMBER(7,2),
    commision_pct NUMBER(7,2),
    manager_id NUMBER(7),
    department_id NUMBER(7),
    
    FOREIGN KEY (job_id) REFERENCES JOBS(job_id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);



DROP TABLE EMPLOYEES;
DROP TABLE DEPARTMENTS;

INSERT INTO JOBS VALUES (1, 'AD_PRES', 20000, 50000);
INSERT INTO JOBS VALUES (2, 'ST_MAN', 20000, 50000);
INSERT INTO JOBS VALUES (3, 'IT_PROG', 20000, 50000);
INSERT INTO JOBS VALUES (4, 'SA_REP', 20000, 50000);
INSERT INTO JOBS VALUES (5, 'ST_CLERK', 20000, 50000);
INSERT INTO JOBS VALUES (6, 'None of the above', 20000, 50000);

INSERT INTO DEPARTMENTS VALUES (1, 'financial affairs', 1, 1);
INSERT INTO DEPARTMENTS VALUES (2, 'human resources', 2, 1);
INSERT INTO DEPARTMENTS VALUES (3, 'software development', 3, 1);

--only insert statements was geenrated by chatGPT
INSERT INTO EMPLOYEES VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', 5464567890, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 1, 50000.00, 5.00, 10, 1);
INSERT INTO EMPLOYEES VALUES 
(2, 'Jane', 'Smith', 'jane.smith@example.com', 5465678901, TO_DATE('2022-02-16', 'YYYY-MM-DD'), 2, 55000.00, 6.00, 11, 2);
INSERT INTO EMPLOYEES VALUES 
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 5466789012, TO_DATE('2022-03-17', 'YYYY-MM-DD'), 3, 60000.00, 7.00, 12, 3);
INSERT INTO EMPLOYEES VALUES 
(4, 'Emily', 'Williams', 'emily.williams@example.com', 4567890123, TO_DATE('2022-04-18', 'YYYY-MM-DD'), 4, 65000.00, 8.00, 13, 1);
INSERT INTO EMPLOYEES VALUES 
(5, 'Daniel', 'Brown', 'daniel.brown@example.com', 4568901234, TO_DATE('2022-05-19', 'YYYY-MM-DD'), 5, 70000.00, 9.00, 14, 2);
INSERT INTO EMPLOYEES VALUES 
(6, 'Sophia', 'Jones', 'sophia.jones@example.com', 6789012345, TO_DATE('2022-06-20', 'YYYY-MM-DD'), 6, 75000.00, 10.00, 15, 3);
INSERT INTO EMPLOYEES VALUES 
(7, 'Matthew', 'Garcia', 'matthew.garcia@example.com', 7890123456, TO_DATE('2022-07-21', 'YYYY-MM-DD'), 1, 80000.00, 11.00, 16, 1);
INSERT INTO EMPLOYEES VALUES 
(8, 'Olivia', 'Martinez', 'olivia.martinez@example.com', 7891234567, TO_DATE('2022-08-22', 'YYYY-MM-DD'), 2, 85000.00, 12.00, 17, 2);
INSERT INTO EMPLOYEES VALUES 
(9, 'Christopher', 'Hernandez', 'christopher.hernandez@example.com', 9012345678, TO_DATE('2022-09-23', 'YYYY-MM-DD'), 3, 90000.00, 13.00, 18, 3);
INSERT INTO EMPLOYEES VALUES 
(10, 'Isabella', 'Lopez', 'isabella.lopez@example.com', 1234567809, TO_DATE('2022-10-24', 'YYYY-MM-DD'), 1, 95000.00, 14.00, 19, 1);

--1
SELECT employee_id, first_name, last_name, 
ROUND(MONTHS_BETWEEN(CURRENT_DATE, hire_date), 2)  AS months FROM employees;

--2
SELECT employee_id, first_name, last_name, 
DECODE(job_title, 
                'AD_PRES', 'A',
                'ST_MAN', 'B',
                'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
                'None of the above', '0'
) grade
FROM employees JOIN jobs ON employees.job_id = jobs.job_id;

--3
SELECT employee_id, first_name, last_name, 
CASE job_title
                WHEN 'AD_PRES' THEN 'A'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'SA_REP' THEN 'D'
                WHEN 'ST_CLERK' THEN 'E'
                WHEN 'None of the above' THEN '0'
ELSE job_title END grade
FROM employees JOIN jobs ON employees.job_id = jobs.job_id;

--4
SELECT e1.last_name, e1.phone_number FROM employees e1
WHERE EXISTS(SELECT last_name, department_id FROM employees e2
            WHERE e1.department_id = e2.department_id 
            AND e2.last_name LIKE '%i%');
            
--5
CREATE TABLE MY_EMP_TABLE (
    emp_id NUMBER(7) NOT NULL PRIMARY KEY,
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    salary NUMBER(7,2)
);

INSERT INTO my_emp_table VALUES (1, 'Black', 'John', 1100);
INSERT INTO my_emp_table VALUES (2, 'White', 'Kent', 1300);
INSERT INTO my_emp_table VALUES (3, 'Orange', 'David', 1700);
INSERT INTO my_emp_table VALUES (4, 'Pink', 'Alissa', 1900);

SELECT * FROM my_emp_table;

UPDATE my_emp_table SET salary = (salary * 1.10);
DELETE FROM my_emp_table WHERE first_name = 'David';

SELECT * FROM my_emp_table;

TRUNCATE TABLE my_emp_table;

