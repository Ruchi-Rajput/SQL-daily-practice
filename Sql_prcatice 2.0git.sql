# First topic is joins :-
create database joins_1;
use joins_1;
show tables;
-- 1 get the list of customers who have placed at least one order, including their names and order details.
select * from customers_a join orders_a using (customer_id);

-- 2 get a list of all customers, including those who have never placed an order.
select * from customers_a;
select * from orders_a;
select * from customers_a left join orders_a using (customer_id);

-- 3 Find customers who have never placed an order.
select * from customers_a left join orders_a using (customer_id) where order_id is null;

-- 4 Find orders placed by customers from 'Los Angeles'.
select * from customers_a inner join orders_a using(customer_id) where city = "Los Angeles";

-- 5 Get the first 5 orders placed by customers from 'Chicago' or 'Los Angeles', sorted by order date.
select * from customers_a inner join orders_a using(customer_id) where city in ("Chicago","Los Angeles") order by order_date desc ;

-- 6 Find orders placed by customers who are NOT from 'New York' or 'Miami', sorted by order date in ascending order.
select * from customers_a join orders_a using (customer_id) where city not in ("New York", "Miami") order by order_date;

-- 7 Get all customers who have placed an order amount between $200 and $500, sorted by order amount in descending order.
select * from customers_a join orders_a using (customer_id) where amount between 200 and 500 order by amount desc;

-- 8 Find all customers who have never placed an order, sorted by customer name.
select *  from customers_a left join orders_a using(customer_id) where order_id is null order by customer_name;

# SET - 2  MULTI JOINS 
-- Question 1 Find the names of sailors who have reserved boat 103?
select s.sid, s.sname, r.bid from sailors s join reserves r using (sid) where r.bid = 103;   #3

-- Question 2 Find the colors of boats reserved byLubber?
select  b.color, s.sname, r.bid  from sailors s join reserves r using(sid) join boats b using (bid) where sname = "lubber";

-- Question 3 Find the names of sailors who have reserved a red or a green boat?
select s.sname, s.sid, b.color from sailors s join reserves r using(sid) join boats b using (bid) where b.color in ("red","green"); #8

-- Question 4: Find the names of sailors who have reserved both boat 101 and boat 102.  #5
select s.sname, r.bid, s.sid  from sailors s join reserves r using(sid) where r.bid in (101, 102);

-- Question 5: Find the names of sailors who have never reserved a red boat.
select s.sname, b.color, r.bid from sailors s join reserves r using(sid) join boats b using(bid) where b.color not  in ("red"); #5

-- Question 6: Find the sailors who are older than 30 years and have reserved a boat.
select distinct s.sname, r.bid, s.age from sailors s join reserves r using(sid) where s.age > 30;

-- Question 7: Find the average age of sailors who have reserved a green boat.
select round(avg(s.age),0) as avg_age from sailors s join reserves r using(sid) join boats b using(bid) where b.color = "green"; #1

-- Question 8: Find the sailor names along with the number of boats they have reserved.
select s.sid, s.sname, count(r.bid) as total_boat from sailors s join reserves r using(sid) group by s.sid, s.sname;

-- Question 9: List the boat names that have never been reserved.
select b.bid, bname from boats b left join reserves r using(bid) where b.bid is null ;

-- Question 10: Find the names of sailors who have reserved at least two different boats on the same day.
select s.sname, s.sid,  r.day as reserve_count  from sailors s join reserves r using(sid) group by s.sid, r.day
having count(distinct r.bid) >= 2; 

-- Question 11: Find the sailors who have reserved boats more than three times.
select s.sid, s.sname, count(r.bid) as boat_reserved from sailors s join reserves r using(sid) group by s.sid,s.sname having count(r.bid) >=3;

-- Question 12: List all sailors and the total number of different days they have made reservations.
select s.sid, s.sname, count(r.day) count_of_days from sailors s join reserves r using(sid) group by s.sid, s.sname ;

-- Question 13: Find the sailor with the highest rating.
select * from sailors where rating = (select max(rating) from sailors);

-- Question 14: Find the sailor who is youngest but has reserved a boat.
select s.sid, s.sname, s.age from sailors s join reserves r using(sid) order by s.age asc limit 1;

-- Question 15: Find the total number of reservations made for each boat.
select b.bid, count(r.sid) as total_reservation from boats b join reserves r using(bid) group by b.bid;

select * from boats;
select * from reserves;
select * from sailors;

--  Date:- 10-03-2026 
use group_db;
show tables;
-- 1. 1. Show each customer and the total number of orders they have placed.
select customer_id, count(o.order_id) as total_order_by_each_cust from customers c 
join orders o using(customer_id) group by customer_id;

-- 2. 2. Show each customer and their total purchase amount.
select customer_id, sum(o.total_amount) as total_amount_by_each_cust from customers c 
join orders o using(customer_id) group by customer_id;

select customer_id, sum(od.quantity*od.unit_price) as total_amount_by_each_cust from customers c 
join orders o using(customer_id) join order_details od using (order_id) group by customer_id;

