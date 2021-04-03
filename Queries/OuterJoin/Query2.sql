use classicmodels;
/*What is the percentage value of each product in the inventory as a percentage of the quantity in
stock for the product line to which it belongs?*/
SELECT P.productCode, P.quantityInStock * 100.00 / Q.total,
P.productLine
FROM products P
LEFT OUTER JOIN (SELECT SUM(quantityInStock) AS total, productLine
FROM products GROUP BY productLine) Q
ON P.productLine = Q.productLine;