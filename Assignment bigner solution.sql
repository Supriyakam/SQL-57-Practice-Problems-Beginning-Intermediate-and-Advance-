-- 1.  Which shippers do we have? 

Select*
from shippers;

-- 2. Certain fields from Categories. CategoryName and Description

Select
Category_Name,
Description
from categories;

-- 3. We’d like to see just the FirstName, LastName, and HireDate of all the
-- employees with the Title of Sales Representative. Write a SQL
-- statement that returns only those employees.

select
first_name,
last_name,
hire_date
from employees
where title = 'Sales Representative';


-- 5. Orders placed by specific EmployeeID
-- Show all the orders placed by a specific employee. The EmployeeID for
-- this Employee (Steven Buchanan) is 5

select
order_id,
order_date
from orders
where employee_id = 5;

-- 6.  Suppliers and ContactTitles
-- In the Suppliers table, show the SupplierID, ContactName, and
-- ContactTitle for those Suppliers whose ContactTitle is not Marketing
-- Manager

select
Supplier_ID, 
Contact_Name,
Contact_Title
from Suppliers
where Contact_Title != 'Marketing Manager';


-- 7. Products with “queso” in ProductName
-- In the products table, we’d like to see the ProductID and ProductName
-- for those products where the ProductName includes the string “queso”

select
Product_ID,
Product_Name
from products
where Product_Name like '%queso%';

-- 8. Orders shipping to France or Belgium
-- Looking at the Orders table, there’s a field called ShipCountry. Write a
-- query that shows the OrderID, CustomerID, and ShipCountry for the
-- orders where the ShipCountry is either France or Belgium

select
Order_ID, Customer_ID, Ship_Country
from orders
where ship_country = 'france' 
or ship_country ='Belgium';


-- 9.  Orders shipping to any country in Latin America Now, instead of just wanting to return all the orders from France of 
-- Belgium, we want to show all the orders from any Latin American country. But we don’t have a list of Latin American countries in a table
-- in the Northwind database. So, we’re going to just use this list of Latin American countries that happen to be in the Orders table:
-- Brazil Mexico Argentina Venezuela
-- It doesn’t make sense to use multiple Or statements anymore, it would
-- get too convoluted. Use the In statement.

select
Order_ID, Customer_ID, Ship_Country
from orders
where ship_country in ('Brazil', 'Mexico' ,'Argentina', 'Venezuela');

-- 10. Employees, in order of age
-- For all the employees in the Employees table, show the FirstName,
-- LastName, Title, and BirthDate. Order the results by BirthDate, so we
-- have the oldest employees first

Select
birth_date,
first_name,
last_name,
title
from employees
order by birth_date Asc;


-- 11. Showing only the Date with a DateTime field
-- In the output of the query above, showing the Employees in order of
-- BirthDate, we see the time of the BirthDate field, which we don’t want.
-- Show only the date portion of the BirthDate field

Select
first_name,
last_name,
title,
birth_date DateOnlyBirthDate
from employees
order by birth_date Asc;

-- 12. Employees full name
-- Show the FirstName and LastName columns from the Employees table,
-- and then create a new column called FullName, showing FirstName and
-- LastName joined together in one column, with a space in-between

select
first_name FirstName,
last_name LastName,
Concat (First_name, ' ' , Last_name) as FullName
from employees;



-- 13. OrderDetails amount per line item
-- In the OrderDetails table, we have the fields UnitPrice and Quantity.
-- Create a new field, TotalPrice, that multiplies these two together. We’ll
-- ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and Quantity.
-- Order by OrderID and ProductID

select
Order_id,
product_id,
Unit_Price, 
Quantity,
(unit_price * quantity) as TotalPrice
from order_details
order by Order_id,product_id;

-- 14. How many customers?
-- How many customers do we have in the Customers table? Show one
-- value only, and don’t rely on getting the recordcount at the end of a
-- resultset.

select
count(*) as Totalcustomer 
from customers;


select
count(customer_id) as Totalcustomer 
from customers;

-- 15. When was the first order?
-- Show the date of the first order ever made in the Orders table.

select 
min(order_date) as FirstOrder 
from orders;

-- 16. Countries where there are customers
-- Show a list of countries where the Northwind company has customers

select
country
from customers
group by country
ORDER BY country;

-- 17. Contact titles for customers
-- Show a list of all the different values in the Customers table for
-- ContactTitles. Also include a count for each ContactTitle.
-- This is similar in concept to the previous question “Countries where
-- there are customers”
-- , except we now want a count for each ContactTitle

select
contact_title,
count(contact_title) as TotalContactTitle
from customers
group by contact_title
order by TotalContactTitle desc;


-- 18. Products with associated supplier names
-- We’d like to show, for each product, the associated Supplier. Show the
-- ProductID, ProductName, and the CompanyName of the Supplier. Sort
-- by ProductID.
-- This question will introduce what may be a new concept, the Join clause
-- in SQL. The Join clause is used to join two or more relational database
-- tables together in a logical way.
-- Here’s a data model of the relationship between Products and Suppliers

Select
A.Product_id,
A.Product_Name,
B.company_name
From Products as A
inner Join suppliers as B
ON A.supplier_id=B.supplier_id;


Select
A.order_id,
A.order_date,
B.company_name
From orders as A
left Join shippers as B
ON A.ship_via=B.shipper_id
where order_id < 10300;




	

