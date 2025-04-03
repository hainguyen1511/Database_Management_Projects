-- used for in-class activity 09

drop schema if exists books3 cascade;
create schema if not exists books3;

create table if not exists books3.publishers (
	id			int primary key
	, name		text
);

create table if not exists books3.authors (
	id			int primary key
	, author	text
);

create table if not exists books3.books (
	id			int primary key
	, title		text
	, author_id	int references books3.authors(id) deferrable
	, publishers_id	int references books3.publishers(id) deferrable
);

create table if not exists books3.editions (
	id			int primary key
	, edition	text
	, book_id	int references books3.books(id) deferrable
);

create table if not exists books3.book_sales (
	id				int primary key
	, edition_id	int references books3.editions(id) deferrable
	, date_of_sale	date null default now()
	, quantity		int not null default 0
);

insert into books3.publishers values
	(1, 'Scholastic Press')
	, (2, 'Houghton Mifflin')
	, (3, 'Harper Collins')
	, (4, 'Penguin Random House')
	, (5, 'Simon and Schuster')
;

insert into books3.authors values
	(1, 'J. K. Rowling')
	, (2, 'J. R. R. Tolkien')
	, (3, 'R. J. Chaney')
	--, (4, 'Kevin McGrath')
;

insert into books3.books values
	(1, 'The Fellowship of the Ring', 2, 2)
	, (2, 'The Two Towers', 2, 2)
	, (3, 'The Return of the King', null, 2)
	, (4, 'Philosopher''s Stone', 1, 1)
	, (5, 'Chamber of Secrets', 1, 1)
	, (6, 'Prisoner of Azkabang', null, 1)
	, (7, 'Goblet of Fire', null, 1)
;

insert into books3.editions (id, edition, book_id) values 
	(1, 'English', 1)
	, (2, 'Spanish', 1)
	, (3, 'Hindi', 1)
	, (4, 'English', 2)
	, (5, 'Hindi', 2)
	, (6, 'Ukrainian', 2)
	, (7, 'Latin', 2)
	, (8, 'Ancient Greek', 2)
	, (9, 'Tamil', 2)
	, (10, 'Telugu', 2)
	, (11, 'English', 3)
	, (12, 'Hindi', 3)
	, (13, 'Ukrainian', 3)
	, (14, 'Latin', 3)
	, (15, 'Ancient Greek', 3)
	, (16, 'Tamil', 3)
	, (17, 'Telugu', 3)
	, (18, 'English', 4)
	, (19, 'Hindi', 4)
	, (20, 'Ukrainian', 4)
	, (21, 'Latin', 4)
	, (22, 'Ancient Greek', 4)
	, (23, 'Tamil', 4)
	, (24, 'Telugu', 4)
	, (25, 'English', 5)
	, (26, 'Latin', 5)
	, (27, 'English', 6)
	, (28, 'Ancient Greek', 7)
;

-- truncate table books3.book_sales;
insert into books3.book_sales (id, edition_id, date_of_sale, quantity)
values
	(1, 1, '2003-02-27', 2000)
	, (2, 1, '2003-03-20', 2500)
	, (3, 1, '2003-04-17', 1000)
	, (4, 1, '2003-05-02', 5000)
	, (5, 1, '2003-05-23', 20000)
	, (6, 18, '2003-03-22', 500)
	, (7, 18, '2003-04-15', 5000)
	, (8, 18, '2003-05-12', 25000)
	, (9, 18, '2003-05-27', 50000)
	, (10, 26, '2004-03-22', 500)
	, (11, 27, '2004-04-15', 5000)
	, (12, 25, '2004-05-12', 25000)
	, (13, 25, '2004-05-27', 50000)
	, (14, 4, '2005-03-20', 2500)
	, (15, 5, '2005-04-17', 1000)
	, (16, 9, '2005-05-02', 5000)
	, (17, 10, '2005-05-23', 20000)
	, (18, 1, '2005-05-23', 1000)
	, (19, 19, '2003-03-22', 500)
	, (20, 17, '2003-03-22', 500)
	, (21, 14, '2003-03-22', 500)
	, (22, 2, '2005-05-23', 1000)
	, (23, 23, '2003-05-27', 1000)
	, (24, 24, '2004-05-27', 7000)
	, (25, 23, '2003-06-27', 1000)
	, (26, 24, '2004-07-27', 7000)
	, (27, 22, '2004-07-27', 7000)
