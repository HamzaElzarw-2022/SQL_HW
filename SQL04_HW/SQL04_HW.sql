
--1
SELECT department_id, LISTAGG(first_name || ' ' || last_name, '; ') 
WITHIN GROUP (ORDER BY department_id) AS SONUC
FROM employees
GROUP BY department_id;


--2
SELECT first_name, last_name, salary, job_id,
    LAG(salary) OVER (PARTITION BY e.job_id ORDER BY e.hire_date)
    + LEAD(salary) OVER (PARTITION BY e.job_id ORDER BY e.hire_date) 
    AS prev_after_salary_total 
    FROM employees e;


--3
SELECT e.*, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_order
FROM employees e 
WHERE NOT salary = (SELECT MIN(salary) FROM employees);


--4
SELECT e.*, ROW_NUMBER() OVER (ORDER BY hire_date ASC) AS hire_order
FROM employees e;


--5
SELECT first_name, last_name, salary,
    LAG(salary) OVER (ORDER BY hire_date) AS previous_salary,
    LEAD(salary) OVER (ORDER BY hire_date) AS next_salary
    FROM employees;


