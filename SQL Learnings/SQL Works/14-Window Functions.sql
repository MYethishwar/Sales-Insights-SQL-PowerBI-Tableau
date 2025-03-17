CREATE DATABASE window_funcs;
use window_funcs;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
select * from employees;

----- Window Fucs OVER() -----
SELECT department, SUM(salary) OVER(),
AVG(salary) OVER(),
MIN(salary) OVER(),
COUNT(salary) OVER() FROM employees;

----- Window Funcs PARTITION BY -----
SELECT department, salary,
AVG(salary) OVER(PARTITION BY department) AS avg_salary_dpmt,
SUM(salary) OVER(PARTITION BY department) AS total_payroll,
COUNT(salary) OVER(PARTITION BY department) AS count_of_emps_in_each_depmt FROM employees;

----- ORDER BY -----
SELECT department, salary,
SUM(salary) OVER(PARTITION BY department ORDER BY salary ) AS rolling_sum,
SUM(salary) OVER(PARTITION BY department) AS sum_total_by_dpmt
FROM employees;

----- RABK() -----
SELECT department, salary,
RANK() OVER(ORDER BY salary) AS OVERALL_RANKING,
DENSE_RANK() OVER(ORDER BY salary) AS Dense_ranking,
ROW_NUMBER() OVER(ORDER BY salary) AS Row_numbering
FROM employees ;

----- NTILE() -----
SELECT department, salary,
NTILE(3) OVER( ORDER BY salary) AS binnung_by_salary,
NTILE(3) OVER(PARTITION BY department ORDER BY salary) AS binning_by_deptmnt
FROM employees;

----- FIRST_VALUE -----
SELECT department, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary) AS first_value_deptmnt,
LAST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary) AS last_value_deptmt
FROM employees;

----- LEAD & LAG -----
SELECT department, salary,
LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS first_value_deptmnt,
LEAD(salary) OVER(PARTITION BY department ORDER BY salary) AS first_value_deptmnt
FROM employees;