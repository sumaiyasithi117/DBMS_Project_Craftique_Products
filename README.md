# Craftique - eCommerce Website Database Project

This repository contains the MySQL database design and implementation for an eCommerce website. The project is part of a DBMS lab assignment, built using **MySQL** and managed via **XAMPP phpMyAdmin**.

---
This was done as a team effort, here is the team info:

**Team Laughter Crew**
- Ramesha Rawnok Haque (ID: 1665)
- Kh Sadman Sakib (ID: 1951)
- Most. Sumaiya Islam Sithi (ID: 1915)
- Fahmida Akter Juthi (ID: 1926)
- Hafijur Rahman (ID: 1620)

---

The project is submitted to:

**MD Shah Jalal**</br>
Senior Lecturer</br>
Department of CSE, Daffodil International University

---

## Features

- **Comprehensive Database Schema**: Designed to support core eCommerce functionality.
- **User Management**: Handles customer registrations, logins, and profiles.
- **Product Management**: Includes product categories, details, and inventory tracking.
- **Order Processing**: Covers order placement, payment details, and shipping.
- **Admin Functionality**: Tracks sales, manages inventory, and handles user roles.

---

## Database Schema

The database consists of multiple tables to support the functionality of the eCommerce website. Below are the key tables:

### 1. `users`
- Stores user information such as names, emails, passwords (hashed), and roles.

### 2. `products`
- Maintains details of the products available for purchase.

### 3. `categories`
- Categorizes products for better navigation.

### 4. `orders`
- Tracks user orders and their statuses.

### 5. `payments`
- Records payment details for orders.

and many more! </br>

There are total of 17 tables, 20+ procedures, 20+ triggers and 20+ views in the project. The project report demostrate them.

---

## Setup Instructions

Follow these steps to set up the database on your local machine:

1. **Clone the Repository**:
   ```bash
   git clone <repository_url>
   ```

2. **Start XAMPP**:
   - Launch XAMPP and start the **Apache** and **MySQL** modules.

3. **Import the Database**:
   - Open `phpMyAdmin` in your browser (usually at `http://localhost/phpmyadmin`).
   - Create a new database (e.g., `ems`).
   - Import the `ems.sql` file from this repository.

4. **Verify the Tables**:
   - Ensure all tables are created successfully with the required schema.

---

## Usage

- Use this database as the backend for your eCommerce project.
- Connect your web application (frontend) to the database using a programming language or framework of your choice.
- Test database operations such as user registration, product addition, order placement, and payment processing.

---

## Tools and Technologies

- **MySQL**: Database management system.
- **phpMyAdmin**: Database administration tool.
- **XAMPP**: Local server for running MySQL and Apache.

---

## Contributions

Contributions are welcome! If you'd like to improve the database schema or add features, feel free to fork the repository, make changes, and submit a pull request.

---

## Contact

For questions or support, please reach out:

- **Author**: sakibsidha
- **Email**: sakib22205101951@diu.edu.bd
- **University**: Daffodil International University

---

## Common Queries
-- 1. Retrieve all customers  
SELECT * FROM customer;  
  
-- 2. Display customer names and their phone numbers  
SELECT First_Name, Last_Name, Phone   
FROM customer;  
  
-- 3. Retrieve all products with their categories  
SELECT p.Product_Name, c.Category_Name   
FROM product p   
JOIN category c ON p.Category_ID = c.Category_ID;  
  
-- 4. Find products low in stock  
SELECT Product_Name, Stock   
FROM product   
WHERE Stock < 10;  
  
-- 5. Show all feedback left by customers  
SELECT f.Feedback_Text, f.Feedback_Date, c.First_Name, c.Last_Name   
FROM feedback f   
JOIN customer c ON f.Customer_ID = c.Customer_ID;  
  
-- 6. Display the total number of orders placed by each customer  
SELECT Customer_ID, COUNT(Order_ID) AS Total_Orders   
FROM `order`   
GROUP BY Customer_ID;  
  
-- 7. Retrieve all orders with their status and shipping date  
SELECT Order_ID, Order_Status, Shipping_Date   
FROM `order`;  
  
-- 8. Display the details of all orders placed in the last 30 days  
SELECT *   
FROM `order`   
WHERE Order_Date >= CURDATE() - INTERVAL 30 DAY;  
  
-- 9. Retrieve all products with active discounts  
SELECT p.Product_Name, d.Discount_Percentage   
FROM product p   
JOIN discount d ON p.Product_ID = d.Product_ID   
WHERE CURDATE() BETWEEN d.Start_Date AND d.End_Date;  
  
-- 10. List all expired coupons  
SELECT *   
FROM coupon   
WHERE Expiry_Date < CURDATE();  
  
-- 11. Show the total revenue generated from all orders  
SELECT SUM(Order_Amount) AS Total_Revenue   
FROM `order`;  
  
-- 12. Display the average order amount  
SELECT AVG(Order_Amount) AS Average_Order_Amount   
FROM `order`;  
  
