# SQL Daily Practice 📊

## 🔹 Introduction
This repository contains my daily SQL practice as a Data Analyst student.
I practice in MySQL Workbench and upload structured `.sql` files here.



## 🔹 Daily Practice Logs

---

### 📅 11-02-2026 – Schema Standardization & Primary Key Implementation

**Database Used:** `joins23`  
**Table:** `german_credit_risk`

#### 🔸 Key Activities Performed:
- Renamed multiple columns to follow consistent naming conventions  
  (e.g., `Credit amount` → `Credit_amount`)
- Standardized column names for better readability and query efficiency
- Implemented a **Primary Key constraint** on `Cust_Num`
- Enforced `NOT NULL` constraints on critical business columns:
  - `Cust_Num`
  - `Age`
  - `Gender`
  - `Credit_Amount`
  - `Duration`
  - `Risk`
- Applied a **CHECK constraint** to validate age range (18–100)

#### 🔸 Concepts Practiced:
- DDL (Data Definition Language)
- Schema restructuring
- Column normalization
- Data integrity enforcement
- Primary key constraint
- Business rule validation

#### 🔸 Learning Outcome:
Understood how database schema design impacts data quality and ensures reliable analytical outputs.

---

### 📅 12-02-2026 – Business Rule Validation Using CHECK Constraints

#### 🔸 Key Activities Performed:
- Applied validation rule: `credit_amount > 0`
- Applied validation rule: `duration > 0`
- Restricted categorical values:
  - `gender` → ('male', 'female')
  - `risk` → ('good', 'bad')

#### 🔸 Concepts Practiced:
- Constraint management
- Domain validation
- Controlled value enforcement
- Data quality assurance

#### 🔸 Learning Outcome:
Learned how to prevent invalid or inconsistent data from entering the database using structured constraints.

---

### 📅 13-02-2026 – Data Type Optimization & Schema Refinement

#### 🔸 Key Activities Performed:
- Modified data types for:
  - `housing`
  - `Saving_Accounts`
  - `Checking_Accounts`
  - `Purpose`
- Improved column storage definitions for better consistency

#### 🔸 Concepts Practiced:
- Column data type modification
- Schema refinement
- Structural optimization

#### 🔸 Learning Outcome:
Understood the importance of selecting appropriate data types to improve performance, consistency, and analytical accuracy.


---
## 📅 SQL Practice – Sales & Customer Analysis

**Database Used:** `group_db`
create database group_db;
use group_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (customer_id, customer_name, country, city) VALUES
(1, 'Aryan Sharma', 'India', 'Mumbai'),
(2, 'Priya Patel', 'India', 'Delhi'),
(3, 'John Smith', 'USA', 'New York'),
(4, 'Emily Davis', 'USA', 'Chicago'),
(5, 'Carlos Lopez', 'Mexico', 'Monterrey'),
(6, 'Sophia Lee', 'UK', 'London'),
(7, 'Liam Brown', 'UK', 'Manchester'),
(8, 'Mia Chen', 'China', 'Beijing'),
(9, 'David Kim', 'South Korea', 'Seoul'),
(10, 'Olivia Wilson', 'Australia', 'Sydney');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 70000.00),
(102, 'Smartphone', 'Electronics', 40000.00),
(103, 'Tablet', 'Electronics', 25000.00),
(104, 'Headphones', 'Accessories', 3000.00),
(105, 'Office Chair', 'Furniture', 8000.00),
(106, 'Desk Lamp', 'Furniture', 2500.00),
(107, 'T-Shirt', 'Clothing', 1200.00),
(108, 'Shoes', 'Clothing', 3500.00);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2025-01-05', 140000.00),
(1002, 2, '2025-01-15', 41000.00),
(1003, 3, '2025-02-10', 78000.00),
(1004, 4, '2025-02-18', 58000.00),
(1005, 5, '2025-03-02', 30000.00),
(1006, 6, '2025-03-12', 55000.00),
(1007, 7, '2025-04-01', 24000.00),
(1008, 8, '2025-04-18', 15000.00),
(1009, 9, '2025-05-10', 22000.00),
(1010, 10, '2025-05-20', 64000.00);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 2, 70000.00),
(2, 1002, 104, 2, 3000.00),
(3, 1002, 107, 5, 1200.00),
(4, 1003, 102, 1, 40000.00),
(5, 1003, 103, 1, 25000.00),
(6, 1003, 104, 4, 3000.00),
(7, 1004, 105, 5, 8000.00),
(8, 1004, 106, 2, 2500.00),
(9, 1005, 108, 3, 3500.00),
(10, 1005, 107, 10, 1200.00),
(11, 1006, 103, 2, 25000.00),
(12, 1006, 104, 1, 3000.00),
(13, 1006, 106, 2, 2500.00),
(14, 1007, 107, 8, 1200.00),
(15, 1007, 108, 2, 3500.00),
(16, 1008, 104, 5, 3000.00),
(17, 1008, 106, 2, 2500.00),
(18, 1009, 108, 4, 3500.00),
(19, 1010, 101, 1, 70000.00),
(20, 1010, 104, 2, 3000.00);


In this practice session, I worked with multiple related tables (`customers`, `orders`, `order_details`, and `products`) to perform sales and customer analysis using SQL.

I used **JOIN operations** to combine data from different tables and applied **aggregation functions** such as `COUNT()`, `SUM()`, and `AVG()` along with `GROUP BY` to calculate key business metrics.

### Key Analysis Performed
- Total number of orders placed by each customer
- Total purchase amount by customers
- Number of orders placed per country
- Total sales generated by each country
- Average Order Value (AOV) per customer
- Total units sold for each product
- Total revenue generated by product categories

### SQL Concepts Practiced
- Multi-table joins
- Aggregation functions
- GROUP BY analysis
- Revenue calculation
- Customer and sales analytics

### Learning Outcome
This practice helped me understand how SQL is used to analyze business data, calculate sales metrics, and generate insights about customers, products, and regional performance.


### New updations:- 
### 12-03-2026
### Monthly Order & Sales Analysis
Analyzed order trends by grouping `order_date` by month to calculate the total number of orders placed each month.  
Also computed monthly sales revenue using `SUM(total_amount)` to understand overall sales performance over time.

### 17-03-2026
### Advanced Sales & Customer Analysis
Performed multi-table analysis by joining customers, orders, order_details, and products to evaluate product demand, customer purchasing behavior, and revenue distribution across categories and countries.  
Used aggregation functions such as `AVG()`, `SUM()`, `COUNT()`, and `DISTINCT` along with `GROUP BY` to generate insights on product performance, customer revenue contribution, and order distribution by location.

## Date - 18-03-2026
### Customer Analysis Using Subqueries
Performed customer-level analysis using subqueries to identify high-value customers based on credit limits and compare them with overall averages.  
Also analyzed customer activity by retrieving customers who have placed orders using JOIN and IN conditions.