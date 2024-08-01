
--1
ALTER TABLE employees
ADD (MAX_SALARY NUMBER(7,2));

UPDATE employees SET MAX_SALARY = (SELECT MAX(salary) FROM employees);

DELETE FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);

--2
CREATE INDEX DPR_NAME_IDX ON employees(salary);

ALTER TABLE employees 
ADD CONSTRAINT CNSTR_SALARY CHECK (salary >= 1000 and salary <= 100000);

DROP INDEX DPR_NAME_IDX;

ALTER TABLE employees ENABLE CONSTRAINT CNSTR_SALARY;
ALTER TABLE employees DISABLE CONSTRAINT CNSTR_SALARY;
ALTER TABLE employees DROP CONSTRAINT CNSTR_SALARY;

--3
CREATE TABLE emp AS SELECT DISTINCT department_id FROM employees;

ALTER TABLE emp
ADD (department_name VARCHAR(100));

UPDATE emp SET department_name = (
SELECT department_name FROM departments 
WHERE emp.department_id = departments.department_id
);

MERGE INTO emp e
USING (SELECT department_id, department_name FROM departments) d
ON (e.department_id = d.department_id)
WHEN MATCHED THEN
UPDATE SET
e.department_name = d.department_name
WHEN NOT MATCHED THEN
INSERT VALUES (d.department_id, d.department_name);

DROP TABLE emp;


--4
WITH
emp_s AS (
    SELECT e.first_name, e.last_name, e.job_id, e.department_id 
    FROM employees e
    JOIN jobs j ON e.job_id = j.job_id
    WHERE j.job_title LIKE 'S%'),
job_details AS (
    SELECT job_title, min_salary, max_salary, job_id FROM jobs),
dep AS (
    SELECT department_name, department_id FROM departments)
SELECT 
    emp_s.first_name || ' ' || emp_s.last_name AS full_name, 
    job_details.job_title,
    job_details.min_salary, 
    job_details.max_salary,
    dep.department_name
FROM emp_s
JOIN job_details ON job_details.job_id = emp_s.job_id
JOIN dep ON emp_s.department_id = dep.department_id;



