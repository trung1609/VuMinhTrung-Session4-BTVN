create table student.students(
    id serial primary key ,
    name varchar(50),
    age int,
    major varchar(50),
    gpa decimal(3,2)
);

insert into student.students(name, age, major, gpa) VALUES ('An', 20, 'CNTT', 3.5),
                                                           ('Bình', 21, 'Toán', 3.2),
                                                           ('Cường', 22, 'CNTT', 3.8),
                                                           ('Dương', 20, 'Vật lý', 3.0),
                                                           ('Em', 21, 'CNTT', 2.9);

insert into student.students(name, age, major, gpa) VALUES ('Hùng',23,'Hóa học',3.4);

update student.students set gpa = 3.6 where students.name = 'Bình';

delete from student.students where gpa < 3.0;

select st.name, st.major from student.students st order by gpa desc

select st.name, st.major
from student.students st where major = 'CNTT';

select st.name, st.gpa
from student.students st where gpa between 3.0 and 3.6;

select st.name
from student.students st where name like 'C%';
select st.name
from student.students st where name ilike 'c%';

select st.name
from student.students st order by id asc limit 3;
select st.name
from student.students st order by id asc limit 3 offset 1