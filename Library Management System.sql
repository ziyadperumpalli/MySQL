CREATE DATABASE library;
USE library;

CREATE TABLE BRANCH(
Branch_no INT primary key,
Manager_Id INT ,
Branch_address VARCHAR(255),
Contact_no VARCHAR(15)
);

CREATE TABLE Employee(
Emp_id INT PRIMARY KEY,
emp_name VARCHAR(255),
Position VARCHAR (250),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES BRANCH(Branch_no)
);

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(255),
Customer_address VARCHAR (255),
Reg_date DATE
);

CREATE TABLE BOOKS(
ISBN INT PRIMARY KEY,
Book_Title VARCHAR(250),
Category VARCHAR(250),
Rental_Price INT,
Status ENUM('Yes','No'),
Author VARCHAR(250),
Publisher VARCHAR(250)
);

CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR (250),
Issue_date DATE,
Isbn_book INT ,
FOREIGN KEY (Isbn_book) REFERENCES  BOOKS(ISBN),
Foreign key (Issued_cust) references Customer(Customer_Id)
);


CREATE TABLE Returnstatus(
Return_id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(255),
Return_date DATE,
Isbn_book2 INT,
 FOREIGN KEY (Isbn_book2) REFERENCES  BOOKS(ISBN),
 FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id)
);

-- Populate the Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES
(1, 101, '123 Main Street', '123-456-7890'),
(2, 102, '456 Elm Street', '987-654-3210'),
(3, 103, '789 Oak Street', '456-789-0123'),
(4, 104, '321 Pine Street', '789-012-3456'),
(5, 105, '654 Maple Street', '012-345-6789');

-- Populate the Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES
(201, 'John Doe', 'Manager', 60000, 1),
(202, 'Jane Smith', 'Assistant Manager', 50000, 1),
(203, 'Alice Johnson', 'Clerk', 40000, 2),
(204, 'Bob Williams', 'Clerk', 40000, 2),
(205, 'Charlie Brown', 'Manager', 65000, 3),
(206, 'David Lee', 'Clerk', 42000, 3),
(207, 'Emily Davis', 'Manager', 62000, 4),
(208, 'Frank Wilson', 'Clerk', 41000, 4),
(209, 'Grace Taylor', 'Assistant Manager', 52000, 5),
(210, 'Henry Clark', 'Clerk', 43000, 5);

-- Populate the Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES
(301, 'Michael Brown', '123 Park Ave', '2021-06-15'),
(302, 'Jennifer Lee', '456 Lake St', '2021-07-20'),
(303, 'William Taylor', '789 Forest Rd', '2021-08-10'),
(304, 'Elizabeth Wilson', '321 Hillside Ave', '2021-09-05'),
(305, 'Christopher Martinez', '654 River Rd', '2021-10-15'),
(306, 'Amanda Davis', '987 Ocean Blvd', '2021-11-20'),
(307, 'Daniel Anderson', '159 Mountain View Dr', '2021-12-10'),
(308, 'Megan Thomas', '357 Sunset Blvd', '2022-01-05'),
(309, 'Matthew Rodriguez', '753 Sunrise Ave', '2022-02-20'),
(310, 'Samantha Garcia', '258 Beach Blvd', '2022-03-15');

-- Populate the Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES
(101, 'Book1', 'Fiction', 10.00, 'yes', 'John Author', 'Publisher1'),
(102, 'Book2', 'Non-fiction', 12.00, 'yes', 'Jane Author', 'Publisher2'),
(103, 'Book3', 'History', 15.00, 'No', 'Alice Author', 'Publisher3'),
(104, 'Book4', 'Science', 18.00, 'yes', 'Bob Author', 'Publisher4'),
(105, 'Book5', 'Fiction', 10.00, 'yes', 'Charlie Author', 'Publisher5'),
(106, 'Book6', 'Non-fiction', 12.00, 'No', 'David Author', 'Publisher6'),
(107, 'Book7', 'History', 15.00, 'yes', 'Emily Author', 'Publisher7'),
(108, 'Book8', 'Science', 18.00, 'No', 'Frank Author', 'Publisher8'),
(109, 'Book9', 'Fiction', 10.00, 'yes', 'Grace Author', 'Publisher9'),
(110, 'Book10', 'Non-fiction', 12.00, 'No', 'Henry Author', 'Publisher10');

-- Populate the IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES
(401, 301, 'Book1', '2023-01-10', 101),
(402, 302, 'Book2', '2023-02-15', 102),
(403, 304, 'Book4', '2023-04-25', 104),
(404, 305, 'Book5', '2023-05-30', 105),
(405, 306, 'Book6', '2023-06-05', 106),
(406, 307, 'Book7', '2023-07-10', 107),
(407, 308, 'Book8', '2023-08-15', 108),
(408, 309, 'Book9', '2023-09-20', 109),
(409, 310, 'Book10', '2023-10-25', 110);

-- Populate the ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES
(501, 301, 'Book1', '2023-01-20', 101),
(502, 302, 'Book2', '2023-02-25', 102),
(503, 303, 'Book3', '2023-03-30', 103),
(504, 304, 'Book4', '2023-04-05', 104),
(505, 305, 'Book5', '2023-05-10', 105),
(506, 306, 'Book6', '2023-06-15', 106),
(507, 307, 'Book7', '2023-07-20', 107),
(508, 308, 'Book8', '2023-08-25', 108),
(509, 309, 'Book9', '2023-09-30', 109),
(510, 310, 'Book10', '2023-10-05', 110);



#Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM BOOKS WHERE Status='YES';

#List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee ORDER BY salary DESC;

#Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Issued_cust, Issued_book_name FROM IssueStatus ;

#Display the total count of books in each category.
SELECT Category,COUNT(*) AS Total_count FROM BOOKS group by Category;

#Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position FROM Employee WHERE SALARY >50000;

#List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_Id, Customer_name FROM Customer WHERE Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus ) AND Reg_date<'2022-01-01'  ;

#Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no,COUNT(*) AS Total_Employees FROM Employee group by Branch_no;

#Display the names of customers who have issued books in the month of June 2023.
SELECT customer.Customer_name,IssueStatus.Issue_date FROM customer JOIN IssueStatus ON customer.Customer_Id=IssueStatus.Issued_cust WHERE month(Issue_date)='06';

#Retrieve book_title from book table containing history
SELECT book_title FROM books WHERE Category='History';

#Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no,COUNT(*) AS NUM_OF_EMPLOYEE FROM Employee GROUP BY Branch_no HAVING NUM_OF_EMPLOYEE>5;