-- 3. 3. Count the number of orders placed per country.
select c.country, count(o.order_id) as total_order_each_country from customers c
join orders o using(customer_id) group by c.country;

-- 4. 4. Show total sales grouped by country.
select c.country, sum(od.quantity*od.unit_price) as total_sales_each_country from customers c
join orders o using(customer_id) join order_details od using(order_id) group by c.country;

-- 5. 5. Find the average order value (AOV) per customer.
select customer_id, round(avg(o.total_amount),2) as avg_ordervalue_by_each_cust from customers c 
join orders o using(customer_id) group by customer_id;

-- 6. 6. Show each product and total units sold.
select p.product_id, p.product_name, sum(od.quantity) as total_unit from products p 
join order_details od using(product_Id)  group by p.product_id, p.product_name ;

-- 7. 7. Find total revenue generated per product category.
select p.category, sum(od.quantity*od.unit_price) as total_unit from products p 
join order_details od using(product_Id)  group by p.category ;

-- 8. 8. Group by month from order_date and show total order count.
select date_format(order_date,'%Y-%m') as monthh, count(order_id) as total_order_by_month from orders 
group by monthh;

-- 9. 9. Show monthly total sales.
select date_format(order_date,'%Y-%m') as monthh, sum(total_amount) as total_order_by_month from orders 
group by monthh;

select*from customers;
select*from orders;
select*from products;
select*from order_details;

-- Date:- 17-10-2026
-- 10. 10. Show each product and its average quantity sold.
select od.product_id, round(avg(quantity),0) as avg_quantity from products p join order_details od using(product_id) group by od.product_id;

-- 11. 11. Show total revenue per customer grouped by country.
select c.customer_id, c.country,sum(total_amount) as total_revenue from customers c join orders o using(customer_id) group by c.customer_id, c.country;


-- 12. 12. Join customers, orders, order_details, and products to show revenue per category  per country.
select c.country, p.category , sum(total_amount) as total_revenue from customers c join orders o using(customer_id) join order_details od using (order_id)
join products p using(product_id) group by c.country, p.category;

-- 13. 13. Show customer name, category, and total revenue.
select c.customer_name, p.category , sum(total_amount) as total_revenue from customers c join orders o using(customer_id) join order_details od using (order_id)
join products p using(product_id) group by c.customer_name, p.category;


-- 14. 14. Count how many distinct products each customer has purchased.
select c.customer_id,c.customer_name,  count(distinct p.product_name) as distinct_product from customers c join orders o using(customer_id) join order_details od using (order_id)
join products p using(product_id) group by c.customer_Id, c.customer_name order by distinct_product desc limit 1; 

-- 15. 15. Show number of orders grouped by city.
select c.city, count(o.order_id) as total_order from customers c join orders o  using(customer_id) group by c.city;


-- 16. 16. Show customers whose total revenue exceeds ₹1000. 
select c.customer_id, c.customer_name, sum(total_amount) as total_revenue from customers c join orders o using(customer_id) group by  c.customer_id, c.customer_name
having total_revenue > 1000;

-- 17. 17. Show products where total quantity sold &gt; 50.
select p.product_name, p.product_id, sum(od.quantity) as total_quantity 	from products p join order_details od using(product_id) group by 
 p.product_name, p.product_id having total_quantity > 50;

-- 18. 18. Show countries whose average order value is above ₹500.
select c.country, avg(total_amount) as avg_order_revenue from customers c join orders o using(customer_id) group by 
 c.country having avg_order_revenue > 500;
 
-- 19. 19. Show categories where total revenue &gt; ₹5000.
select p.category,sum(total_amount) as total_revenue from customers c join orders o using(customer_id) 
join order_details od using(order_id) join products p using(product_id) group by p.category having total_revenue > 50000;

-- 20. 20. Find months where order count &gt; 10.
select date_format(order_date,'%Y-%m') as monthh , count(order_id) as total_order_count from orders  group by monthh having total_order_count
> 10;
select*from customers;
select*from orders;
select*from products;
select*from order_details;

-- Date: 18-03-2026

use dumy;
show tables;
select*from orderdetails;
select *from orders;
select*from payments;
select* from employees;
select*from customers;
select*from products;
select*from productlines;
 
-- 1 Retrieve the customers whose creditLimit is above the average credit limit of all customers.
 select *from customers where creditlimit > (select avg(creditlimit) from customers);
 
--  2️ Find the customer(s) with the highest credit limit using a subquery.
 select *from customers where creditlimit = (select max(creditlimit) from customers);

-- 3 Get the customers who have placed at least one order (assuming orders table has a customerNumber foreign key).
select * from customers c JOIN orders o ON c.customernumber = o.customernumber;
select * from customers where customernumber in (Select customernumber from orders);

-- 4 Find the customers who haven't made any payments (assuming payments table exists).
select * from customers c  left  JOIN payments p ON c.customernumber = p.customernumber
where p.customernumber is null;
select * from customers where customernumber not in (select customernumber from  payments);

