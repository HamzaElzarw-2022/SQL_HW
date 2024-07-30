CREATE TABLE DEPARTMENTS (
    department_id NUMBER(7) NOT NULL PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id NUMBER(7),
    location_id NUMBER(7)
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
    
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);

DROP TABLE EMPLOYEES;
DROP TABLE DEPARTMENTS;

INSERT INTO DEPARTMENTS VALUES (1, 'financial affairs', 1, 1);
INSERT INTO DEPARTMENTS VALUES (2, 'human resources', 2, 1);
INSERT INTO DEPARTMENTS VALUES (3, 'software development', 3, 1);

--only insert statements was geenrated by chatGPT
INSERT INTO EMPLOYEES VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', 5464567890, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 101, 50000.00, 5.00, 10, 1);
INSERT INTO EMPLOYEES VALUES 
(2, 'Jane', 'Smith', 'jane.smith@example.com', 5465678901, TO_DATE('2022-02-16', 'YYYY-MM-DD'), 102, 55000.00, 6.00, 11, 2);
INSERT INTO EMPLOYEES VALUES 
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 5466789012, TO_DATE('2022-03-17', 'YYYY-MM-DD'), 103, 60000.00, 7.00, 12, 3);
INSERT INTO EMPLOYEES VALUES 
(4, 'Emily', 'Williams', 'emily.williams@example.com', 4567890123, TO_DATE('2022-04-18', 'YYYY-MM-DD'), 104, 65000.00, 8.00, 13, 1);
INSERT INTO EMPLOYEES VALUES 
(5, 'Daniel', 'Brown', 'daniel.brown@example.com', 4568901234, TO_DATE('2022-05-19', 'YYYY-MM-DD'), 105, 70000.00, 9.00, 14, 2);
INSERT INTO EMPLOYEES VALUES 
(6, 'Sophia', 'Jones', 'sophia.jones@example.com', 6789012345, TO_DATE('2022-06-20', 'YYYY-MM-DD'), 106, 75000.00, 10.00, 15, 3);
INSERT INTO EMPLOYEES VALUES 
(7, 'Matthew', 'Garcia', 'matthew.garcia@example.com', 7890123456, TO_DATE('2022-07-21', 'YYYY-MM-DD'), 107, 80000.00, 11.00, 16, 1);
INSERT INTO EMPLOYEES VALUES 
(8, 'Olivia', 'Martinez', 'olivia.martinez@example.com', 7891234567, TO_DATE('2022-08-22', 'YYYY-MM-DD'), 108, 85000.00, 12.00, 17, 2);
INSERT INTO EMPLOYEES VALUES 
(9, 'Christopher', 'Hernandez', 'christopher.hernandez@example.com', 9012345678, TO_DATE('2022-09-23', 'YYYY-MM-DD'), 109, 90000.00, 13.00, 18, 3);
INSERT INTO EMPLOYEES VALUES 
(10, 'Isabella', 'Lopez', 'isabella.lopez@example.com', 1234567809, TO_DATE('2022-10-24', 'YYYY-MM-DD'), 110, 95000.00, 14.00, 19, 1);


--Q1
SELECT employee_id, first_name, department_name 
FROM employees 
JOIN DEPARTMENTS ON employees.department_id = DEPARTMENTS.department_id;

--2
SELECT employee_id, manager_id FROM employees;

--3
SELECT operator , COUNT(operator) 
FROM (SELECT SUBSTR(phone_number,1,3) AS operator FROM employees) 
GROUP BY operator;


--4
CREATE TABLE emp AS SELECT * FROM employees WHERE employee_id = null;

INSERT INTO emp VALUES 
(1, 'hamza', 'elzarw', 'test@i2i.com', 6235767209, TO_DATE('2022-10-24', 'YYYY-MM-DD'), 1, 950, 1, 1, 1);
SELECT  * FROM emp;

UPDATE emp SET phone_number=1234567890 , salary=100 WHERE employee_id=1;
SELECT * FROM emp;

DELETE FROM emp where employee_id=1;
SELECT * FROM emp;

DROP TABLE emp;

--5
SELECT 
SUBSTR(first_name, 1, 2) || LPAD('*', LENGTH(first_name) - 2, '*') || ' ' || 
SUBSTR(last_name, 1, 2) || LPAD('*', LENGTH(first_name) - 2, '*') AS name 
FROM employees;
