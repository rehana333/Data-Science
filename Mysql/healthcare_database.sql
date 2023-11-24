use healthcare_database;
-- Creating tables for healthcare_database
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    PublicationYear INT,
    ISBN VARCHAR(20),
    Genre VARCHAR(50),
    Availability BOOLEAN
);
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    DateBorrowed DATE,
    DueDate DATE,
    DateReturned DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    DateReserved DATE,
    DateNeeded DATE,
    Status VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
-- inserting data into the above tables 
INSERT INTO Books (BookID, Title, Author, Publisher, PublicationYear, ISBN, Genre, Availability)
VALUES
  (101, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, '9780743273565', 'Classic', true),
  (102, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', 1960, '9780061120084', 'Fiction', true),
  (103, '1984', 'George Orwell', 'Secker & Warburg', 1949, '9780452284234', 'Dystopian', true),
  (104, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, '9780486284736', 'Romance', false),
  (105, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Bloomsbury', 1997, '9780590353427', 'Fantasy', true),
  (106, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, '9780048231473', 'Fantasy', true),
  (107, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, '9780316769174', 'Fiction', true),
  (108, 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', 1932, '9780060850524', 'Dystopian', true),
  (109, 'Moby-Dick', 'Herman Melville', 'Harper & Brothers', 1851, '9780142437247', 'Adventure', false),
  (110, 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', 1954, '9780618640157', 'Fantasy', true);
INSERT INTO Borrowers (BorrowerID, Name, Address, PhoneNumber, Email)
VALUES
  (201, 'John Doe', '123 Main Street', '555-1234', 'john.doe@example.com'),
  (202, 'Jane Smith', '456 Elm Street', '555-5678', 'jane.smith@example.com'),
  (203, 'Mike Johnson', '789 Oak Avenue', '555-9876', 'mike.johnson@example.com'),
  (204, 'Emily Davis', '901 Cedar Drive', '555-3456', 'emily.davis@example.com'),
  (205, 'Robert Lee', '678 Birch Lane', '555-7890', 'robert.lee@example.com'),
  (206, 'Laura Brown', '345 Maple Road', '555-2345', 'laura.brown@example.com'),
  (207, 'William Jones', '567 Pine Street', '555-6789', 'william.jones@example.com'),
  (208, 'Mary Wilson', '890 Oak Avenue', '555-1234', 'mary.wilson@example.com'),
  (209, 'Michael Johnson', '123 Elm Street', '555-5678', 'michael.johnson@example.com'),
  (210, 'Jessica Garcia', '456 Maple Road', '555-9876', 'jessica.garcia@example.com');
INSERT INTO Loans (LoanID, BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES
  (301, 101, 201, '2023-07-15', '2023-08-01', NULL),
  (302, 105, 204, '2023-07-16', '2023-08-02', NULL),
  (303, 108, 207, '2023-07-17', '2023-08-03', NULL),
  (304, 102, 202, '2023-07-18', '2023-08-04', NULL),
  (305, 106, 206, '2023-07-19', '2023-08-05', NULL),
  (306, 103, 203, '2023-07-20', '2023-08-06', NULL),
  (307, 107, 205, '2023-07-21', '2023-08-07', NULL),
  (308, 110, 210, '2023-07-22', '2023-08-08', NULL),
  (309, 104, 208, '2023-07-23', '2023-08-09', NULL),
  (310, 109, 209, '2023-07-24', '2023-08-10', NULL);
INSERT INTO Reservations (ReservationID, BookID, BorrowerID, DateReserved, DateNeeded, Status)
VALUES
  (401, 101, 203, '2023-07-20', '2023-08-01', 'active'),
  (402, 104, 207, '2023-07-21', '2023-08-02', 'active'),
  (403, 105, 208, '2023-07-22', '2023-08-03', 'active'),
  (404, 106, 209, '2023-07-23', '2023-08-04', 'active'),
  (405, 102, 204, '2023-07-24', '2023-08-05', 'active'),
  (406, 103, 205, '2023-07-25', '2023-08-06', 'active'),
  (407, 107, 201, '2023-07-26', '2023-08-07', 'active'),
  (408, 109, 206, '2023-07-27', '2023-08-08', 'active'),
  (409, 110, 210, '2023-07-28', '2023-08-09', 'active'),
  (410, 108, 202, '2023-07-29', '2023-08-10', 'active');
  
  
-- Retrieve all available books:
SELECT * FROM Books WHERE Availability = true;
-- Retrieve all borrowed books along with the borrower's name and due date:
SELECT b.Title, b.Author, br.Name, l.DueDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
JOIN Borrowers br ON l.BorrowerID = br.BorrowerID;
-- Retrieve all reserved books along with the borrower's name and reservation status:
SELECT b.Title, b.Author, br.Name, r.Status
FROM Books b
JOIN Reservations r ON b.BookID = r.BookID
JOIN Borrowers br ON r.BorrowerID = br.BorrowerID;
-- Update the availability of a book with BookID 104 to be available for borrowing:
UPDATE Books SET Availability = true WHERE BookID = 104;
-- Mark a book with BookID 101 as returned and update the DateReturned field in the Loans table:
UPDATE Loans SET DateReturned = '2023-08-02' WHERE BookID = 101;
-- Add a new borrower to the Borrowers table:
INSERT INTO Borrowers (BorrowerID, Name, Address, PhoneNumber, Email)
VALUES (211, 'Sarah Johnson', '789 Pine Avenue', '555-2345', 'sarah.johnson@example.com');
-- Reserve a book with BookID 103 for the new borrower with BorrowerID 211:
INSERT INTO Reservations (ReservationID, BookID, BorrowerID, DateReserved, DateNeeded, Status)
VALUES (411, 103, 211, '2023-07-30', '2023-08-11', 'active');
-- Retrieve the average grade for a student with StudentID 101:
SELECT AVG(grade) FROM grades WHERE student_id = 101;
-- Display the top-performing students based on their average grades:
SELECT students.*, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.student_id = grades.student_id
GROUP BY students.student_id
ORDER BY average_grade DESC;
