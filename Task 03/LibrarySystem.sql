CREATE DATABASE LibrarySystem;
GO

USE LibrarySystem;
GO

CREATE TABLE Sections (
    section_ID INT PRIMARY KEY IDENTITY (1,1),
    sectionName VARCHAR (50)
);

CREATE TABLE Users (
    user_ID INT PRIMARY KEY IDENTITY (1,1),
    userName VARCHAR (50),
    userEmail VARCHAR (50)
);

CREATE TABLE Authors (
    authors_ID INT PRIMARY KEY IDENTITY (1,1),
    AuthorName VARCHAR (50)
);

CREATE TABLE Books (
    book_ID INT PRIMARY KEY IDENTITY (1,1),
    bookName VARCHAR (50),
    bookPuplishDate INT,
    user_ID INT,
    section_ID INT,
    authors_ID INT,
    FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
    FOREIGN KEY (section_ID) REFERENCES Sections(section_ID) ON DELETE CASCADE,
    FOREIGN KEY (authors_ID) REFERENCES Authors(authors_ID) ON DELETE CASCADE
);

CREATE TABLE Categories (
    category_ID INT PRIMARY KEY IDENTITY (1,1),
    categoryName VARCHAR (50)
);

CREATE TABLE Employees (
    employee_ID INT PRIMARY KEY IDENTITY (1,1),
    employee VARCHAR (50)
);

CREATE TABLE Employees_Sections (
    employee_ID INT,
    section_ID INT,
    PRIMARY KEY (employee_ID, section_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID) ON DELETE CASCADE,
    FOREIGN KEY (section_ID) REFERENCES Sections(section_ID) ON DELETE CASCADE
);

CREATE TABLE Categories_Books (
    category_ID INT,
    book_ID INT,
    PRIMARY KEY (category_ID, book_ID),
    FOREIGN KEY (category_ID) REFERENCES Categories(category_ID) ON DELETE CASCADE,
    FOREIGN KEY (book_ID) REFERENCES Books(book_ID) ON DELETE CASCADE
);

-- Insert data into Sections
INSERT INTO Sections (sectionName) VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('History'),
('Children'),
('Poetry');  -- This section will have no matching book

-- Insert data into Users
INSERT INTO Users (userName, userEmail) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Carol White', 'carol@example.com'),
('David Brown', 'david@example.com'),
('Eve Black', 'eve@example.com');

-- Insert data into Authors
INSERT INTO Authors (AuthorName) VALUES
('Mark Twain'),
('J.K. Rowling'),
('George Orwell'),
('Jane Austen'),
('Charles Dickens'),
('Agatha Christie');  -- This author will have no matching book

-- Insert data into Books
INSERT INTO Books (bookName, bookPuplishDate, user_ID, section_ID, authors_ID) VALUES
('The Adventures of Tom Sawyer', 1876, 1, 1, 1),
('Harry Potter and the Philosopher\Stone', 1997, 2, 2, 2),
('1984', 1949, 3, 3, 3),
('Pride and Prejudice', 1813, 4, 4, 4),
('A Tale of Two Cities', 1859, 5, 1, 5),
('The Hobbit', 1937, 2, 3, NULL);  -- This book will have no matching author

select * from Books;


-- Insert data into Categories
INSERT INTO Categories (categoryName) VALUES
('Adventure'),
('Fantasy'),
('Dystopian'),
('Romance'),
('Classic');

select * from Categories;

-- Insert data into Employees
INSERT INTO Employees (employee) VALUES
('John Doe'),
('Jane Smith'),
('Michael Johnson'),
('Emily Davis'),
('David Wilson');

-- Insert data into Employees_Sections (many-to-many)
INSERT INTO Employees_Sections (employee_ID, section_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

-- Insert data into Categories_Books (many-to-many)
INSERT INTO Categories_Books (category_ID, book_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);


SELECT Books.bookName, Authors.AuthorName
FROM Books
INNER JOIN Authors ON Books.authors_ID = Authors.authors_ID;


SELECT Books.bookName, Authors.AuthorName
FROM Books
LEFT JOIN Authors ON Books.authors_ID = Authors.authors_ID;



SELECT Books.bookName, Authors.AuthorName
FROM Books
RIGHT JOIN Authors ON Books.authors_ID = Authors.authors_ID;


SELECT Books.bookName, Authors.AuthorName
FROM Books
FULL OUTER JOIN Authors ON Books.authors_ID = Authors.authors_ID;


SELECT Books.bookName, Categories.categoryName
FROM Categories_Books
INNER JOIN Books ON Categories_Books.book_ID = Books.book_ID
INNER JOIN Categories ON Categories_Books.category_ID = Categories.category_ID;


SELECT Books.bookName, Categories.categoryName
FROM Categories_Books
LEFT JOIN Books ON Categories_Books.book_ID = Books.book_ID
LEFT JOIN Categories ON Categories_Books.category_ID = Categories.category_ID;


SELECT Books.bookName, Categories.categoryName
FROM Categories_Books
RIGHT JOIN Books ON Categories_Books.book_ID = Books.book_ID
RIGHT JOIN Categories ON Categories_Books.category_ID = Categories.category_ID;




SELECT Books.bookName, Categories.categoryName
FROM Categories_Books
FULL OUTER JOIN Books ON Categories_Books.book_ID = Books.book_ID
FULL OUTER JOIN Categories ON Categories_Books.category_ID = Categories.category_ID;

