use classicmodels;
/*Find the total amount to be paid for an order by the customer.*/
SELECT C.customerNumber, O.orderNumber, SUM(OD.priceEach *
OD.quantityOrdered)
FROM customers C
LEFT OUTER JOIN orders O
ON C.customerNumber = O.customerNumber
INNER JOIN orderdetails OD
ON O.orderNumber = OD.orderNumber GROUP BY OD.orderNumber;