use classicmodels;
/*Find out if each customer has an unique phone number*/
SET @dupli_num := (SELECT phone
FROM customers GROUP BY phone HAVING COUNT(phone) > 1);
SELECT customerNumber, contactLastName, contactFirstName, phone FROM
customers WHERE phone = @dupli_num;