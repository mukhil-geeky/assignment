-- Library Management Schema
USE TASK3_1;
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    BirthYear INT
);

INSERT INTO Authors (AuthorID, AuthorName, BirthYear) VALUES
(1, 'J.K. Rowling', 1965),
(2, 'George Orwell', 1903),
(3, 'J.R.R. Tolkien', 1892),
(4, 'Stephen King', 1947),
(5, 'Suzanne Collins', 1962);

INSERT INTO Authors (AuthorID, AuthorName, BirthYear) VALUES
(7, 'Stan Lee', 1988),
(8,'Vikram Khan',1990);



CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    PublicationYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Books (BookID, Title, AuthorID, PublicationYear) VALUES
(1, 'Harry Potter and the Philosopher', 1, 1997),
(2, '1984', 2, 1949),
(3, 'The Lord of the Rings', 3, 1954),
(4, 'The Shining', 4, 1977),
(5, 'The Hunger Games', 5, 2008),
(6, 'The Casual Vacancy', 1, 2012),
(7, 'Animal Farm', 2, 1945),
(8, 'Untitled Book 1', NULL, 2020),  -- Non-existent author
(9, 'Mystery Book', NULL, 2015);     -- Non-existent author

INSERT INTO Books (BookID, Title, AuthorID, PublicationYear) VALUES
(10, 'Marvel Comics', 7, 2008);

CREATE TABLE Patrons (
    PatronID INT PRIMARY KEY,
    PatronName VARCHAR(100),
    MembershipDate DATE
);

INSERT INTO Patrons (PatronID, PatronName, MembershipDate) VALUES
(1, 'Alice Johnson', '2023-01-15'),
(2, 'Bob Smith', '2022-05-20'),
(3, 'Charlie Brown', '2021-07-10'),
(4, 'Diana Prince', '2023-03-01'),
(5, 'Eve Adams', '2023-06-25');

INSERT INTO Patrons (PatronID, PatronName, MembershipDate) VALUES
(6, 'Eric Johnson', '2024-01-15');


CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    PatronID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID)
);

INSERT INTO Loans (LoanID, BookID, PatronID, LoanDate, ReturnDate) VALUES
(1, 1, 1, '2023-09-01', '2023-09-15'),
(2, 2, 2, '2023-08-10', '2023-08-25'),
(3, 3, 3, '2023-07-05', '2023-07-20'),
(4, 4, 4, '2023-06-15', '2023-06-30'),
(5, 5, 5, '2023-05-01', '2023-05-20'),
(6, 1, 2, '2023-09-20', '2023-10-01'),
(7, 6, 1, '2023-10-01', NULL); -- Current loan

INSERT INTO Loans (LoanID, BookID, PatronID, LoanDate, ReturnDate) VALUES
(8, 7, 6, '2024-09-01', '2023-09-15');


-- Questions

-- 1. List all books along with their authors, including books without assigned authors.

SELECT B.BookID,B.Title,B.PublicationYear,B.AuthorID
FROM Books B
LEFT JOIN Authors A ON B.AuthorID = A.AuthorID;

-- 2. Display all patrons and their loan history, including patrons who have never borrowed a book.

SELECT P.PatronID,P.PatronName,L.LoanID,L.LoanDate,L.ReturnDate
FROM Patrons P
LEFT JOIN Loans L ON P.PatronID = L.PatronID;



-- 3. Show all authors and the books they've written, including authors who haven't written any books in our collection.

SELECT A.AuthorID,A.AuthorName,B.BookID,B.Title
FROM Authors A
LEFT JOIN Books B ON A.AuthorID = B.AuthorID;

-- 4. List all possible book-patron combinations, regardless of whether a loan has occurred.

SELECT *
FROM Books
CROSS JOIN Patrons;

-- 5. Display all loans with book and patron information, including loans where either the book or patron information is missing.

SELECT L.LoanID,L.BookID,L.PatronID,L.LoanDate,L.ReturnDate,B.Title,B.PublicationYear,P.PatronName,P.MembershipDate
FROM Loans L
LEFT JOIN Books B ON B.BookID = L.BookID
LEFT JOIN Patrons P ON P.PatronID = L.PatronID;

-- 6. Show all books that have never been loaned, along with their author information.

SELECT B.BookID,B.Title,B.PublicationYear,A.AuthorID,A.AuthorName,A.BirthYear
FROM Books B
LEFT JOIN Loans L ON L.BookID = B.BookID
LEFT JOIN Authors A ON A.AuthorID = B.AuthorID
WHERE L.LoanID IS NULL;

-- 7. List all patrons who have borrowed books in the last month, along with the books they've borrowed.

SELECT P.PatronID,P.PatronName,P.MembershipDate,L.LoanDate,B.Title
FROM Patrons P
LEFT JOIN Loans L ON P.PatronID = L.PatronID
LEFT JOIN Books B ON L.BookID = B.BookID
WHERE MONTH(L.LoanDate) = DATEPART(MONTH,GETDATE()) - 1 AND YEAR(L.LoanDate) = DATEPART(YEAR,GETDATE());


-- 8. Display all authors born after 1970 and their books, including those without any books in our collection.

SELECT A.AuthorID,A.AuthorName,A.BirthYear,B.Title,B.PublicationYear
FROM Authors A
LEFT JOIN Books B ON A.AuthorID = B.AuthorID
WHERE A.BirthYear > 1970;

-- 9. Show all books published before 2000 and any associated loan information.

SELECT B.BookID,B.Title,B.PublicationYear,L.LoanID,L.PatronID,L.LoanDate,L.ReturnDate
FROM Books B
LEFT JOIN Loans L ON B.BookID = L.BookID
WHERE B.PublicationYear < 2000;

-- 10. List all possible author-patron combinations, regardless of whether the patron has borrowed a book by that author.

SELECT * 
FROM Authors
CROSS JOIN Patrons;
