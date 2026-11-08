CREATE DATABASE HR_Analytics;

USE HR_Analytics;


USE HR_Analytics;

SELECT *
FROM employees;

SHOW DATABASES;

USE HR_Analytics;

SHOW TABLES;

USE HR_Analytics;

SHOW TABLES;

SELECT COUNT(*) AS Total_Employees
FROM employees;

SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR_Analytics'
AND TABLE_NAME = 'employees';

DESCRIBE employees;

SELECT *
FROM employees
LIMIT 10;

-- Total number of employees
SELECT COUNT(*) AS Total_Employees
FROM employees; 

-- How many employees left the company?
SELECT
Attrition,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY Attrition;

-- Calculate the attrition rate 
SELECT
ROUND(
    (COUNT(CASE WHEN Attrition = 'Yes'
    THEN 1 END) * 100.0) / COUNT(*),
    2
) AS Attrition_Rate
FROM employees;

-- Department-wise employee distribution
SELECT
Department,
COUNT(*) AS Total_Employees
FROM employees
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Which department has the highest attrition?
SELECT
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes'
THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY Department
ORDER BY Employees_Left DESC;

-- Gender-wise attrition
SELECT
Gender,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes'
THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY Gender;

-- Average monthly income by department
SELECT
Department,
ROUND(AVG(MonthlyIncome), 2)
AS Average_Monthly_Income
FROM employees
GROUP BY Department;

-- Overtime and attrition analysis
SELECT
OverTime,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes'
THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY OverTime;

-- Attrition by job role
SELECT
JobRole,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes'
THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY JobRole
ORDER BY Employees_Left DESC;



-- Age group analysis
SELECT
CASE
    WHEN ï»¿Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN ï»¿Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN ï»¿Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN ï»¿Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS ï»¿Age_Group,

COUNT(*) AS Total_Employees,

SUM(CASE WHEN Attrition = 'Yes'
THEN 1 ELSE 0 END) AS Employees_Left

FROM employees
GROUP BY ï»¿Age_Group
ORDER BY ï»¿Age_Group;

-- Attrition by Job Satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Attrition by Marital Status
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM employees
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;

-- Attrition by Business Travel
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM employees
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;

-- Employees Having Less Than 5 Years of Experience
SELECT
    EmployeeNumber,
    EmployeeName,
    Department,
    JobRole,
    YearsAtCompany
FROM employees
WHERE YearsAtCompany < 5
ORDER BY YearsAtCompany;

SELECT
    COUNT(*) AS Employees_Less_Than_5_Years
FROM employees
WHERE YearsAtCompany < 5;

-- Average Salary by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlyIncome), 2)
        AS Average_Monthly_Salary
FROM employees
GROUP BY Gender;