use classicmodels;
/*Find the customer who spends the most.*/
SET @max:=(SELECT MAX(C.total_amt) FROM (SELECT customerNumber,
SUM(amount) AS total_amt FROM payments GROUP BY customerNumber) C);
SELECT C.customerNumber, C.amount FROM (SELECT customerNumber,
SUM(amount) as amount FROM payments GROUP BY customerNumber) C WHERE
amount = @max;