use classicmodels;
/*List the employees who report to those employees who report to Diane Murphy.*/
SELECT employeeNumber FROM employees WHERE reportsTo IN (SELECT
employeeNumber FROM employees WHERE reportsTo=(SELECT employeeNumber
FROM employees WHERE firstName='Diane' and lastName='Murphy'));