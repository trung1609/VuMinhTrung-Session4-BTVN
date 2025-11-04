create table kha2.products(
     id serial primary key ,
     name varchar(50),
     category varchar(50),
     price decimal(10,2),
     stock int
);

INSERT INTO kha2.products (name, category, price, stock) VALUES
                                                        ('Laptop Dell', 'Electronics', 1500.00, 5),
                                                        ('Chuột Logitech', 'Electronics', 25.50, 50),
                                                        ('Bàn phím Razer', 'Electronics', 120.00, 20),
                                                        ('Tủ lạnh LG', 'Home Appliances', 800.00, 3),
                                                        ('Máy giặt Samsung', 'Home Appliances', 600.00, 2);

insert into kha2.products(name, category, price, stock) VALUES ('Điều hòa Panasonic','Home Appliances',400.00,10);

update kha2.products set stock = 7 where products.name = 'Laptop Dell';

delete from kha2.products where products.stock = 0;

select p.name, p.category, p.price, p.stock
from kha2.products p order by p.price asc ;

select distinct p.category from kha2.products p;

select p.name, p.price
from kha2.products p where price between 100 and 1000;

select p.name
from kha2.products p where p.name like any (array ['%LG%', '%Samsung%']);
select p.name
from kha2.products p where p.name ilike any (array ['%lg%', '%samsung%']);

select p.name, p.price
from kha2.products p order by p.price desc limit 2;

select p.name, p.price
from kha2.products p limit 2 offset 0;



