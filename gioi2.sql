create table gioi2.customers(
                                id serial primary key,
                                name varchar(50),
                                city varchar(50)
);
create table gioi2.orders(
                             id serial primary key,
                             customer_id int references gioi2.customers(id),
                             product varchar(50),
                             quantity int,
                             price decimal(10,2),
                             order_date date
);
insert into gioi2.customers(name, city) values
                                            ('An','Hà Nội'),
                                            ('Bình','HCM'),
                                            ('Cường','Đà Nẵng'),
                                            ('Dương','Hà Nội');
insert into gioi2.orders(customer_id, product, quantity, price, order_date) values
                                                                            (1,'Laptop',2,1500.00,'2025-10-01'),
                                                                            (2,'Chuột',5,25.50,'2025-10-02'),
                                                                            (3,'Bàn phím',3,120.00,'2025-10-03'),
                                                                            (1,'Laptop',1,1500.00,'2025-10-05'),
                                                                            (4,'Tủ lạnh',1,800.00,'2025-10-06');

insert into gioi2.orders(customer_id, product, quantity, price, order_date) VALUES
                                                                                (2,'Laptop',1,1500.00,'2025-10-10');

update gioi2.orders set quantity = 3 where orders.customer_id = 1 and orders.order_date = '2025-10-01';

delete from gioi2.orders where orders.quantity = 0;

select c.name, o.product, (o.quantity*o.price) as total
from gioi2.customers c join gioi2.orders o on c.id = o.customer_id order by total desc ;

select c.name, o.product, (o.quantity*o.price) as total
from gioi2.customers c join gioi2.orders o on c.id = o.customer_id group by c.name, o.product, o.quantity,o.price having (o.quantity*o.price) > 2000;

select c.name, o.product, c.city
from gioi2.customers c join gioi2.orders o on c.id = o.customer_id where o.product like '%Laptop%' and c.city = 'Hà Nội';

select c.name, (o.quantity*o.price) as total
from gioi2.customers c join gioi2.orders o on c.id = o.customer_id order by total desc limit 3 offset 0;









