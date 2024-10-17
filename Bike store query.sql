--aggregate function
--type
--reserver function like concat
--joins
--keys

use [Bike Store]
Go

select * from production.brands;
select * from [production].[categories];
select * from [production].[products];
select * from [production].[stocks];
select * from [sales].[customers];
select * from [sales].[order_items];
select * from [sales].[orders];
select * from [sales].[staffs];
select * from [sales].[stores];

--To join many tables data together using join
select 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) AS 'Customers',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) AS 'Total Units',
	sum(ite.quantity * ite.list_price) AS 'Revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ' ,sta.last_name) AS 'Sales Rep'
FROM  [sales].[orders] ord
JOIN [sales].[customers] cus
On ord.customer_id=cus.customer_id
JOIN [sales].[order_items] ite
ON ord.order_id=ite.order_id
JOIN [production].[products] pro
ON ite.product_id=pro.product_id
JOIN [production].[categories] cat
ON pro.category_id=cat.category_id
JOIN [sales].[stores] sto
On ord.store_id=sto.store_id
JOIN [sales].[staffs] sta
On ord.staff_id=sta.staff_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	pro.product_name,
	ord.order_date,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ' ,sta.last_name)