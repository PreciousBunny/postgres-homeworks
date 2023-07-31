"""Скрипт для заполнения данными таблиц в БД Postgres."""

import psycopg2
import csv

# connect to db.
conn = psycopg2.connect(host='localhost', database='north', user='postgres', password='6464')

# Путь к таблицам с данными.
customers_data_file = "homework-1/north_data/customers_data.csv"
employees_data_file = "homework-1/north_data/employees_data.csv"
orders_data_file = "homework-1/north_data/orders_data.csv"


# Скрипт, который заполняет созданные таблицы данными из north_data.
try:
    with open(employees_data_file, "r") as file:
                reader = csv.reader(file)
                next(reader)
                with conn:
                        with conn.cursor() as cur:
                                cur.executemany(
                        'INSERT INTO employees (employee_id, first_name, last_name, title, birth_date, notes)' 
                        'VALUES (%s, %s, %s, %s, %s, %s)', 
                        reader)


    with open(customers_data_file, "r") as file:
                reader = csv.reader(file)
                next(reader)
                with conn:
                        with conn.cursor() as cur:
                                cur.executemany(
                        'INSERT INTO customers (customer_id, company_name, contact_name)' 
                        'VALUES (%s, %s, %s)',
                        reader)


    with open(orders_data_file, "r") as file:
                reader = csv.reader(file)
                next(reader)
                with conn:
                        with conn.cursor() as cur:
                                cur.executemany(
                        'INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city)' 
                        'VALUES (%s, %s, %s, %s, %s)',
                        reader)

finally:
        conn.close()
