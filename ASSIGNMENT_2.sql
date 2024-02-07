-- finance_database.sql

-- Table: expenses
CREATE TABLE expenses (
    expense_id SERIAL PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    amount DECIMAL(10, 2) NOT NULL,
    expense_date DATE NOT NULL
);

-- Table: income
CREATE TABLE income (
    income_id SERIAL PRIMARY KEY,
    source VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    amount DECIMAL(10, 2) NOT NULL,
    income_date DATE NOT NULL
);

-- Table: budget
CREATE TABLE budget (
    budget_id SERIAL PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    allocated_amount DECIMAL(10, 2) NOT NULL
);

-- View: expense_summary
CREATE VIEW expense_summary AS
SELECT
    category,
    SUM(amount) AS total_expense
FROM
    expenses
GROUP BY
    category;

-- Queries: Sample queries
-- 1. Retrieve all expenses
SELECT * FROM expenses;

-- 2. Retrieve income for a specific month
SELECT
    source,
    amount
FROM
    income
WHERE
    EXTRACT(MONTH FROM income_date) = 2; -- Replace 2 with desired month

-- 3. View total expenses by category
SELECT * FROM expense_summary;