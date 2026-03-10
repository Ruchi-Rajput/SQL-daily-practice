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

select*from customers;
select*from orders;
select*from products;
select*from order_details;


