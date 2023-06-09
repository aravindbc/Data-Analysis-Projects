-- 1. Create a view to see the balace for each client. Clients balance, client id, name, balance
USE sql_invoicing;
CREATE VIEW clients_balance AS
SELECT
	c.client_id,
	c.name,
	SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name;