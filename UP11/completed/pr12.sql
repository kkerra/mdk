CREATE VIEW current_years_orders
AS 
SELECT order_id, date_time_order, customer.customer_id, login, surname, name
FROM customer
JOIN `order` ON customer.customer_id = `order`.customer_id
WHERE YEAR(date_time_order) = 2025