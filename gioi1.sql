create table gioi1.students(
    id serial primary key ,
    name varchar(50),
    age int,
    major varchar(50),
    gpa decimal(3,2)
);

create table gioi1.scholarships(
    id serial primary key ,
    student_id int references gioi1.students(id),
    name varchar(50),
    amount decimal(10,2),
    year int
);

INSERT INTO gioi1.students (name, age, major, gpa) VALUES
                                                 ('An', 20, 'CNTT', 3.5),
                                                 ('Bình', 21, 'Toán', 3.2),
                                                 ('Cường', 22, 'CNTT', 3.8),
                                                 ('Dương', 20, 'Vật lý', 3.0),
                                                 ('Em', 21, 'CNTT', 2.9);

INSERT INTO gioi1.scholarships (student_id, name, amount, year) VALUES
                                                              (1, 'Học bổng xuất sắc', 1000, 2025),
                                                              (3, 'Học bổng xuất sắc', 1200, 2025),
                                                              (2, 'Học bổng khuyến khích', 500, 2025),
                                                              (4, 'Học bổng khuyến khích', 400, 2025);

insert into gioi1.scholarships (student_id, name, amount, year) VALUES (5,'Học bổng khuyến khích',450,2025);

update gioi1.students s set gpa = 4.0 where s.id in (select sl.student_id from gioi1.scholarships sl where sl.name = 'Học bổng xuất sắc');

delete from gioi1.scholarships sl where sl.student_id in (select s.id from gioi1.students s where gpa < 3.0);

select s.name, s.major, sl.name, sl.amount
from gioi1.students s join gioi1.scholarships sl on s.id = sl.student_id where sl.year = 2025 order by sl.amount desc ;

select s.name, count(sl.name) as "Số học bổng"
from gioi1.students s join gioi1.scholarships sl on s.id = sl.student_id group by s.name having count(s.id)>1;

select s.name, sl.name
from gioi1.students s join gioi1.scholarships sl on s.id = sl.student_id where s.name ilike '%c%' and sl.amount >1000;

select s.name, s.gpa
from gioi1.students s order by gpa desc limit 2 offset 0;