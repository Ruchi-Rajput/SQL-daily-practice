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



