-- Active: 1689901380539@@127.0.0.1@5432@northwind@public
-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT 
        c.company_name customer, 
        e.first_name || ' ' || e.last_name emlpoyee
FROM orders 
JOIN customers c 
        ON orders.customer_id = c.customer_id
JOIN employees e 
        ON orders.employee_id = e.employee_id
JOIN shippers s 
        ON orders.ship_via = s.shipper_id
WHERE c.city = 'London' AND  e.city = 'London' AND s.company_name = 'United Package';

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT 
        product_name, 
        units_in_stock, 
        contact_name, 
        phone 
FROM products
JOIN suppliers s 
        ON s.supplier_id = products.supplier_id
JOIN categories c 
        ON c.category_id = products.category_id
WHERE category_name IN ('Dairy Products', 'Condiments') 
                    AND discontinued = 0  
                    AND units_in_stock < 25
ORDER BY units_in_stock ASC;

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT 
        company_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT 
        product_name
FROM products
WHERE product_id IN (SELECT order_details.product_id
					    FROM order_details
					    WHERE order_details.quantity = '10');