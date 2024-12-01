# WINDOW FUNCTIONS----

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS DM 
JOIN Employee_salary AS SL
     ON DM.employee_id = SL.employee_id
GROUP BY gender;

SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS DM 
JOIN Employee_salary AS SL
     ON DM.employee_id = SL.employee_id
;


SELECT DM.first_name, DM.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS DM 
JOIN Employee_salary AS SL
     ON DM.employee_id = SL.employee_id
;