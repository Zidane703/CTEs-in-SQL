-- In SQL, CTEs stand for Common Table Expressions.
-- CTEs are temporary named result sets that you define within a single SQL statement. They act like temporary tables that exist only for the duration of that specific query.


WITH CTE_EXAMPLE AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_salary, MIN(salary) min_salary, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) 
FROM CTE_EXAMPLE;

--- __________________________________________________________________________________________________________ --- 

WITH CTE_EXAMPLE (Gender, AVG_Sal, Max_Sal, Min_Sal, Count_Sal)AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_salary, MIN(salary) min_salary, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM CTE_EXAMPLE;


--- __________________________________________________________________________________________________________ --- 


WITH CTE_EXAMPLE AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
),
CTE_EXAMPLE2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary> '5000'
)
SELECT *
FROM CTE_EXAMPLE
JOIN CTE_EXAMPLE2
	ON CTE_EXAMPLE.employee_id = CTE_EXAMPLE2.employee_id;













