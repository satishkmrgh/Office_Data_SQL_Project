-- WHERE CLAUSE

SELECT *
FROM Employee_salary
WHERE first_name = 'leslie'
;

SELECT *
FROM Employee_salary
WHERE salary <= 50000
;


SELECT *
FROM employee_demographics
WHERE gender != 'female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-03-04'
;

#---- AND OR NOT --- logical Operators

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-03-04'
AND gender = 'male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-03-04'
or gender = 'male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-03-04'
OR NOT gender = 'male'
;

SELECT *
FROM employee_demographics
WHERE (first_name = "leslie" AND age = 44) or age > 55
;


#---- Like Statement  ---- 
-- % and _

SELECT *
FROM employee_demographics
WHERE first_name = 'jerry'
;

SELECT *
FROM employee_demographics
WHERE first_name like '%rry%'
;

SELECT *
FROM employee_demographics
WHERE birth_date like '1998'
;

# Group By-----

SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

___# ORDER BY

SELECT *
FROM Employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM Employee_demographics
ORDER BY gender;

SELECT *
FROM Employee_demographics
ORDER BY gender, age
;

SELECT *
FROM Employee_demographics
ORDER BY gender, age 
;

#---HAVING VS WHERE

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
group by occupation
Having AVG(salary) > 75000
;

#--- LIMIT & Aliasing

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

#-- Aliasing 

SELECT gender, AVG(age) As  avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

#-- JOINS

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
;
#--OUTER JOINS

SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
;

# === SELF JOIN
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
  ON emp1.employee_id = emp2.employee_id
;


SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
  ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_Santa,
emp1.last_name AS last_name_Santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
  ON emp1.employee_id + 1 = emp2.employee_id
;


# JOINING MULTIPLE TABLES TOGETHER--

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
INNER JOIN Parks_departments AS pd
  ON sal.dept_id = pd.department_id
  ;

SELECT *
FROM Parks_departments;


#---UNIONS

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;



SELECT first_name, last_name, 'old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'old lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'highly paid Employe' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, Last_name
;


