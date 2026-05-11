-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 01:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAddress` (IN `p_Customer_ID` INT, IN `p_Apartment_Name` VARCHAR(100), IN `p_Apart_No` VARCHAR(10), IN `p_Street_Name` VARCHAR(100), IN `p_City` VARCHAR(50))   BEGIN
    INSERT INTO address (Customer_ID, Apartment_Name, Apart_No, Street_Name, City)
    VALUES (p_Customer_ID, p_Apartment_Name, p_Apart_No, p_Street_Name, p_City);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCart` (IN `p_Customer_ID` INT, IN `p_Product_ID` INT, IN `p_Quantity` INT, IN `p_ItemTotal` DECIMAL(10,2), IN `p_GrandTotal` DECIMAL(10,2))   BEGIN
    INSERT INTO cart (Customer_ID, Product_ID, Quantity, ItemTotal, GrandTotal)
    VALUES (p_Customer_ID, p_Product_ID, p_Quantity, p_ItemTotal, p_GrandTotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCategory` (IN `p_Category_Name` VARCHAR(100), IN `p_Description` TEXT)   BEGIN
    INSERT INTO category (Category_Name, Description)
    VALUES (p_Category_Name, p_Description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCoupon` (IN `p_Coupon_Code` VARCHAR(50), IN `p_Discount_Value` DECIMAL(10,2), IN `p_Expiry_Date` DATE)   BEGIN
    INSERT INTO coupon (Coupon_Code, Discount_Value, Expiry_Date)
    VALUES (p_Coupon_Code, p_Discount_Value, p_Expiry_Date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCustomer` (IN `p_First_Name` VARCHAR(50), IN `p_Last_Name` VARCHAR(50), IN `p_Email` VARCHAR(100), IN `p_Phone` VARCHAR(15), IN `p_Age` INT, IN `p_DOB` DATE)   BEGIN
    INSERT INTO customer (First_Name, Last_Name, Email, Phone, Age, DOB)
    VALUES (p_First_Name, p_Last_Name, p_Email, p_Phone, p_Age, p_DOB);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDeliveryAgent` (IN `p_Agent_Name` VARCHAR(100), IN `p_Phone` VARCHAR(15), IN `p_Vehicle_Type` VARCHAR(50))   BEGIN
    INSERT INTO delivery_agent (Agent_Name, Phone, Vehicle_Type)
    VALUES (p_Agent_Name, p_Phone, p_Vehicle_Type);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDiscount` (IN `p_Product_ID` INT, IN `p_Discount_Percentage` DECIMAL(5,2), IN `p_Start_Date` DATE, IN `p_End_Date` DATE)   BEGIN
    INSERT INTO discount (Product_ID, Discount_Percentage, Start_Date, End_Date)
    VALUES (p_Product_ID, p_Discount_Percentage, p_Start_Date, p_End_Date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFeedback` (IN `p_Customer_ID` INT, IN `p_Feedback_Text` TEXT, IN `p_Feedback_Date` DATE)   BEGIN
    INSERT INTO feedback (Customer_ID, Feedback_Text, Feedback_Date)
    VALUES (p_Customer_ID, p_Feedback_Text, p_Feedback_Date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddInventory` (IN `p_Product_ID` INT, IN `p_Location` VARCHAR(100), IN `p_Quantity_In_Stock` INT)   BEGIN
    INSERT INTO inventory (Product_ID, Location, Quantity_In_Stock)
    VALUES (p_Product_ID, p_Location, p_Quantity_In_Stock);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNotification` (IN `p_User_ID` INT, IN `p_User_Type` VARCHAR(50), IN `p_Notification_Text` TEXT, IN `p_Notification_Date` DATE, IN `p_Is_Read` BOOLEAN)   BEGIN
    INSERT INTO notification (User_ID, User_Type, Notification_Text, Notification_Date, Is_Read)
    VALUES (p_User_ID, p_User_Type, p_Notification_Text, p_Notification_Date, p_Is_Read);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrder` (IN `p_Cart_ID` INT, IN `p_Customer_ID` INT, IN `p_Order_Amount` DECIMAL(10,2), IN `p_Order_Date` DATE, IN `p_Shipping_Date` DATE, IN `p_Order_Status` VARCHAR(50))   BEGIN
    INSERT INTO `order` (Cart_ID, Customer_ID, Order_Amount, Order_Date, Shipping_Date, Order_Status)
    VALUES (p_Cart_ID, p_Customer_ID, p_Order_Amount, p_Order_Date, p_Shipping_Date, p_Order_Status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPayment` (IN `p_Order_ID` INT, IN `p_Customer_ID` INT, IN `p_Payment_Mode` VARCHAR(50), IN `p_DateOfPayment` DATE)   BEGIN
    INSERT INTO payment (Order_ID, Customer_ID, Payment_Mode, DateOfPayment)
    VALUES (p_Order_ID, p_Customer_ID, p_Payment_Mode, p_DateOfPayment);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddProduct` (IN `p_Product_Name` VARCHAR(100), IN `p_Category_ID` INT, IN `p_Seller_ID` INT, IN `p_Brand` VARCHAR(50), IN `p_Stock` INT, IN `p_MRP` DECIMAL(10,2))   BEGIN
    INSERT INTO product (Product_Name, Category_ID, Seller_ID, Brand, Stock, MRP)
    VALUES (p_Product_Name, p_Category_ID, p_Seller_ID, p_Brand, p_Stock, p_MRP);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddReview` (IN `p_Customer_ID` INT, IN `p_Product_ID` INT, IN `p_Rating` DECIMAL(2,1), IN `p_Description` TEXT)   BEGIN
    INSERT INTO review (Customer_ID, Product_ID, Rating, Description)
    VALUES (p_Customer_ID, p_Product_ID, p_Rating, p_Description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSeller` (IN `p_Seller_Name` VARCHAR(100), IN `p_Seller_Phone` VARCHAR(15), IN `p_Total_Sales` DECIMAL(10,2))   BEGIN
    INSERT INTO seller (Seller_Name, Seller_Phone, Total_Sales)
    VALUES (p_Seller_Name, p_Seller_Phone, p_Total_Sales);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddShipment` (IN `p_Order_ID` INT, IN `p_Agent_ID` INT, IN `p_Shipment_Date` DATE, IN `p_Expected_Delivery_Date` DATE, IN `p_Shipment_Status` VARCHAR(50))   BEGIN
    INSERT INTO shipment (Order_ID, Agent_ID, Shipment_Date, Expected_Delivery_Date, Shipment_Status)
    VALUES (p_Order_ID, p_Agent_ID, p_Shipment_Date, p_Expected_Delivery_Date, p_Shipment_Status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddWishlist` (IN `p_Customer_ID` INT, IN `p_Product_ID` INT, IN `p_Date_Added` DATE)   BEGIN
    INSERT INTO wishlist (Customer_ID, Product_ID, Date_Added)
    VALUES (p_Customer_ID, p_Product_ID, p_Date_Added);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CustomerPlaceOrder` (IN `p_Cart_ID` INT, IN `p_Customer_ID` INT, IN `p_Order_Amount` DECIMAL(10,2), IN `p_Order_Date` DATE, IN `p_Shipping_Date` DATE)   BEGIN
    -- Insert new order
    INSERT INTO `order` (Cart_ID, Customer_ID, Order_Amount, Order_Date, Shipping_Date, Order_Status)
    VALUES (p_Cart_ID, p_Customer_ID, p_Order_Amount, p_Order_Date, p_Shipping_Date, 'Pending');

    -- Update product stock based on cart
    UPDATE product
    SET Stock = Stock - (
        SELECT Quantity FROM cart WHERE cart.Product_ID = product.Product_ID AND Cart_ID = p_Cart_ID
    )
    WHERE Product_ID IN (SELECT Product_ID FROM cart WHERE Cart_ID = p_Cart_ID);

    -- Clear cart items
    DELETE FROM cart WHERE Cart_ID = p_Cart_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCustomer` (IN `p_Customer_ID` INT)   BEGIN
    -- Delete associated orders
    DELETE FROM `order` WHERE Customer_ID = p_Customer_ID;

    -- Delete associated cart
    DELETE FROM cart WHERE Customer_ID = p_Customer_ID;

    -- Delete associated address
    DELETE FROM address WHERE Customer_ID = p_Customer_ID;

    -- Finally, delete the customer
    DELETE FROM customer WHERE Customer_ID = p_Customer_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExpiredCoupons` ()   BEGIN
    DELETE FROM coupon
    WHERE Expiry_Date < CURDATE();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProduct` (IN `p_Product_ID` INT)   BEGIN
    DELETE FROM product
    WHERE Product_ID = p_Product_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FindActiveDiscounts` ()   BEGIN
    SELECT 
        d.Discount_ID, 
        p.Product_Name, 
        d.Discount_Percentage, 
        d.Start_Date, 
        d.End_Date
    FROM discount d
    JOIN product p ON d.Product_ID = p.Product_ID
    WHERE CURDATE() BETWEEN d.Start_Date AND d.End_Date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FindCustomersByCity` (IN `p_City` VARCHAR(50))   BEGIN
    SELECT 
        c.Customer_ID, 
        CONCAT(c.First_Name, ' ', c.Last_Name) AS Full_Name, 
        c.Email, 
        a.City
    FROM customer c
    JOIN address a ON c.Customer_ID = a.Customer_ID
    WHERE a.City = p_City;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FindLowStockProducts` (IN `p_Stock_Threshold` INT)   BEGIN
    SELECT 
        Product_ID, 
        Product_Name, 
        Stock
    FROM product
    WHERE Stock < p_Stock_Threshold
    ORDER BY Stock ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FindOrdersByStatus` (IN `p_Order_Status` VARCHAR(50))   BEGIN
    SELECT 
        o.Order_ID, 
        o.Order_Date, 
        o.Shipping_Date, 
        o.Order_Amount, 
        c.First_Name, 
        c.Last_Name
    FROM `order` o
    JOIN customer c ON o.Customer_ID = c.Customer_ID
    WHERE o.Order_Status = p_Order_Status
    ORDER BY o.Order_Date DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAgentPerformance` ()   BEGIN
    SELECT 
        da.Agent_ID, 
        da.Agent_Name, 
        COUNT(s.Shipment_ID) AS Total_Shipments, 
        SUM(o.Order_Amount) AS Total_Revenue
    FROM delivery_agent da
    JOIN shipment s ON da.Agent_ID = s.Agent_ID
    JOIN `order` o ON s.Order_ID = o.Order_ID
    GROUP BY da.Agent_ID, da.Agent_Name
    ORDER BY Total_Shipments DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAverageRating` (IN `p_Product_ID` INT)   BEGIN
    SELECT 
        AVG(r.Rating) AS Average_Rating, 
        COUNT(r.Review_ID) AS Total_Reviews
    FROM review r
    WHERE r.Product_ID = p_Product_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerOrderHistory` (IN `p_Customer_ID` INT)   BEGIN
    SELECT o.Order_ID, o.Order_Date, o.Order_Amount, o.Order_Status
    FROM `order` o
    WHERE o.Customer_ID = p_Customer_ID
    ORDER BY o.Order_Date DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMonthlySalesSummary` ()   BEGIN
    SELECT 
        YEAR(Order_Date) AS Year, 
        MONTH(Order_Date) AS Month, 
        SUM(Order_Amount) AS Total_Sales, 
        COUNT(Order_ID) AS Total_Orders
    FROM `order`
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
    ORDER BY Year DESC, Month DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMostPopularProducts` ()   BEGIN
    SELECT 
        p.Product_Name, 
        SUM(c.Quantity) AS Total_Quantity_Sold, 
        SUM(c.ItemTotal) AS Total_Revenue
    FROM cart c
    JOIN product p ON c.Product_ID = p.Product_ID
    GROUP BY p.Product_ID, p.Product_Name
    ORDER BY Total_Quantity_Sold DESC
    LIMIT 10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductsSoldBySeller` ()   BEGIN
    SELECT 
        s.Seller_ID, 
        s.Seller_Name, 
        COUNT(p.Product_ID) AS Total_Products, 
        SUM(c.Quantity) AS Total_Units_Sold, 
        SUM(c.ItemTotal) AS Total_Revenue
    FROM seller s
    JOIN product p ON s.Seller_ID = p.Seller_ID
    JOIN cart c ON p.Product_ID = c.Product_ID
    GROUP BY s.Seller_ID, s.Seller_Name
    ORDER BY Total_Revenue DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSalesByCategory` ()   BEGIN
    SELECT 
        c.Category_Name, 
        SUM(o.Order_Amount) AS Total_Sales
    FROM `order` o
    JOIN cart ca ON o.Cart_ID = ca.Cart_ID
    JOIN product p ON ca.Product_ID = p.Product_ID
    JOIN category c ON p.Category_ID = c.Category_ID
    GROUP BY c.Category_Name
    ORDER BY Total_Sales DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalSalesBySeller` (IN `p_Seller_ID` INT)   BEGIN
    SELECT SUM(Order_Amount) AS Total_Sales
    FROM `order`
    WHERE Customer_ID IN (
        SELECT Customer_ID FROM product WHERE Seller_ID = p_Seller_ID
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProductsByCategory` (IN `p_Category_ID` INT)   BEGIN
    SELECT Product_ID, Product_Name, MRP
    FROM product
    WHERE Category_ID = p_Category_ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `abandonedcarts`
-- (See below for the actual view)
--
CREATE TABLE `abandonedcarts` (
`Cart_ID` int(11)
,`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Cart_Total` decimal(32,2)
,`GrandTotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `activecoupons`
-- (See below for the actual view)
--
CREATE TABLE `activecoupons` (
`Coupon_Code` varchar(20)
,`Discount_Value` decimal(10,2)
,`Expiry_Date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Apartment_Name` varchar(255) DEFAULT NULL,
  `Apart_No` varchar(50) DEFAULT NULL,
  `Street_Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Customer_ID`, `Apartment_Name`, `Apart_No`, `Street_Name`, `City`) VALUES
(1, 1, 'Heritage Apartments', '101', 'Maple Street', 'New York'),
(2, 2, 'Craftsman Villa', '202', 'Oak Avenue', 'Los Angeles'),
(3, 3, 'Artisan Heights', '303', 'Pine Lane', 'Chicago'),
(4, 4, 'Vintage Residency', '404', 'Elm Drive', 'Houston'),
(5, 5, 'Antique Suites', '505', 'Cedar Court', 'San Francisco'),
(6, 6, 'Golden Era Homes', '606', 'Birch Boulevard', 'Seattle'),
(7, 7, 'Handmade Estates', '707', 'Ash Road', 'Boston'),
(8, 8, 'Timeless Towers', '808', 'Spruce Circle', 'Dallas'),
(9, 9, 'Collector\'s Haven', '909', 'Willow Place', 'Denver'),
(10, 10, 'Elegant Retreat', '1010', 'Cherry Path', 'Miami');

-- --------------------------------------------------------

--
-- Stand-in structure for view `agentperformance`
-- (See below for the actual view)
--
CREATE TABLE `agentperformance` (
`Agent_ID` int(11)
,`Agent_Name` varchar(100)
,`Vehicle_Type` varchar(50)
,`Total_Shipments` bigint(21)
,`Delivered_Shipments` decimal(22,0)
,`Pending_Shipments` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ItemTotal` decimal(10,2) DEFAULT NULL,
  `GrandTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `Customer_ID`, `Product_ID`, `Quantity`, `ItemTotal`, `GrandTotal`) VALUES
(1, 1, 1, 2, 240.00, 480.00),
(2, 2, 3, 1, 300.00, 300.00),
(3, 3, 2, 3, 450.00, 1350.00),
(4, 4, 4, 1, 700.00, 700.00),
(5, 5, 5, 2, 350.00, 700.00);

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `AfterCartInsert` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
    DECLARE v_GrandTotal DECIMAL(10, 2);

    -- Calculate the new GrandTotal
    SELECT SUM(ItemTotal) INTO v_GrandTotal
    FROM cart
    WHERE Cart_ID = NEW.Cart_ID;

    -- Update the GrandTotal for the cart
    UPDATE cart
    SET GrandTotal = v_GrandTotal
    WHERE Cart_ID = NEW.Cart_ID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterCartUpdate` AFTER UPDATE ON `cart` FOR EACH ROW BEGIN
    DECLARE v_GrandTotal DECIMAL(10, 2);

    -- Calculate the updated GrandTotal
    SELECT SUM(ItemTotal) INTO v_GrandTotal
    FROM cart
    WHERE Cart_ID = NEW.Cart_ID;

    -- Update the GrandTotal for the cart
    UPDATE cart
    SET GrandTotal = v_GrandTotal
    WHERE Cart_ID = NEW.Cart_ID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeCartInsert` BEFORE INSERT ON `cart` FOR EACH ROW BEGIN
    DECLARE v_CurrentStock INT;

    SELECT Stock INTO v_CurrentStock
    FROM product
    WHERE Product_ID = NEW.Product_ID;

    IF v_CurrentStock < NEW.Quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock for the selected product';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`, `Description`) VALUES
(1, 'Antiques', 'Unique, collectible items with historical significance or cultural value'),
(2, 'Handicrafts', 'Artisan-made items showcasing traditional craftsmanship'),
(3, 'Vintage Furniture', 'Antique and classic furniture pieces for decor'),
(4, 'Ceramics', 'Handmade ceramic pottery and porcelain items'),
(5, 'Jewelry', 'Handcrafted and antique jewelry items'),
(6, 'Textiles', 'Traditional handwoven fabrics and rugs'),
(7, 'Paintings', 'Antique and modern handcrafted art pieces'),
(8, 'Sculptures', 'Unique stone, wood, or metal sculptures'),
(9, 'Glassware', 'Decorative and collectible glass artifacts'),
(10, 'Books', 'Antique books and rare literary works');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `Coupon_ID` int(11) NOT NULL,
  `Coupon_Code` varchar(20) NOT NULL,
  `Discount_Value` decimal(10,2) NOT NULL,
  `Expiry_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`Coupon_ID`, `Coupon_Code`, `Discount_Value`, `Expiry_Date`) VALUES
(1, 'SAVE10', 10.00, '2024-12-31'),
(2, 'DISCOUNT15', 15.00, '2024-11-30'),
(3, 'WELCOME20', 20.00, '2024-11-25'),
(4, 'FREESHIP', 5.00, '2024-12-15'),
(5, 'FIRSTBUY', 12.00, '2024-12-01');

--
-- Triggers `coupon`
--
DELIMITER $$
CREATE TRIGGER `AfterCouponInsert` AFTER INSERT ON `coupon` FOR EACH ROW BEGIN
    IF NEW.Expiry_Date < CURDATE() THEN
        DELETE FROM coupon WHERE Coupon_ID = NEW.Coupon_ID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `First_Name`, `Last_Name`, `Email`, `Phone`, `Age`, `DOB`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 30, '1993-05-10'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '1234567891', 28, '1995-07-20'),
(3, 'Alice', 'Brown', 'alice.brown@example.com', '1234567892', 35, '1988-09-15'),
(4, 'Bob', 'Johnson', 'bob.johnson@example.com', '1234567893', 40, '1983-03-22'),
(5, 'Emma', 'Wilson', 'emma.wilson@example.com', '1234567894', 25, '1998-12-10'),
(6, 'Charlie', 'Davis', 'charlie.davis@example.com', '1234567895', 32, '1991-01-30'),
(7, 'Mia', 'Clark', 'mia.clark@example.com', '1234567896', 27, '1996-06-18'),
(8, 'Liam', 'Lewis', 'liam.lewis@example.com', '1234567897', 29, '1994-04-05'),
(9, 'Sophia', 'Walker', 'sophia.walker@example.com', '1234567898', 33, '1990-11-11'),
(10, 'James', 'Hall', 'james.hall@example.com', '1234567899', 45, '1978-08-08');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `BeforeCustomerInsert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM customer WHERE Email = NEW.Email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate email address is not allowed.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerorders`
-- (See below for the actual view)
--
CREATE TABLE `customerorders` (
`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Email` varchar(255)
,`Total_Orders` bigint(21)
,`Total_Spent` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerwishlist`
-- (See below for the actual view)
--
CREATE TABLE `customerwishlist` (
`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Product_Name` varchar(255)
,`MRP` decimal(10,2)
,`Date_Added` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dailysalesreport`
-- (See below for the actual view)
--
CREATE TABLE `dailysalesreport` (
`Sale_Date` date
,`Total_Orders` bigint(21)
,`Total_Revenue` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_agent`
--

CREATE TABLE `delivery_agent` (
  `Agent_ID` int(11) NOT NULL,
  `Agent_Name` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Vehicle_Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_agent`
--

INSERT INTO `delivery_agent` (`Agent_ID`, `Agent_Name`, `Phone`, `Vehicle_Type`) VALUES
(1, 'John Doe', '1234567890', 'Bike'),
(2, 'Alice Smith', '1234567891', 'Van'),
(3, 'Robert Brown', '1234567892', 'Car'),
(4, 'Emma Davis', '1234567893', 'Truck'),
(5, 'James Wilson', '1234567894', 'Bike');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `Discount_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Discount_Percentage` decimal(5,2) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`Discount_ID`, `Product_ID`, `Discount_Percentage`, `Start_Date`, `End_Date`) VALUES
(1, 1, 10.00, '2024-11-01', '2024-11-10'),
(2, 2, 15.00, '2024-11-05', '2024-11-15'),
(3, 3, 20.00, '2024-11-10', '2024-11-20'),
(4, 4, 25.00, '2024-11-15', '2024-11-25'),
(5, 5, 5.00, '2024-11-20', '2024-11-30');

--
-- Triggers `discount`
--
DELIMITER $$
CREATE TRIGGER `BeforeDiscountInsert` BEFORE INSERT ON `discount` FOR EACH ROW BEGIN
    IF NEW.Start_Date > NEW.End_Date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Discount start date must be before the end date.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `discountedproducts`
-- (See below for the actual view)
--
CREATE TABLE `discountedproducts` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`MRP` decimal(10,2)
,`Discount_Percentage` decimal(5,2)
,`Discounted_Price` decimal(15,2)
,`Start_Date` date
,`End_Date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `expireddiscounts`
-- (See below for the actual view)
--
CREATE TABLE `expireddiscounts` (
`Discount_ID` int(11)
,`Product_Name` varchar(255)
,`Discount_Percentage` decimal(5,2)
,`End_Date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Feedback_Text` text NOT NULL,
  `Feedback_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Feedback_ID`, `Customer_ID`, `Feedback_Text`, `Feedback_Date`) VALUES
(1, 1, 'Great shopping experience!', '2024-11-16'),
(2, 2, 'Fast delivery and good quality.', '2024-11-15'),
(3, 3, 'Loved the product range.', '2024-11-14'),
(4, 4, 'Customer service was excellent.', '2024-11-13'),
(5, 5, 'Affordable prices.', '2024-11-12');

--
-- Triggers `feedback`
--
DELIMITER $$
CREATE TRIGGER `AfterFeedbackInsert` AFTER INSERT ON `feedback` FOR EACH ROW BEGIN
    INSERT INTO feedback_log (Feedback_ID, Customer_ID, Feedback_Text, Feedback_Date)
    VALUES (NEW.Feedback_ID, NEW.Customer_ID, NEW.Feedback_Text, NEW.Feedback_Date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterFeedbackInsertArchive` AFTER INSERT ON `feedback` FOR EACH ROW BEGIN
    DELETE FROM feedback
    WHERE Feedback_Date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

    -- Move deleted feedback to the archive table
    INSERT INTO feedback_archive (Feedback_ID, Customer_ID, Feedback_Text, Feedback_Date)
    SELECT Feedback_ID, Customer_ID, Feedback_Text, Feedback_Date
    FROM feedback
    WHERE Feedback_Date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `feedbacksummary`
-- (See below for the actual view)
--
CREATE TABLE `feedbacksummary` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`Total_Reviews` bigint(21)
,`Average_Rating` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `highdemandproducts`
-- (See below for the actual view)
--
CREATE TABLE `highdemandproducts` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`Category_Name` varchar(255)
,`Total_Purchases` bigint(21)
,`Total_Quantity_Sold` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `inactivecustomers`
-- (See below for the actual view)
--
CREATE TABLE `inactivecustomers` (
`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Email` varchar(255)
,`Last_Order_Date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Quantity_In_Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Inventory_ID`, `Product_ID`, `Location`, `Quantity_In_Stock`) VALUES
(1, 1, 'Warehouse A', 50),
(2, 2, 'Warehouse B', 100),
(3, 3, 'Warehouse C', 30),
(4, 4, 'Warehouse D', 75),
(5, 5, 'Warehouse E', 25);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lowstockalerts`
-- (See below for the actual view)
--
CREATE TABLE `lowstockalerts` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`Stock` int(11)
,`Alert_Level` varchar(9)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Notification_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `User_Type` enum('Customer','Seller') NOT NULL,
  `Notification_Text` text NOT NULL,
  `Notification_Date` datetime NOT NULL,
  `Is_Read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Notification_ID`, `User_ID`, `User_Type`, `Notification_Text`, `Notification_Date`, `Is_Read`) VALUES
(1, 1, 'Customer', 'Your order #101 has been shipped!', '2024-11-18 10:00:00', 0),
(2, 2, 'Seller', 'You received a new order #102.', '2024-11-18 10:05:00', 0),
(3, 3, 'Customer', 'Your payment for order #103 was successful.', '2024-11-18 10:10:00', 1),
(4, 4, 'Seller', 'Your product #201 received a 5-star review.', '2024-11-18 11:00:00', 1),
(5, 5, 'Customer', 'Your refund for order #104 has been processed.', '2024-11-18 12:00:00', 0);

--
-- Triggers `notification`
--
DELIMITER $$
CREATE TRIGGER `AfterNotificationUpdate` AFTER UPDATE ON `notification` FOR EACH ROW BEGIN
    IF NEW.Is_Read = 1 THEN
        UPDATE notification
        SET Notification_Text = CONCAT('Read: ', Notification_Text)
        WHERE Notification_ID = NEW.Notification_ID;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeNotificationInsert` BEFORE INSERT ON `notification` FOR EACH ROW BEGIN
    IF NEW.Is_Read IS NULL THEN
        SET NEW.Is_Read = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL,
  `Cart_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Order_Amount` decimal(10,2) DEFAULT NULL,
  `Order_Date` date DEFAULT NULL,
  `Shipping_Date` date DEFAULT NULL,
  `Order_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_ID`, `Cart_ID`, `Customer_ID`, `Order_Amount`, `Order_Date`, `Shipping_Date`, `Order_Status`) VALUES
(1, NULL, 1, 1200.00, '2024-11-15', '2024-11-17', 'Delivered'),
(2, NULL, 2, 800.00, '2024-11-14', '2024-11-18', 'Shipped'),
(3, NULL, 3, 2500.00, '2024-11-13', '2024-11-16', 'Delivered'),
(4, NULL, 4, 1500.00, '2024-11-12', '2024-11-15', 'Shipped'),
(5, NULL, 5, 3500.00, '2024-11-11', '2024-11-14', 'Delivered');

--
-- Triggers `order`
--
DELIMITER $$
CREATE TRIGGER `AfterOrderInsert` AFTER INSERT ON `order` FOR EACH ROW BEGIN
    DECLARE v_Product_ID INT;
    DECLARE v_Quantity INT;
    
    -- Loop through the cart items associated with the order
    DECLARE cart_cursor CURSOR FOR 
        SELECT Product_ID, Quantity FROM cart WHERE Cart_ID = NEW.Cart_ID;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_Product_ID = NULL;

    OPEN cart_cursor;

    FETCH cart_cursor INTO v_Product_ID, v_Quantity;

    WHILE v_Product_ID IS NOT NULL DO
        -- Update stock for each product
        UPDATE product
        SET Stock = Stock - v_Quantity
        WHERE Product_ID = v_Product_ID;

        FETCH cart_cursor INTO v_Product_ID, v_Quantity;
    END WHILE;

    CLOSE cart_cursor;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterOrderInsertUpdateSeller` AFTER INSERT ON `order` FOR EACH ROW BEGIN
    DECLARE v_Product_ID INT;
    DECLARE v_Seller_ID INT;
    DECLARE v_ItemTotal DECIMAL(10, 2);

    -- Cursor to iterate over products in the cart
    DECLARE product_cursor CURSOR FOR 
        SELECT Product_ID, Quantity, ItemTotal 
        FROM cart 
        WHERE Cart_ID = NEW.Cart_ID;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_Product_ID = NULL;

    OPEN product_cursor;

    FETCH product_cursor INTO v_Product_ID, v_ItemTotal;

    WHILE v_Product_ID IS NOT NULL DO
        -- Get Seller ID for the product
        SELECT Seller_ID INTO v_Seller_ID
        FROM product
        WHERE Product_ID = v_Product_ID;

        -- Update the seller's total sales
        UPDATE seller
        SET Total_Sales = Total_Sales + v_ItemTotal
        WHERE Seller_ID = v_Seller_ID;

        FETCH product_cursor INTO v_Product_ID, v_ItemTotal;
    END WHILE;

    CLOSE product_cursor;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeOrderInsert` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
    DECLARE v_CartTotal DECIMAL(10, 2);

    -- Calculate the total amount from the cart
    SELECT GrandTotal INTO v_CartTotal
    FROM cart
    WHERE Cart_ID = NEW.Cart_ID;

    -- Check if the order amount matches the cart total
    IF NEW.Order_Amount != v_CartTotal THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order amount does not match the cart total.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeOrderInsertDefaultStatus` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
    IF NEW.Order_Status IS NULL THEN
        SET NEW.Order_Status = 'Pending';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeOrderUpdate` BEFORE UPDATE ON `order` FOR EACH ROW BEGIN
    IF NEW.Order_Status = 'Completed' THEN
        IF NOT EXISTS (
            SELECT 1 
            FROM payment 
            WHERE Order_ID = NEW.Order_ID
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Order cannot be marked as completed without payment.';
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderdetails`
-- (See below for the actual view)
--
CREATE TABLE `orderdetails` (
`Order_ID` int(11)
,`Order_Date` date
,`Customer_Name` varchar(511)
,`Product_Name` varchar(255)
,`Quantity` int(11)
,`ItemTotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersawaitingpayment`
-- (See below for the actual view)
--
CREATE TABLE `ordersawaitingpayment` (
`Order_ID` int(11)
,`Order_Date` date
,`Order_Amount` decimal(10,2)
,`Customer_Name` varchar(511)
,`Email` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderstatussummary`
-- (See below for the actual view)
--
CREATE TABLE `orderstatussummary` (
`Order_Status` varchar(50)
,`Total_Orders` bigint(21)
,`Total_Revenue` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Payment_Mode` varchar(50) DEFAULT NULL,
  `DateOfPayment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Order_ID`, `Customer_ID`, `Payment_Mode`, `DateOfPayment`) VALUES
(1, 1, 1, 'Credit Card', '2024-11-15'),
(2, 2, 2, 'PayPal', '2024-11-14'),
(3, 3, 3, 'Cash', '2024-11-13'),
(4, 4, 4, 'Credit Card', '2024-11-12'),
(5, 5, 5, 'Debit Card', '2024-11-11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pendingshipments`
-- (See below for the actual view)
--
CREATE TABLE `pendingshipments` (
`Shipment_ID` int(11)
,`Order_ID` int(11)
,`Customer_Name` varchar(511)
,`Shipment_Status` varchar(50)
,`Expected_Delivery_Date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `popularcategories`
-- (See below for the actual view)
--
CREATE TABLE `popularcategories` (
`Category_ID` int(11)
,`Category_Name` varchar(255)
,`Total_Products_Sold` bigint(21)
,`Total_Quantity_Sold` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Name` varchar(255) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Seller_ID` int(11) DEFAULT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `MRP` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Category_ID`, `Seller_ID`, `Brand`, `Stock`, `MRP`) VALUES
(1, 'Victorian Mirror', 1, 1, 'Classic', 15, 1200.00),
(2, 'Handwoven Rug', 2, 2, 'ArtisanWeave', 20, 800.00),
(3, 'Vintage Clock', 1, 3, 'Timeless', 10, 1500.00),
(4, 'Ceramic Vase', 2, 4, 'HeritagePottery', 25, 600.00),
(5, 'Handcrafted Necklace', 2, 5, 'ElegantJewels', 18, 1000.00),
(6, 'Antique Chair', 3, 6, 'VintageFurni', 8, 2500.00),
(7, 'Rare Painting', 7, 7, 'Collector\'s Art', 5, 3500.00),
(8, 'Stone Sculpture', 8, 8, 'ArtisanCarve', 12, 3000.00),
(9, 'Glass Centerpiece', 9, 9, 'TimelessGlass', 20, 1200.00),
(10, 'Old Manuscript', 10, 10, 'AntiquePages', 7, 2000.00);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `AfterStockUpdate` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
    IF NEW.Stock < 5 THEN
        INSERT INTO notification (User_ID, User_Type, Notification_Text, Notification_Date, Is_Read)
        VALUES (1, 'Admin', CONCAT('Stock for product ', NEW.Product_Name, ' is running low!'), NOW(), 0);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeProductDelete` BEFORE DELETE ON `product` FOR EACH ROW BEGIN
    IF OLD.Stock > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a product with stock remaining.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeStockUpdate` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
    IF NEW.Stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `productstock`
-- (See below for the actual view)
--
CREATE TABLE `productstock` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`Brand` varchar(255)
,`Category_Name` varchar(255)
,`Stock` int(11)
,`Stock_Status` varchar(9)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `recentorders`
-- (See below for the actual view)
--
CREATE TABLE `recentorders` (
`Order_ID` int(11)
,`Order_Date` date
,`Customer_Name` varchar(511)
,`Order_Amount` decimal(10,2)
,`Order_Status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `revenuebycategory`
-- (See below for the actual view)
--
CREATE TABLE `revenuebycategory` (
`Category_ID` int(11)
,`Category_Name` varchar(255)
,`Total_Revenue` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `revenuebycustomer`
-- (See below for the actual view)
--
CREATE TABLE `revenuebycustomer` (
`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Email` varchar(255)
,`Total_Revenue` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_ID`, `Customer_ID`, `Product_ID`, `Rating`, `Description`) VALUES
(1, 1, 1, 5, 'Amazing product! Great quality.'),
(2, 3, 3, 4, 'Excellent craftsmanship and detail.'),
(3, 5, 5, 5, 'Totally worth the price. Beautiful!');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `Seller_ID` int(11) NOT NULL,
  `Seller_Name` varchar(255) DEFAULT NULL,
  `Seller_Phone` varchar(15) DEFAULT NULL,
  `Total_Sales` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`Seller_ID`, `Seller_Name`, `Seller_Phone`, `Total_Sales`) VALUES
(1, 'Classic Antiques', '1234567890', 15000.00),
(2, 'Heritage Crafts', '1234567891', 20000.50),
(3, 'Timeless Treasures', '1234567892', 18000.75),
(4, 'Artisan Delight', '1234567893', 22000.20),
(5, 'Vintage Vault', '1234567894', 17000.00),
(6, 'Handmade Wonders', '1234567895', 19000.60),
(7, 'Collector\'s Paradise', '1234567896', 23000.80),
(8, 'Craftsmen\'s Guild', '1234567897', 16000.45),
(9, 'Elegant Handicrafts', '1234567898', 25000.90),
(10, 'Antique Bazaar', '1234567899', 24000.30);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sellerperformance`
-- (See below for the actual view)
--
CREATE TABLE `sellerperformance` (
`Seller_ID` int(11)
,`Seller_Name` varchar(255)
,`Total_Products_Listed` bigint(21)
,`Total_Sales` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `Shipment_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Agent_ID` int(11) NOT NULL,
  `Shipment_Date` date NOT NULL,
  `Expected_Delivery_Date` date NOT NULL,
  `Shipment_Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`Shipment_ID`, `Order_ID`, `Agent_ID`, `Shipment_Date`, `Expected_Delivery_Date`, `Shipment_Status`) VALUES
(1, 1, 1, '2024-11-15', '2024-11-17', 'Delivered'),
(2, 2, 2, '2024-11-14', '2024-11-18', 'In Transit'),
(3, 3, 3, '2024-11-13', '2024-11-16', 'Delivered'),
(4, 4, 4, '2024-11-12', '2024-11-15', 'In Transit'),
(5, 5, 5, '2024-11-11', '2024-11-14', 'Delivered');

--
-- Triggers `shipment`
--
DELIMITER $$
CREATE TRIGGER `AfterShipmentUpdate` AFTER UPDATE ON `shipment` FOR EACH ROW BEGIN
    IF NEW.Shipment_Status != OLD.Shipment_Status THEN
        INSERT INTO notification (User_ID, User_Type, Notification_Text, Notification_Date, Is_Read)
        VALUES (
            (SELECT Customer_ID FROM `order` WHERE Order_ID = NEW.Order_ID),
            'Customer',
            CONCAT('Your shipment status has been updated to: ', NEW.Shipment_Status),
            NOW(),
            0
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `topcustomers`
-- (See below for the actual view)
--
CREATE TABLE `topcustomers` (
`Customer_ID` int(11)
,`Customer_Name` varchar(511)
,`Email` varchar(255)
,`Total_Spent` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `Wishlist_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Date_Added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`Wishlist_ID`, `Customer_ID`, `Product_ID`, `Date_Added`) VALUES
(1, 1, 1, '2024-11-01'),
(2, 2, 2, '2024-11-02'),
(3, 3, 3, '2024-11-03'),
(4, 4, 4, '2024-11-04'),
(5, 5, 5, '2024-11-05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `wishlistpopularity`
-- (See below for the actual view)
--
CREATE TABLE `wishlistpopularity` (
`Product_ID` int(11)
,`Product_Name` varchar(255)
,`Times_Wishlisted` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `abandonedcarts`
--
DROP TABLE IF EXISTS `abandonedcarts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `abandonedcarts`  AS SELECT `ct`.`Cart_ID` AS `Cart_ID`, `ct`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, sum(`ct`.`ItemTotal`) AS `Cart_Total`, `ct`.`GrandTotal` AS `GrandTotal` FROM ((`cart` `ct` left join `order` `o` on(`ct`.`Cart_ID` = `o`.`Cart_ID`)) join `customer` `c` on(`ct`.`Customer_ID` = `c`.`Customer_ID`)) WHERE `o`.`Order_ID` is null GROUP BY `ct`.`Cart_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `activecoupons`
--
DROP TABLE IF EXISTS `activecoupons`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activecoupons`  AS SELECT `coupon`.`Coupon_Code` AS `Coupon_Code`, `coupon`.`Discount_Value` AS `Discount_Value`, `coupon`.`Expiry_Date` AS `Expiry_Date` FROM `coupon` WHERE curdate() <= `coupon`.`Expiry_Date` ;

-- --------------------------------------------------------

--
-- Structure for view `agentperformance`
--
DROP TABLE IF EXISTS `agentperformance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agentperformance`  AS SELECT `da`.`Agent_ID` AS `Agent_ID`, `da`.`Agent_Name` AS `Agent_Name`, `da`.`Vehicle_Type` AS `Vehicle_Type`, count(`s`.`Shipment_ID`) AS `Total_Shipments`, sum(case when `s`.`Shipment_Status` = 'Delivered' then 1 else 0 end) AS `Delivered_Shipments`, sum(case when `s`.`Shipment_Status` <> 'Delivered' then 1 else 0 end) AS `Pending_Shipments` FROM (`delivery_agent` `da` left join `shipment` `s` on(`da`.`Agent_ID` = `s`.`Agent_ID`)) GROUP BY `da`.`Agent_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `customerorders`
--
DROP TABLE IF EXISTS `customerorders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerorders`  AS SELECT `c`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `c`.`Email` AS `Email`, count(`o`.`Order_ID`) AS `Total_Orders`, sum(`o`.`Order_Amount`) AS `Total_Spent` FROM (`customer` `c` left join `order` `o` on(`c`.`Customer_ID` = `o`.`Customer_ID`)) GROUP BY `c`.`Customer_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `customerwishlist`
--
DROP TABLE IF EXISTS `customerwishlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerwishlist`  AS SELECT `w`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `p`.`Product_Name` AS `Product_Name`, `p`.`MRP` AS `MRP`, `w`.`Date_Added` AS `Date_Added` FROM ((`wishlist` `w` join `customer` `c` on(`w`.`Customer_ID` = `c`.`Customer_ID`)) join `product` `p` on(`w`.`Product_ID` = `p`.`Product_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `dailysalesreport`
--
DROP TABLE IF EXISTS `dailysalesreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dailysalesreport`  AS SELECT cast(`o`.`Order_Date` as date) AS `Sale_Date`, count(`o`.`Order_ID`) AS `Total_Orders`, sum(`o`.`Order_Amount`) AS `Total_Revenue` FROM `order` AS `o` GROUP BY cast(`o`.`Order_Date` as date) ORDER BY cast(`o`.`Order_Date` as date) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `discountedproducts`
--
DROP TABLE IF EXISTS `discountedproducts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discountedproducts`  AS SELECT `p`.`Product_ID` AS `Product_ID`, `p`.`Product_Name` AS `Product_Name`, `p`.`MRP` AS `MRP`, `d`.`Discount_Percentage` AS `Discount_Percentage`, round(`p`.`MRP` * (1 - `d`.`Discount_Percentage` / 100),2) AS `Discounted_Price`, `d`.`Start_Date` AS `Start_Date`, `d`.`End_Date` AS `End_Date` FROM (`product` `p` join `discount` `d` on(`p`.`Product_ID` = `d`.`Product_ID`)) WHERE curdate() between `d`.`Start_Date` and `d`.`End_Date` ;

-- --------------------------------------------------------

--
-- Structure for view `expireddiscounts`
--
DROP TABLE IF EXISTS `expireddiscounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `expireddiscounts`  AS SELECT `d`.`Discount_ID` AS `Discount_ID`, `p`.`Product_Name` AS `Product_Name`, `d`.`Discount_Percentage` AS `Discount_Percentage`, `d`.`End_Date` AS `End_Date` FROM (`discount` `d` join `product` `p` on(`d`.`Product_ID` = `p`.`Product_ID`)) WHERE `d`.`End_Date` < curdate() ;

-- --------------------------------------------------------

--
-- Structure for view `feedbacksummary`
--
DROP TABLE IF EXISTS `feedbacksummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `feedbacksummary`  AS SELECT `p`.`Product_ID` AS `Product_ID`, `p`.`Product_Name` AS `Product_Name`, count(`r`.`Review_ID`) AS `Total_Reviews`, avg(`r`.`Rating`) AS `Average_Rating` FROM (`product` `p` left join `review` `r` on(`p`.`Product_ID` = `r`.`Product_ID`)) GROUP BY `p`.`Product_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `highdemandproducts`
--
DROP TABLE IF EXISTS `highdemandproducts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `highdemandproducts`  AS SELECT `p`.`Product_ID` AS `Product_ID`, `p`.`Product_Name` AS `Product_Name`, `c`.`Category_Name` AS `Category_Name`, count(`ct`.`Product_ID`) AS `Total_Purchases`, sum(`ct`.`Quantity`) AS `Total_Quantity_Sold` FROM ((`product` `p` join `cart` `ct` on(`p`.`Product_ID` = `ct`.`Product_ID`)) join `category` `c` on(`p`.`Category_ID` = `c`.`Category_ID`)) GROUP BY `p`.`Product_ID` ORDER BY sum(`ct`.`Quantity`) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Structure for view `inactivecustomers`
--
DROP TABLE IF EXISTS `inactivecustomers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inactivecustomers`  AS SELECT `c`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `c`.`Email` AS `Email`, max(`o`.`Order_Date`) AS `Last_Order_Date` FROM (`customer` `c` left join `order` `o` on(`c`.`Customer_ID` = `o`.`Customer_ID`)) GROUP BY `c`.`Customer_ID` HAVING max(`o`.`Order_Date`) < curdate() - interval 6 month OR max(`o`.`Order_Date`) is null ;

-- --------------------------------------------------------

--
-- Structure for view `lowstockalerts`
--
DROP TABLE IF EXISTS `lowstockalerts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lowstockalerts`  AS SELECT `product`.`Product_ID` AS `Product_ID`, `product`.`Product_Name` AS `Product_Name`, `product`.`Stock` AS `Stock`, CASE WHEN `product`.`Stock` < 5 THEN 'Critical' ELSE 'Low Stock' END AS `Alert_Level` FROM `product` WHERE `product`.`Stock` < 10 ;

-- --------------------------------------------------------

--
-- Structure for view `orderdetails`
--
DROP TABLE IF EXISTS `orderdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderdetails`  AS SELECT `o`.`Order_ID` AS `Order_ID`, `o`.`Order_Date` AS `Order_Date`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `p`.`Product_Name` AS `Product_Name`, `ct`.`Quantity` AS `Quantity`, `ct`.`ItemTotal` AS `ItemTotal` FROM (((`order` `o` join `cart` `ct` on(`o`.`Cart_ID` = `ct`.`Cart_ID`)) join `product` `p` on(`ct`.`Product_ID` = `p`.`Product_ID`)) join `customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersawaitingpayment`
--
DROP TABLE IF EXISTS `ordersawaitingpayment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersawaitingpayment`  AS SELECT `o`.`Order_ID` AS `Order_ID`, `o`.`Order_Date` AS `Order_Date`, `o`.`Order_Amount` AS `Order_Amount`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `c`.`Email` AS `Email` FROM ((`order` `o` left join `payment` `p` on(`o`.`Order_ID` = `p`.`Order_ID`)) join `customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) WHERE `p`.`Payment_ID` is null ;

-- --------------------------------------------------------

--
-- Structure for view `orderstatussummary`
--
DROP TABLE IF EXISTS `orderstatussummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderstatussummary`  AS SELECT `o`.`Order_Status` AS `Order_Status`, count(`o`.`Order_ID`) AS `Total_Orders`, sum(`o`.`Order_Amount`) AS `Total_Revenue` FROM `order` AS `o` GROUP BY `o`.`Order_Status` ;

-- --------------------------------------------------------

--
-- Structure for view `pendingshipments`
--
DROP TABLE IF EXISTS `pendingshipments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pendingshipments`  AS SELECT `s`.`Shipment_ID` AS `Shipment_ID`, `o`.`Order_ID` AS `Order_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `s`.`Shipment_Status` AS `Shipment_Status`, `s`.`Expected_Delivery_Date` AS `Expected_Delivery_Date` FROM ((`shipment` `s` join `order` `o` on(`s`.`Order_ID` = `o`.`Order_ID`)) join `customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) WHERE `s`.`Shipment_Status` <> 'Delivered' ;

-- --------------------------------------------------------

--
-- Structure for view `popularcategories`
--
DROP TABLE IF EXISTS `popularcategories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popularcategories`  AS SELECT `cat`.`Category_ID` AS `Category_ID`, `cat`.`Category_Name` AS `Category_Name`, count(`ct`.`Product_ID`) AS `Total_Products_Sold`, sum(`ct`.`Quantity`) AS `Total_Quantity_Sold` FROM ((`category` `cat` join `product` `p` on(`cat`.`Category_ID` = `p`.`Category_ID`)) join `cart` `ct` on(`p`.`Product_ID` = `ct`.`Product_ID`)) GROUP BY `cat`.`Category_ID` ORDER BY sum(`ct`.`Quantity`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `productstock`
--
DROP TABLE IF EXISTS `productstock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productstock`  AS SELECT `p`.`Product_ID` AS `Product_ID`, `p`.`Product_Name` AS `Product_Name`, `p`.`Brand` AS `Brand`, `c`.`Category_Name` AS `Category_Name`, `p`.`Stock` AS `Stock`, CASE WHEN `p`.`Stock` < 5 THEN 'Low Stock' ELSE 'In Stock' END AS `Stock_Status` FROM (`product` `p` left join `category` `c` on(`p`.`Category_ID` = `c`.`Category_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `recentorders`
--
DROP TABLE IF EXISTS `recentorders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recentorders`  AS SELECT `o`.`Order_ID` AS `Order_ID`, `o`.`Order_Date` AS `Order_Date`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `o`.`Order_Amount` AS `Order_Amount`, `o`.`Order_Status` AS `Order_Status` FROM (`order` `o` join `customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) WHERE `o`.`Order_Date` >= curdate() - interval 30 day ORDER BY `o`.`Order_Date` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `revenuebycategory`
--
DROP TABLE IF EXISTS `revenuebycategory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `revenuebycategory`  AS SELECT `cat`.`Category_ID` AS `Category_ID`, `cat`.`Category_Name` AS `Category_Name`, sum(`o`.`Order_Amount`) AS `Total_Revenue` FROM (((`category` `cat` join `product` `p` on(`cat`.`Category_ID` = `p`.`Category_ID`)) join `cart` `ct` on(`p`.`Product_ID` = `ct`.`Product_ID`)) join `order` `o` on(`ct`.`Cart_ID` = `o`.`Cart_ID`)) GROUP BY `cat`.`Category_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `revenuebycustomer`
--
DROP TABLE IF EXISTS `revenuebycustomer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `revenuebycustomer`  AS SELECT `c`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `c`.`Email` AS `Email`, sum(`o`.`Order_Amount`) AS `Total_Revenue` FROM (`customer` `c` join `order` `o` on(`c`.`Customer_ID` = `o`.`Customer_ID`)) GROUP BY `c`.`Customer_ID` ORDER BY sum(`o`.`Order_Amount`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `sellerperformance`
--
DROP TABLE IF EXISTS `sellerperformance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sellerperformance`  AS SELECT `s`.`Seller_ID` AS `Seller_ID`, `s`.`Seller_Name` AS `Seller_Name`, count(`p`.`Product_ID`) AS `Total_Products_Listed`, `s`.`Total_Sales` AS `Total_Sales` FROM (`seller` `s` left join `product` `p` on(`s`.`Seller_ID` = `p`.`Seller_ID`)) GROUP BY `s`.`Seller_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `topcustomers`
--
DROP TABLE IF EXISTS `topcustomers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topcustomers`  AS SELECT `c`.`Customer_ID` AS `Customer_ID`, concat(`c`.`First_Name`,' ',`c`.`Last_Name`) AS `Customer_Name`, `c`.`Email` AS `Email`, sum(`o`.`Order_Amount`) AS `Total_Spent` FROM (`customer` `c` join `order` `o` on(`c`.`Customer_ID` = `o`.`Customer_ID`)) GROUP BY `c`.`Customer_ID` ORDER BY sum(`o`.`Order_Amount`) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Structure for view `wishlistpopularity`
--
DROP TABLE IF EXISTS `wishlistpopularity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wishlistpopularity`  AS SELECT `p`.`Product_ID` AS `Product_ID`, `p`.`Product_Name` AS `Product_Name`, count(`w`.`Wishlist_ID`) AS `Times_Wishlisted` FROM (`wishlist` `w` join `product` `p` on(`w`.`Product_ID` = `p`.`Product_ID`)) GROUP BY `p`.`Product_ID` ORDER BY count(`w`.`Wishlist_ID`) DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`Coupon_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `delivery_agent`
--
ALTER TABLE `delivery_agent`
  ADD PRIMARY KEY (`Agent_ID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`Discount_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Inventory_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Notification_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Category_ID` (`Category_ID`),
  ADD KEY `Seller_ID` (`Seller_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`Seller_ID`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`Shipment_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Agent_ID` (`Agent_ID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`Wishlist_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `Coupon_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_agent`
--
ALTER TABLE `delivery_agent`
  MODIFY `Agent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `Discount_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Feedback_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Inventory_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Notification_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `Seller_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `Shipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `Wishlist_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Seller_ID`) REFERENCES `seller` (`Seller_ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`Agent_ID`) REFERENCES `delivery_agent` (`Agent_ID`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
