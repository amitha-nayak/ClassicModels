CREATE DEFINER=`root`@`localhost` TRIGGER `orderdetails_AFTER_INSERT` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
	declare max_quantity int;
    declare msg varchar(128);
	SELECT quantityInStock into max_quantity FROM products WHERE
	productCode=new.productCode;
	IF max_quantity<new.quantityOrdered then
		set msg = concat('orderdetails_BEFORE_INSERT: Quantity
		Exceeds Available Stock', cast(new.orderNumber as char));
		signal sqlstate '45000' set message_text = msg;
	end IF;
UPDATE products
SET quantityInStock = quantityInStock - new.quantityOrdered
WHERE productCode = new.productCode;
END