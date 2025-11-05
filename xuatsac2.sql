CREATE TABLE xuatsac2.customers (
   id SERIAL PRIMARY KEY,
   name VARCHAR(50),
   city VARCHAR(50)
);

CREATE TABLE xuatsac2.products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  category VARCHAR(50),
  price DECIMAL(10,2)
);

CREATE TABLE xuatsac2.orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES xuatsac2.customers(id),
    product_id INT REFERENCES xuatsac2.products(id),
    quantity INT,
    order_date DATE
);

INSERT INTO xuatsac2.customers (name, city) VALUES
   ('An', 'Hà Nội'),
   ('Bình', 'HCM'),
   ('Cường', 'Đà Nẵng'),
   ('Dương', 'Hà Nội'),
   ('Em', 'HCM');

INSERT INTO xuatsac2.products (name, category, price) VALUES
     ('Laptop Dell', 'Electronics', 1500.00),
     ('Chuột Logitech', 'Electronics', 25.50),
     ('Bàn phím Razer', 'Electronics', 120.00),
     ('Tủ lạnh LG', 'Home Appliances', 800.00),
     ('Máy giặt Samsung', 'Home Appliances', 600.00);

INSERT INTO xuatsac2.orders (customer_id, product_id, quantity, order_date) VALUES
   (1, 1, 2, '2025-10-01'),
   (2, 2, 5, '2025-10-02'),
   (3, 3, 1, '2025-10-03'),
   (5, 4, 1, '2025-10-05'),
   (4, 4, 1, '2025-10-06');

insert into xuatsac2.orders (customer_id, product_id, quantity, order_date)
VALUES (5, 1, 1, '2025-10-10');

update xuatsac2.orders set quantity = 3 where orders.customer_id = 1 and orders.product_id = 1;

delete from xuatsac2.orders where orders.quantity = 0;

select c.name as name, p.name as product, (o.quantity * p.price) as total, o.order_date as order_date
from xuatsac2.customers c join xuatsac2.orders o on o.customer_id = c.id join xuatsac2.products p  on o.product_id = p.id
order by total desc ;

select c.name as name, (o.quantity * p.price) as total
from xuatsac2.customers c join xuatsac2.orders o on c.id = o.customer_id join xuatsac2.products p on o.product_id = p.id
group by c.name, o.quantity, p.price having (o.quantity * p.price) > 2000;

select c.name as name, c.city as city, p.name, p.category
from xuatsac2.customers c join xuatsac2.orders o on c.id = o.customer_id join xuatsac2.products p on o.product_id = p.id
where c.city like '%HCM%' and p.category = 'Electronics';

select c.name as name, (o.quantity * p.price) as total
from xuatsac2.customers c join xuatsac2.orders o on c.id = o.customer_id join xuatsac2.products p on o.product_id = p.id
order by total desc limit 2 offset 0;

select p.name, p.category
from xuatsac2.products p left join xuatsac2.orders o on p.id = o.product_id
where o.product_id is null;















