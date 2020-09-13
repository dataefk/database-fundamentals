CREATE SCHEMA dataefk_adm

CREATE SEQUENCE IF NOT EXISTS dataefk_adm.seq_customer;
CREATE TABLE IF NOT EXISTS dataefk_adm.customers (
  id_customer int default nextval('dataefk_adm.seq_customer'::regclass) PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100),
  category varchar(30),
  gender varchar(1)
);

CREATE SEQUENCE IF NOT EXISTS dataefk_adm.seq_order;
CREATE TABLE IF NOT EXISTS dataefk_adm.orders (
  id_order int default nextval('dataefk_adm.seq_order'::regclass) PRIMARY KEY,
  id_customer int UNIQUE NOT NULL,
  id_employee int UNIQUE NOT NULL,
  amount numeric(10,2),
  created_at timestamp
);

CREATE TABLE IF NOT EXISTS dataefk_adm.order_items (
  id_order int UNIQUE NOT NULL,
  id_product int UNIQUE NOT NULL,
  unit_price numeric(10, 2),
  quantity int DEFAULT 1
);

CREATE SEQUENCE IF NOT EXISTS dataefk_adm.seq_employee;
CREATE TABLE IF NOT EXISTS dataefk_adm.employees (
  id_employee int default nextval('dataefk_adm.seq_employee'::regclass) PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100),
  gender varchar(1),
  hire_date date
);

CREATE SEQUENCE IF NOT EXISTS dataefk_adm.seq_product;
CREATE TABLE IF NOT EXISTS dataefk_adm.products (
  id_product int default nextval('dataefk_adm.seq_product'::regclass) PRIMARY KEY,
  name varchar(100),
  price numeric(10, 2)
);

ALTER TABLE dataefk_adm.orders ADD FOREIGN KEY (id_customer) REFERENCES dataefk_adm.customers (id_customer);
ALTER TABLE dataefk_adm.orders ADD FOREIGN KEY (id_employee) REFERENCES dataefk_adm.employees (id_employee);
ALTER TABLE dataefk_adm.order_items ADD FOREIGN KEY (id_order) REFERENCES dataefk_adm.orders (id_order);
ALTER TABLE dataefk_adm.order_items ADD FOREIGN KEY (id_product) REFERENCES dataefk_adm.products (id_product);