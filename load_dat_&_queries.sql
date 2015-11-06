LOAD DATA LOCAL INFILE 'D://Fall-15//db design//SQL Project//book_copies.csv' INTO TABLE book_copies FIELDS TERMINATED BY ',' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE 'D://Fall-15//db design//SQL Project//books.csv' INTO TABLE book FIELDS TERMINATED BY ',' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'D://Fall-15//db design//SQL Project//borrowers_data.csv' INTO TABLE books FIELDS TERMINATED BY ',' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'D://Fall-15//db design//SQL Project//library_branch_data.csv' INTO TABLE library_branch FIELDS TERMINATED BY ',' IGNORE 1 LINES;

insert into book_authors(book_id,author) select book_id,author from demo_book;

CREATE TABLE demo_book (
  book_id varchar(45),
  title varchar(100),
  author varchar(90),
  year int(11) DEFAULT NULL,
  publisher varchar(60) DEFAULT NULL
);


ALTER TABLE borrowers ADD UNIQUE unique_borrower(fname,lname,address);