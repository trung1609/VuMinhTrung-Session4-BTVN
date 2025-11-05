create table xuatsac1.students(
    id serial primary key ,
    name varchar(50),
    major varchar(50)
);

create table xuatsac1.books(
    id serial primary key ,
    title varchar(100),
    author varchar(50),
    category varchar(50)
);

create table xuatsac1.borrows(
    id serial primary key ,
    student_id int references xuatsac1.students(id),
    book_id int references xuatsac1.books(id),
    borrow_date date,
    return_date date
);

insert into xuatsac1.students (name, major) VALUES ('An','CNTT'),
                                                   ('Bình','Toán'),
                                                   ('Cường','CNTT'),
                                                   ('Dương','Vật lý'),
                                                   ('Em','CNTT');

insert into xuatsac1.books (title, author, category) VALUES ('Cấu trúc dữ liệu', 'Nguyễn Văn A','CNTT'),
                                                            ('Toán cao cấp','Trần Thị B','Toán'),
                                                            ('Vật lý đại cương','Lê Văn C','Vật lý'),
                                                            ('Lập trình Python','Nguyễn Văn D','CNTT'),
                                                            ('Cơ sở dữ liệu','Trần Thị E','CNTT');

insert into xuatsac1.borrows (student_id, book_id, borrow_date, return_date) VALUES (1,1,'2025-10-01','2025-10-10'),
                                                                                    (2,2,'2025-10-02','2025-10-12'),
                                                                                    (3,4,'2025-10-03',NULL),
                                                                                    (1,5,'2025-10-04',NULL),
                                                                                    (4,3,'2025-10-05','2025-10-15');

insert into xuatsac1.borrows (student_id, book_id, borrow_date, return_date) VALUES (5,5,'2025-10-20',NULL);

update xuatsac1.borrows set return_date = '2025-10-15' where borrows.student_id = 3;

delete from xuatsac1.borrows where borrows.student_id in (select students.id from xuatsac1.students where name like 'D%') and borrows.return_date is not null;

select s.name, b.title, br.borrow_date, br.return_date
from xuatsac1.students s join xuatsac1.borrows br on s.id = br.student_id join xuatsac1.books b on b.id = br.book_id 
where return_date is null order by borrow_date asc ;

select s.name, count(br.student_id) as borrow_list
from xuatsac1.students s join xuatsac1.borrows br on s.id = br.student_id group by s.name, br.student_id having count(br.student_id) > 1;

select b.title, b.category, br.borrow_date
from xuatsac1.borrows br join xuatsac1.books b on br.book_id = b.id where b.category = 'CNTT' and br.borrow_date is not null;

select s.name, count(br.student_id) as borrow_list
from xuatsac1.students s join xuatsac1.borrows br on s.id = br.student_id group by s.name, br.student_id order by borrow_list desc  limit 3 offset 0;