CREATE DEFINER=`root`@`localhost` TRIGGER `payments_AFTER_INSERT` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
	DECLARE regular_factor int(3);
	DECLARE amt decimal(10,2);
	DECLARE msg varchar(50);
	SELECT COUNT(customerNumber) INTO regular_factor FROM payments WHERE
	customerNumber=new.customerNumber;
	SELECT SUM(amount) INTO amt FROM payments WHERE
	customerNumber=new.customerNumber;
	IF regular_factor>3 and amt>=50000.00 THEN
	/* is a priced customer */
		IF new.amount > 10000 THEN
			update customers
			SET creditLimit = creditLimit + 5000.00
			WHERE customerNumber=new.customerNumber;
		END IF;
	END IF;
END