-- 13. List all products sold by a specific seller  
SELECT p.Product_Name, p.Brand, p.MRP   
FROM product p   
JOIN seller s ON p.Seller_ID = s.Seller_ID  
WHERE s.Seller_Name = 'Best Electronics';  
  
-- 14. Show all customers who provided reviews for a specific product  
SELECT r.Customer_ID, r.Rating, r.Description, p.Product_Name   
FROM review r   
JOIN product p ON r.Product_ID = p.Product_ID  
WHERE p.Product_Name = 'Smartphone';  
  
-- 15. Find the average rating of each product  
SELECT Product_ID, AVG(Rating) AS Average_Rating   
FROM review   
GROUP BY Product_ID;  
  
-- 16. Retrieve all customers who haven’t placed an order yet  
SELECT c.Customer_ID, c.First_Name, c.Last_Name   
FROM customer c   
LEFT JOIN `order` o ON c.Customer_ID = o.Customer_ID  
WHERE o.Customer_ID IS NULL;  
  
-- 17. List all notifications sent to customers  
SELECT Notification_Text, Notification_Date   
FROM notification   
WHERE User_Type = 'Customer';  
  
-- 18. Retrieve details of all orders shipped by a specific agent  
SELECT s.Shipment_ID, s.Shipment_Status, o.Order_ID, o.Order_Date   
FROM shipment s   
JOIN `order` o ON s.Order_ID = o.Order_ID  
WHERE s.Agent_ID = 2;  
  
-- 19. Find the total number of shipments handled by each delivery agent  
SELECT Agent_ID, COUNT(Shipment_ID) AS Total_Shipments   
FROM shipment   
GROUP BY Agent_ID;  
  
-- 20. Retrieve the total number of products in each category  
SELECT c.Category_Name, COUNT(p.Product_ID) AS Total_Products   
FROM category c   
LEFT JOIN product p ON c.Category_ID = p.Category_ID  
GROUP BY c.Category_Name;  
  
-- 21. Find the product with the highest stock  
SELECT Product_Name, Stock   
FROM product   
ORDER BY Stock DESC   
LIMIT 1;  
  
-- 22. Show the most frequently purchased product  
SELECT c.Product_ID, p.Product_Name, SUM(c.Quantity) AS Total_Purchased   
FROM cart c   
JOIN product p ON c.Product_ID = p.Product_ID  
GROUP BY c.Product_ID   
ORDER BY Total_Purchased DESC   
LIMIT 1;  
  
-- 23. List all orders along with their grand total from the cart  
SELECT o.Order_ID, c.GrandTotal   
FROM `order` o   
JOIN cart c ON o.Cart_ID = c.Cart_ID;  
  
-- 24. Retrieve the feedback provided in the last 7 days  
SELECT Feedback_Text, Feedback_Date   
FROM feedback   
WHERE Feedback_Date >= CURDATE() - INTERVAL 7 DAY;  
   
-- 25. Find the products with the highest and lowest ratings   
SELECT Product_ID, MAX(Rating) AS Highest_Rating   
FROM review;  
  
SELECT Product_ID, MIN(Rating) AS Lowest_Rating   
FROM review;  
   
-- 26. Show the revenue generated by each product  
SELECT p.Product_Name, SUM(c.Quantity * p.MRP) AS Revenue   
FROM product p   
JOIN cart c ON p.Product_ID = c.Product_ID  
GROUP BY p.Product_ID;  
  
-- 27. List the top 3 best-selling products  
SELECT p.Product_Name, SUM(c.Quantity) AS Total_Sold   
FROM product p   
JOIN cart c ON p.Product_ID = c.Product_ID  
GROUP BY p.Product_ID   
ORDER BY Total_Sold DESC   
LIMIT 3;  
  
-- 28. Display all orders that have not been shipped yet  
SELECT o.Order_ID, o.Order_Date, o.Order_Status   
FROM `order` o   
LEFT JOIN shipment s ON o.Order_ID = s.Order_ID  
WHERE s.Shipment_ID IS NULL;  
  
-- 29. Find the category with the most products  
SELECT c.Category_Name, COUNT(p.Product_ID) AS Total_Products   
FROM category c   
JOIN product p ON c.Category_ID = p.Category_ID  
GROUP BY c.Category_Name   
ORDER BY Total_Products DESC   
LIMIT 1;  
  
-- 30. Show the average discount percentage for all products  
SELECT AVG(Discount_Percentage) AS Average_Discount   
FROM discount;  
  
-- 31. Retrieve all payments made within the current month  
SELECT *   
FROM payment   
WHERE MONTH(DateOfPayment) = MONTH(CURDATE())   
AND YEAR(DateOfPayment) = YEAR(CURDATE());  
  
-- 32. Find the most active customer based on the number of orders placed  
SELECT c.Customer_ID, c.First_Name, c.Last_Name, COUNT(o.Order_ID) AS Total_Orders   
FROM customer c   
JOIN `order` o ON c.Customer_ID = o.Customer_ID  
GROUP BY c.Customer_ID   
ORDER BY Total_Orders DESC   
LIMIT 1;  

---
  
Thank you for exploring this project!  

