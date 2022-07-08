-- 20 

select
A.category_name,
count(B.product_name) as total_number_of_product
from categories as A
left join products as B
on A.category_id = B.category_id
group by A.category_name
order by total_number_of_product desc;

-- 21

select
country,
city,
count(customer_id) Totalcustomer
from customers
group by country , city 
order by Totalcustomer desc;

-- 22

select 
Product_id,
product_name,
units_in_stock,
reorder_level
from products
where units_in_stock < reorder_level;

-- 23

select 
Product_id,
product_name,
units_in_stock,
units_on_order,
reorder_level,
discontinued
from products
where units_in_stock + units_on_order <= reorder_level
and discontinued = 0;

-- 24

select
customer_id,
company_name,
region
from customers
order by case when region IS NULL then 1
   else 0
   end, region asc;
   
   
-- 25   

select
Ship_country,
avg(freight) 
from orders
group by Ship_country
Order by avg(freight) desc
limit 3;

-- 26 
   
select
Ship_country,
avg(freight)
from orders
where Order_Date between '1997-1-1' and '1997-12-31'
group by Ship_country
Order by avg(freight) desc
limit 3;

-- 27

select
Ship_country,
avg(freight)
from orders
where Order_Date between '1996-12-31' and '1998-01-01'
group by Ship_country
Order by avg(freight) desc
limit 3;

-- 28 

select
Ship_country,
avg(freight),
Max(order_date)
from orders
group by Ship_country
Order by avg(freight) desc
limit 3;


-- 29
-- OrderID , Productname , Qunatity , employement ID , last name

select
A.first_name,
A.employee_id,
B.order_id,
D.product_name,
C.quantity
from employees as A
inner join orders as B
on A.employee_id = B.employee_id
inner join order_details as C
on B.order_id = C.order_id
inner join products as D
on C.product_id = D.product_id;

-- 30

Select
Customers.Customer_ID as Customers_Customer_ID,
Orders.Customer_ID as Orders_Customer_ID
From Customers
left join Orders
on Orders.Customer_ID = Customers.Customer_ID
Where
Orders.Customer_ID is null;

-- 31

Select
Customers.Customer_ID as Customers_Customer_ID,
Orders.Customer_ID as Orders_Customer_ID,
Orders.Employee_ID
From Customers
left join orders
on Orders.Customer_ID = Customers.Customer_ID
where Orders.customer_id in (select
customer_id
from orders
where employee_id = 4);





Select
Customers.Customer_ID as Customers_Customer_ID,
Orders.Customer_ID as Orders_Customer_ID
From Customers
where 
Customers.Customer_ID  not in (select distinct(customer_ID) from customers where Employee_ID = 4) and  
customerscustomerscustomersOrders.Employee_ID = 4







