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
