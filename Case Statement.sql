# Case statements

SELECT first_name,
last_name,
Age,
CASE
WHEN age <=30 then 'young'
WHEN age BETWEEN 31 and 50 then 'Old'
WHEN age >= 50 then "Oldest"
END AS Age_bracket
FROM employee_demographics;



# Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%


SELECT first_name, last_name, salary,
CASE
WHEN salary < 50000 THEN salary + (salary * 1.05)
WHEN salary > 50000 THEN salary + (salary * 1.07)
END AS New_Salary,
CASE
WHEN dept_id = 6 THEN salary * .10
END AS BONUS
FROM Employee_salary;



SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;

