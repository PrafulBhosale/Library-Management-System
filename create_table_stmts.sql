CREATE TABLE book (
  book_id varchar(45) NOT NULL,
  title varchar(100) NOT NULL,
  year int(11) DEFAULT NULL,
  publisher varchar(60) DEFAULT NULL,
  PRIMARY KEY (book_id)
);

CREATE TABLE book_authors (
 book_id varchar(45) NOT NULL,
  author varchar(90) DEFAULT NULL,
  type tinyint(4) NOT NULL DEFAULT '0',
  CONSTRAINT fk_book_author FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE library_branch (
 branch_id int(11) NOT NULL,
 branch_name varchar(50),
 address varchar(100),
  PRIMARY KEY (branch_id)
);

CREATE TABLE book_copies (
book_id varchar(45) NOT NULL,
  branch_id int(11) NOT NULL,
 no_of_copies int(11) DEFAULT NULL,
  PRIMARY KEY (book_id,branch_id), CONSTRAINT fk_copy_book FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_copy_branch FOREIGN KEY (branch_id) REFERENCES library_branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fines (
loan_id int(11) NOT NULL,
  fine_amt decimal(4,2) DEFAULT 0.0,
  is_paid tinyint(4) DEFAULT 0,
 CONSTRAINT loan_id FOREIGN KEY (loan_id) REFERENCES book_loan (loan_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE borrowers (
card_no int(11) NOT NULL AUTO_INCREMENT,
  fname varchar(40),
  lname varchar(40),
  address varchar(100),
  city varchar(30),
  state varchar(25),
  phone varchar(15),
  PRIMARY KEY (card_no)
) AUTO_INCREMENT =9000;

CREATE TABLE book_loan ( 
loan_id int(11) NOT NULL AUTO_INCREMENT,
  book_id varchar(45) NOT NULL,
 branch_id int(11) NOT NULL,
 card_no int(11) NOT NULL,
  date_out date  not null,
  due_date date not null,
  date_in date,
  PRIMARY KEY (loan_id),
  KEY book_id (book_id),
  KEY branch_id (branch_id),
  KEY card_no (card_no),
  CONSTRAINT fk_book_loans FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_book_branch FOREIGN KEY (branch_id) REFERENCES library_branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_book_borrower FOREIGN KEY (card_no) REFERENCES borrowers (card_no) ON DELETE CASCADE ON UPDATE CASCADE
);



