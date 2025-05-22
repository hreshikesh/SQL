create database bank;

use bank;

CREATE TABLE Banks (
    bank_id INT PRIMARY KEY,
    bank_name VARCHAR(100),
    head_office VARCHAR(100),
    established_date DATE,
    is_national BOOLEAN
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    bank_id INT,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    open_date DATE,
    FOREIGN KEY (bank_id) REFERENCES Banks(bank_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    bank_id INT,
    branch_id INT,
    full_name VARCHAR(100),
    join_date DATE,
    FOREIGN KEY (bank_id) REFERENCES Banks(bank_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    balance DECIMAL(10,2),
    is_active BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Transactions (
    txn_id INT PRIMARY KEY,
    account_id INT,
    customer_id INT,
    amount DECIMAL(10,2),
    txn_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Banks (bank_id, bank_name, head_office, established_date, is_national) VALUES
(1, 'State Bank of India', 'Mumbai', '1955-07-01', TRUE),
(2, 'HDFC Bank', 'Mumbai', '1994-08-15', FALSE),
(3, 'ICICI Bank', 'Mumbai', '1994-06-01', FALSE),
(4, 'Punjab National Bank', 'New Delhi', '1894-05-19', TRUE),
(5, 'Bank of Baroda', 'Vadodara', '1908-07-20', TRUE),
(6, 'Axis Bank', 'Mumbai', '1993-12-03', FALSE),
(7, 'Kotak Mahindra Bank', 'Mumbai', '2003-02-22', FALSE),
(8, 'Canara Bank', 'Bengaluru', '1906-07-01', TRUE),
(9, 'IDBI Bank', 'Mumbai', '1964-07-01', FALSE),
(10, 'Union Bank of India', 'Mumbai', '1919-11-11', TRUE),
(11, 'Yes Bank', 'Mumbai', '2004-11-29', FALSE),
(12, 'IndusInd Bank', 'Mumbai', '1994-04-02', FALSE),
(13, 'Federal Bank', 'Aluva', '1931-04-23', FALSE),
(14, 'RBL Bank', 'Mumbai', '1943-09-30', FALSE),
(15, 'Central Bank of India', 'Mumbai', '1911-12-21', TRUE),
(16, 'IDFC First Bank', 'Mumbai', '2015-10-01', FALSE),
(17, 'SBI Cards', 'Mumbai', '1998-09-01', FALSE),
(18, 'Punjab & Sind Bank', 'New Delhi', '1908-06-24', TRUE),
(19, 'Bank of India', 'Mumbai', '1906-09-07', TRUE),
(20, 'Karur Vysya Bank', 'Karur', '1916-10-21', FALSE),
(21, 'South Indian Bank', 'Thrissur', '1929-01-29', FALSE),
(22, 'Dhanlaxmi Bank', 'Thrissur', '1927-11-14', FALSE),
(23, 'Tamilnad Mercantile Bank', 'Chennai', '1921-06-11', FALSE),
(24, 'Jammu & Kashmir Bank', 'Srinagar', '1938-07-01', FALSE),
(25, 'UCO Bank', 'Kolkata', '1943-01-06', TRUE),
(26, 'Lakshmi Vilas Bank', 'Chennai', '1926-01-05', FALSE),
(27, 'Yes Bank', 'Mumbai', '2004-11-29', FALSE),
(28, 'Indian Bank', 'Chennai', '1907-03-05', TRUE),
(29, 'Andhra Bank', 'Hyderabad', '1923-11-20', TRUE),
(30, 'Corporation Bank', 'Mangalore', '1906-03-12', TRUE);

INSERT INTO Branches (branch_id, bank_id, branch_name, city, open_date) VALUES
(101, 1, 'SBI Mumbai Main', 'Mumbai', '1960-01-01'),
(102, 1, 'SBI Delhi Main', 'Delhi', '1965-05-01'),
(103, 2, 'HDFC Mumbai', 'Mumbai', '1995-03-15'),
(104, 2, 'HDFC Bangalore', 'Bangalore', '1996-07-10'),
(105, 3, 'ICICI Mumbai', 'Mumbai', '1995-11-20'),
(106, 3, 'ICICI Chennai', 'Chennai', '1997-01-15'),
(107, 4, 'PNB New Delhi', 'Delhi', '1900-04-20'),
(108, 5, 'BOB Vadodara', 'Vadodara', '1910-09-12'),
(109, 6, 'Axis Bank Mumbai', 'Mumbai', '1994-06-30'),
(110, 7, 'Kotak Mumbai', 'Mumbai', '2004-04-01'),
(111, 8, 'Canara Bengaluru', 'Bangalore', '1910-02-28'),
(112, 9, 'IDBI Mumbai', 'Mumbai', '1970-08-22'),
(113, 10, 'Union Bank Mumbai', 'Mumbai', '1920-03-10'),
(114, 11, 'Yes Bank Mumbai', 'Mumbai', '2005-02-20'),
(115, 12, 'IndusInd Mumbai', 'Mumbai', '1996-05-14'),
(116, 13, 'Federal Bank Aluva', 'Aluva', '1932-06-17'),
(117, 14, 'RBL Mumbai', 'Mumbai', '1944-09-25'),
(118, 15, 'Central Bank Mumbai', 'Mumbai', '1912-01-30'),
(119, 16, 'IDFC First Mumbai', 'Mumbai', '2016-11-05'),
(120, 17, 'SBI Cards Mumbai', 'Mumbai', '1999-07-19'),
(121, 18, 'Punjab & Sind Delhi', 'Delhi', '1910-08-14'),
(122, 19, 'Bank of India Mumbai', 'Mumbai', '1907-11-01'),
(123, 20, 'Karur Vysya Karur', 'Karur', '1917-02-08'),
(124, 21, 'South Indian Thrissur', 'Thrissur', '1930-03-21'),
(125, 22, 'Dhanlaxmi Thrissur', 'Thrissur', '1928-12-05'),
(126, 23, 'Tamilnad Chennai', 'Chennai', '1922-07-13'),
(127, 24, 'J&K Srinagar', 'Srinagar', '1939-08-09'),
(128, 25, 'UCO Kolkata', 'Kolkata', '1944-02-11'),
(129, 26, 'Lakshmi Vilas Chennai', 'Chennai', '1927-03-17'),
(130, 27, 'Yes Bank Mumbai', 'Mumbai', '2005-12-01');

INSERT INTO Customers (customer_id, bank_id, branch_id, full_name, join_date) VALUES
(201, 1, 101, 'Ravi Kumar', '2010-01-15'),
(202, 1, 102, 'Anita Sharma', '2011-05-20'),
(203, 2, 103, 'Suresh Patel', '2012-07-30'),
(204, 2, 104, 'Priya Singh', '2013-03-25'),
(205, 3, 105, 'Rahul Mehta', '2014-09-05'),
(206, 3, 106, 'Neha Joshi', '2015-11-15'),
(207, 4, 107, 'Amit Desai', '2016-06-18'),
(208, 5, 108, 'Sunita Verma', '2017-12-12'),
(209, 6, 109, 'Vikram Shah', '2018-08-22'),
(210, 7, 110, 'Deepak Kumar', '2019-10-14'),
(211, 8, 111, 'Rekha Gupta', '2020-02-17'),
(212, 9, 112, 'Sanjay Singh', '2020-06-29'),
(213, 10, 113, 'Kavita Reddy', '2021-01-03'),
(214, 11, 114, 'Manish Kumar', '2021-07-11'),
(215, 12, 115, 'Rohit Sharma', '2021-12-20'),
(216, 13, 116, 'Sunil Yadav', '2022-04-05'),
(217, 14, 117, 'Meena Joshi', '2022-08-19'),
(218, 15, 118, 'Ajay Singh', '2022-11-23'),
(219, 16, 119, 'Kiran Desai', '2023-01-12'),
(220, 17, 120, 'Pooja Reddy', '2023-04-07'),
(221, 18, 121, 'Suresh Rao', '2023-05-15'),
(222, 19, 122, 'Rajesh Kumar', '2023-06-21'),
(223, 20, 123, 'Geeta Sharma', '2023-07-30'),
(224, 21, 124, 'Sunil Kumar', '2023-08-18'),
(225, 22, 125, 'Anil Verma', '2023-09-05'),
(226, 23, 126, 'Kavita Singh', '2023-10-14'),
(227, 24, 127, 'Rahul Gupta', '2023-11-20'),
(228, 25, 128, 'Neha Sharma', '2023-12-01'),
(229, 26, 129, 'Amit Kumar', '2024-01-15'),
(230, 27, 130, 'Priya Patel', '2024-02-10');


INSERT INTO Accounts (account_id, customer_id, branch_id, balance, is_active) VALUES
(301, 201, 101, 50000.00, TRUE),
(302, 202, 102, 120000.00, TRUE),
(303, 203, 103, 75000.00, TRUE),
(304, 204, 104, 30000.00, TRUE),
(305, 205, 105, 150000.00, FALSE),
(306, 206, 106, 90000.00, TRUE),
(307, 207, 107, 60000.00, TRUE),
(308, 208, 108, 85000.00, TRUE),
(309, 209, 109, 40000.00, TRUE),
(310, 210, 110, 100000.00, FALSE),
(311, 211, 111, 45000.00, TRUE),
(312, 212, 112, 75000.00, TRUE),
(313, 213, 113, 110000.00, TRUE),
(314, 214, 114, 130000.00, TRUE),
(315, 215, 115, 25000.00, FALSE),
(316, 216, 116, 60000.00, TRUE),
(317, 217, 117, 80000.00, TRUE),
(318, 218, 118, 95000.00, TRUE),
(319, 219, 119, 70000.00, FALSE),
(320, 220, 120, 50000.00, TRUE),
(321, 221, 121, 40000.00, TRUE),
(322, 222, 122, 30000.00, TRUE),
(323, 223, 123, 90000.00, TRUE),
(324, 224, 124, 100000.00, FALSE),
(325, 225, 125, 60000.00, TRUE),
(326, 226, 126, 55000.00, TRUE),
(327, 227, 127, 45000.00, TRUE),
(328, 228, 128, 35000.00, TRUE),
(329, 229, 129, 40000.00, TRUE),
(330, 230, 130, 50000.00, FALSE);

INSERT INTO Transactions (txn_id, account_id, customer_id, amount, txn_date) VALUES
(401, 301, 201, 5000.00, '2024-01-01'),
(402, 302, 202, 12000.00, '2024-01-02'),
(403, 303, 203, 7500.00, '2024-01-03'),
(404, 304, 204, 3000.00, '2024-01-04'),
(405, 305, 205, 15000.00, '2024-01-05'),
(406, 306, 206, 9000.00, '2024-01-06'),
(407, 307, 207, 6000.00, '2024-01-07'),
(408, 308, 208, 8500.00, '2024-01-08'),
(409, 309, 209, 4000.00, '2024-01-09'),
(410, 310, 210, 10000.00, '2024-01-10'),
(411, 311, 211, 4500.00, '2024-01-11'),
(412, 312, 212, 7500.00, '2024-01-12'),
(413, 313, 213, 11000.00, '2024-01-13'),
(414, 314, 214, 13000.00, '2024-01-14'),
(415, 315, 215, 2500.00, '2024-01-15'),
(416, 316, 216, 6000.00, '2024-01-16'),
(417, 317, 217, 8000.00, '2024-01-17'),
(418, 318, 218, 9500.00, '2024-01-18'),
(419, 319, 219, 7000.00, '2024-01-19'),
(420, 320, 220, 5000.00, '2024-01-20'),
(421, 321, 221, 4000.00, '2024-01-21'),
(422, 322, 222, 3000.00, '2024-01-22'),
(423, 323, 223, 9000.00, '2024-01-23'),
(424, 324, 224, 10000.00, '2024-01-24'),
(425, 325, 225, 6000.00, '2024-01-25'),
(426, 326, 226, 5500.00, '2024-01-26'),
(427, 327, 227, 4500.00, '2024-01-27'),
(428, 328, 228, 3500.00, '2024-01-28'),
(429, 329, 229, 4000.00, '2024-01-29'),
(430, 330, 230, 5000.00, '2024-01-30');


SELECT * FROM Banks;
SELECT * FROM Branches;
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;













