SELECT
ord.order_id,
CONCAT(cus.first_name, ' ', cus.last_name) AS 'customer Name',
ord.order_date,
cus.state,
cus.city,
SUM(ite.quantity) AS 'sales volume',
SUM(ite.quantity * ite.list_price) AS 'Revenue',
pro.product_name,
cat.category_name,
bra.brand_name,
sto.store_name,
CONCAT (sta.first_name, ' ', sta.last_name) AS 'sales Rep'
from sales.orders AS ord
join sales.customers AS cus
ON cus.customer_id = ord.customer_id
join sales.order_items as ite
ON ord.order_id = ite.order_id
Join production.products pro
ON pro.product_id = ite.product_id
join production.categories cat
ON pro.category_id = cat.category_id
join production.brands bra
on pro.brand_id = bra.brand_id
join sales.stores sto
ON sto.store_id = ord.store_id
join sales.staffs sta
ON sta.staff_id = ord.staff_id
GROUP BY
ord.order_id,
CONCAT(cus.first_name, ' ', cus.last_name),
ord.order_date,
cus.state,
cus.city,
pro.product_name,
cat.category_name,
bra.brand_name,
sto.store_name,
CONCAT (sta.first_name, ' ', sta.last_name)