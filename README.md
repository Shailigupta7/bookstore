This repository contains the code for a simple Bookstore Management System, designed to handle various aspects of managing a bookstore, including inventory management, customer information, order processing, and sales tracking. 
The system is implemented using SQL for database management and provides a basic framework for building a fully functional bookstore application.
Authors Table:

This table stores information about the authors of the books available in the bookstore.
Columns:
author_id: Primary key identifier for each author.
author_name: Name of the author.
Books Table:

This table holds details about the books available in the bookstore, including their title, price, and quantity available.
Columns:
book_id: Primary key identifier for each book.
title: Title of the book.
author_id: Foreign key referencing the author of the book.
price: Price of the book.
quantity_available: Quantity of the book available in stock.
Customers Table:

This table stores information about the customers who have made purchases from the bookstore.
Columns:
customer_id: Primary key identifier for each customer.
customer_name: Name of the customer.
email: Email address of the customer.
address: Address of the customer.
Orders Table:

This table keeps records of the orders placed by customers, including the order date and total amount.
Columns:
order_id: Primary key identifier for each order.
customer_id: Foreign key referencing the customer who placed the order.
order_date: Date when the order was placed.
total_amount: Total amount of the order.
Order_Details Table:

This table contains details of each book included in an order, such as quantity and unit price.
Columns:
order_detail_id: Primary key identifier for each order detail.
order_id: Foreign key referencing the order to which the detail belongs.
book_id: Foreign key referencing the book included in the order.
quantity: Quantity of the book ordered.
unit_price: Unit price of the book at the time of the order.

Write SQL queries to retrieve a list of top-selling books and calculate total sales revenue for a given period.
Query1 
SELECT c.customer_name, od.quantity
FROM customers c
JOIN order_details od
   ON c.customer_id = od.order_id
ORDER BY od.quantity DESC;

Query2
SELECT SUM(od.quantity * od.unit_price) AS total_revenue
FROM order_details od JOIN orders o ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2024-02-08' AND '2024-02-12'; 


![ER diagram](https://github.com/Shailigupta7/bookstore/assets/89686868/dd2def7c-f15f-484e-ac9e-b6210fc8a05c)
