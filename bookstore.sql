CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;
-- Create the authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- Create the books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2) NOT NULL,
    quantity_available INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    address VARCHAR(255)
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create the order_details table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO authors (author_id, author_name) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Michael Johnson'),
(4, 'Emily Brown'),
(5, 'David Wilson');

INSERT INTO books (book_id, title, author_id, price, quantity_available) VALUES
(1, 'Book 1', 1, 19.99, 100),
(2, 'Book 2', 2, 24.99, 80),
(3, 'Book 3', 3, 15.99, 120),
(4, 'Book 4', 4, 29.99, 70),
(5, 'Book 5', 5, 12.99, 90);

INSERT INTO customers (customer_id, customer_name, email, address) VALUES
(1, 'Alice Johnson', 'alice@example.com', '123 Main St, City'),
(2, 'Bob Smith', 'bob@example.com', '456 Elm St, Town'),
(3, 'Charlie Brown', 'charlie@example.com', '789 Oak St, Village'),
(4, 'Diana Wilson', 'diana@example.com', '101 Pine St, Hamlet'),
(5, 'Eva Davis', 'eva@example.com', '202 Maple St, Suburb');

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-02-10', 59.97),
(2, 2, '2024-02-11', 74.97),
(3, 3, '2024-02-11', 31.98),
(4, 4, '2024-02-12', 59.98),
(5, 5, '2024-02-12', 25.98);

INSERT INTO order_details (order_detail_id, order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 3, 19.99),
(2, 2, 2, 3, 24.99),
(3, 3, 3, 2, 15.99),
(4, 4, 4, 2, 29.99),
(5, 5, 5, 2, 12.99);

SELECT SUM(od.quantity * od.unit_price) AS total_revenue
FROM order_details od JOIN orders o ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2024-02-08' AND '2024-02-12'; 

SELECT c.customer_name, od.quantity
FROM customers c
JOIN order_details od
   ON c.customer_id = od.order_id
ORDER BY od.quantity DESC;