-- SQL-команды для создания таблиц

-- CREATE TABLE employees
CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    title VARCHAR(128) NOT NULL,
    birth_date DATE NOT NULL,
    notes TEXT
);



-- CREATE TABLE customers
CREATE TABLE customers
(
    customer_id VARCHAR(128) PRIMARY KEY,
    company_name VARCHAR(128) NOT NULL,
    contact_name VARCHAR(128) NOT NULL
);



-- CREATE TABLE orders
CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id VARCHAR(128) REFERENCES customers(customer_id) ON DELETE CASCADE,
    employee_id INTEGER REFERENCES employees(employee_id) ON DELETE CASCADE,
    order_date DATE NOT NULL,
    ship_city VARCHAR(128) NOT NULL
    -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    -- FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);