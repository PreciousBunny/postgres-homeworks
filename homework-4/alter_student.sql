-- Active: 1689901380539@@127.0.0.1@5432@northwind@public
-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id SERIAL,
	first_name VARCHAR,
	last_name VARCHAR,
	birthday DATE,
	phone VARCHAR
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student
ADD COLUMN middle_name VARCHAR;

-- 3. Удалить колонку middle_name
ALTER TABLE student
DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student
RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student
ALTER COLUMN phone TYPE VARCHAR(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES
        ('Ivan', 'Sidorov', '1990-01-01', NULL),
        ('Liza', 'Ivanova', '1991-02-21', '123-45-67'),
        ('Arni', 'Paramonov', '2000-10-15', '987-65-43');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE ONLY student
RESTART IDENTITY;