-- 5 Get the customers whose credit limit is higher than any customer's credit limit from "New York".
select customername from customers where creditlimit > (select max(creditlimit) from customers where country = 'usa');


-- 6 Find the customer(s) who placed the most orders.
select c.customername, count(c.customerNumber) as count_orders FROM  customers c  
JOIN orders o ON c.customerNumber = o.customernumber group by c.customername order by count_orders desc limit 1;

-- class solution 
select customername from customers 
where customernumber IN (select customernumber from orders
group by customernumber
having COUNT(*) = (SELECT MAX(order_count) FROM
(SELECT COUNT(*) AS order_count
FROM orders group by customernumber) AS counts));

select c.customername from customers c 
JOIN orders o ON c.customernumber = o.customernumber group by customername
HAVING o.customernumber = (select count(o.customernumber) from orders group by c.customername); 

-- 7 Retrieve customers who have never placed an order.
select c.customername , c.customernumber from customers c 
LEFT JOIN orders o ON c.customernumber = o.customernumber where o.customernumber is null;

select customername,customernumber from customers  where customernumber 
not in (select customernumber from orders );

-- 8 Find customers who have placed orders but have never made a payment.
SELECT c.customernumber,c.customername from  orders o
JOIN  customers c ON C.customernumber = o.customernumber 
LEFT JOIN payments p ON o.customernumber = p.customernumber
where p.customernumber is null;

SELECT	c.customernumber, c.customername from  orders o 
JOIN customers c ON o.customernumber = c.customernumber where c.customernumber
not in (select customernumber from payments);

-- 9 Get the customers who made the highest total payment.
select customernumber, customername, amount from customers join payments using(customernumber) where amount = (select max(amount) from payments);

-- 10 Find products that have never been ordered.
select * from products where productcode not in (select productcode from orderdetails);

select * from products where productcode in (select productcode from orderdetails);
select count(*) from products;

-- 11 Retrieve the most expensive product(s).
select * from products where msrp = (select max(msrp) from products);
select * from products order by msrp desc limit 1;

-- 12 Retrieve the total revenue from each product category and list only categories where revenue is above the average revenue.
select p.productline, sum(od.quantityOrdered*od.priceeach) as total_revene, avg(od.quantityOrdered*od.priceeach)  from products p join orderdetails od using(productcode)
group by p.productline having total_revene > avg(od.quantityOrdered*od.priceeach) ;


use window_function;
show tables;

-- 1. Rank sales reps by their total sales within each month.
-- (Use RANK() function with PARTITION BY month)
select sales_rep, sales_amount, month, rank() over (partition by month order by sales_amount desc) as sales_ranking from sales_data;
select * from sales_data;

-- 2. Show the cumulative (running) total of sales for each sales rep across months.
-- (Use SUM() as a window function ordered by month)
select sales_rep, sales_amount, month, sum(sales_amount) over(partition by sales_rep order by sales_amount desc) as cumulative_sales from sales_data;

-- 3. Find the average monthly sales amount for each region.
-- (Use AVG() with PARTITION BY region)
select sales_rep, sales_amount, month, region, avg(sales_amount) over(partition by region,month) as average_monthly from sales_data;

-- 4. Compare each month’s sales amount with the previous month's sales for each sales rep.
-- (Use LAG() window function)
select sales_rep, month, sales_amount, lag(sales_amount) over(partition by sales_rep) previous_comparion from sales_data;

# Sales different 
select sales_rep, month, sales_amount, lag(sales_amount) over(partition by sales_rep) previous_month_sales,
sales_amount- lag(sales_amount) over(partition by sales_rep) as sales_diff from sales_data;


-- 5. Find the sales amount of the next month for each sales rep.
-- (Use LEAD() window function)
select sales_rep, month, sales_amount, lead(sales_amount) over(partition by sales_rep) next_month from sales_data;

-- 🦅🦅 Intermediate Level Questions
-- 6. Find what percentage of the total regional sales is contributed by each record.
-- (Use SUM() in denominator and compute percentage)
#class
select sales_rep, region,month,sales_amount, sales_amount *100/ sum(sales_amount) 
over(partition by sales_rep) as percentage from sales_data;

# formated
select sales_rep, region, month, sales_amount, round(sales_amount *100/ sum(sales_amount) 
over(partition by sales_rep),2) as percentage from sales_data;

select*from sales_data;
-- 7. For each sales rep, find their highest monthly sales amount (and display it alongside each row).
-- (Use MAX() as window function)
select sales_rep, month,sales_amount, 
MAX(sales_amount) over(partition by sales_rep order by sales_amount desc ) as Highest_Monthly_sales
from sales_data;

-- 8. Check whether each sales rep’s sales increased or not compared to their previous
-- month.
-- (Use LAG() with CASE WHEN logic)
-- 9. Assign a row number to each sales rep within their region and month based on
-- sales amount.
-- (Use ROW_NUMBER() function)
-- 10. Compare each record’s sales amount with the average sales of that region and
-- month.
-- (Use AVG() and subtraction to calculate the difference)


