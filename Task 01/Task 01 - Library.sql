
CREATE DATABASE Library;
USE Library
Go

CREATE TABLE Books (
BookID INT,
Title Varchar (50),
AuthorID INT,
PublishedYear INT,
CopiesAvailable INT,
BookCategory Varchar (50) 
);

go

CREATE TABLE Authors (
AuthorID INT,
Firstname Varchar (50),
Lastname Varchar (50),
BirthYear INT,
);

INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES
(1, 'The Adventures of Tom Sawyer', 3, 1896, 5, 'Fiction'),
(2, 'Wuthering Heights', 4, 1847, 3, 'Gothic Fiction'),
(3, 'To Kill a Mockingbird', 5, 1960, 4, 'Southern Gothic'),
(4, 'Pride and Prejudice', NULL, 1813, 2, 'Romantic Fiction'),
(5, 'Unknown Book', 1, 2024, 1, 'Science Fiction');




INSERT INTO Authors (AuthorID, Firstname, Lastname, BirthYear) VALUES
(1, 'John', 'Smith', 1970),
(2, 'Jane', 'Doe', 1980),
(3, 'Mark', 'Twain', 1835),
(4, 'Emily', 'Bronte', 1956),
(5, 'Harper', 'Lee', 2021);

SELECT * FROM BOOKS;

SELECT * FROM Authors;

SELECT MIN(CopiesAvailable) AS LeastAvailable
FROM Books;


SELECT Max(CopiesAvailable) AS MostAvailable
FROM Books;

SELECT AVG(PublishedYear) as avgYear
FROM Books;

SELECT COUNT(BookID) As numberOfBooks
FROM Books;

Truncate table Books;

drop table Authors;