;

Select edition_id,sum(quantity) as books_sold, count(*)
From books3.book_sales as bs
Group by edition_id
Order by books_sold desc, edition_id asc
;

Select edition_id, edition, sum(quantity) as books_sold, count(*)
From books3.book_sales as bs
join books3.editions as e on bs.edition_id = e.id
Group by edition_id, edition
Order by edition, books_sold desc, edition_id asc
;

Select title,edition_id, edition, sum(quantity) as books_sold, count(*) as num_of_sales
From books3.book_sales as bs
join books3.editions as e on bs.edition_id = e.id
join books3.books as b on b.id = e.book_id
Group by edition_id, edition, title
Order by books_sold, num_of_sales
;

Select title,edition_id, edition, sum(quantity) as books_sold, count(*) as num_of_sales
From books3.book_sales as bs
join books3.editions as e on bs.edition_id = e.id
join books3.books as b on b.id = e.book_id
Group by edition_id, edition, title
Order by books_sold, num_of_sales
;

Select author, title, sum(quantity) as books_sold, count(*) as num_of_sales
From books3.book_sales as bs
right join books3.editions as e on bs.edition_id = e.id
right join books3.books as b on b.id = e.book_id
right join books3.authors as a on a.id = b.author_id
Group by title, a.author
Order by books_sold desc
;


Select p.name as publisher, title, sum(quantity) as books_sold, count(*) as num_of_sales
From books3.book_sales as bs
join books3.editions as e on bs.edition_id = e.id
join books3.books as b on b.id = e.book_id
join books3.publishers as p on p.id = b.publishers_id
Group by title, p.name
Order by books_sold desc
;

Select p.name as publisher, title, date_part('year',bs.date_of_sale) as year ,sum(quantity) as books_sold, count(*) as num_of_sales
From books3.book_sales as bs
join books3.editions as e on bs.edition_id = e.id
join books3.books as b on b.id = e.book_id
join books3.publishers as p on p.id = b.publishers_id
Group by publisher,title,year
Order by year, books_sold
;

CREATE VIEW sales_v AS
SELECT
    p.name AS publisher,
    title,
    date_part('year', bs.date_of_sale) AS year,
    sum(quantity) AS books_sold,
    count(*) AS num_of_sales
FROM
    books3.book_sales AS bs
    JOIN books3.editions AS e ON bs.edition_id = e.id
    JOIN books3.books AS b ON b.id = e.book_id
    JOIN books3.publishers AS p ON p.id = b.publishers_id
GROUP BY
    publisher, title, year;

SELECT *
FROM sales_v
LIMIT 4;

CREATE MATERIALIZED VIEW sales_mv AS
SELECT
    p.name AS publisher,
    title,
    date_part('year', bs.date_of_sale) AS year,
    sum(quantity) AS books_sold,
    count(*) AS num_of_sales
FROM
    books3.book_sales AS bs
    JOIN books3.editions AS e ON bs.edition_id = e.id
    JOIN books3.books AS b ON b.id = e.book_id
    JOIN books3.publishers AS p ON p.id = b.publishers_id
GROUP BY
    publisher, title, year;

SELECT *
FROM sales_mv
LIMIT 6;

delete from books3.book_sales where id = 12;
update books3.book_sales set quantity = 27000 where id = 13;
insert into books3.book_sales values (28, 27, '2004-05-03', 50000);

SELECT *
FROM sales_v
WHERE year = 2004
LIMIT 3;

