-- 1. Create a stored procedure called get invoices with balance to return all the invoices with a balance > 0
DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT *
	FROM invoices_with_balance
	WHERE balance > 0;
	END$$
DELIMITER ;