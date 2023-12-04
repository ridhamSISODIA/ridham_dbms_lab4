create database ecommerce;
USE ecommerce;
-- drop database ecommerce;
-- 1) You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below

-- 2) You are required to develop SQL based programs (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in summarized format - The Data Retrieval needs are described below.

create table supplier (SUPP_ID int primary key auto_increment, SUPP_NAME varchar(50), 
SUPP_CITY varchar(50)
 not null,
 SUPP_PHONE varchar (50) not null);
 INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('Rajesh Retails', 'Delhi', '1234567890');
INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('Appario Ltd.', 'Mumbai', '24546547568');
INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('Knome products', 'Banglore', '98567435864');
INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('Bansal Retails', 'Kochi', '5685678563');
INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('Mittal Ltd.', 'Luchnow', '2345436456');


create table customer ( CUS_ID INT PRIMARY KEY , 
CUS_NAME varchar(20) not null, 
CUS_PHONE varchar(10) not null,
 CUS_CITY varchar(30) not null, 
 CUS_GENDER char );

 INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (1, 'AAKASH', '9999999999', 'DELHI', 'M');
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (2, 'AMAN', '9785463215', 'NOIDA', 'M');
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (3, 'NEHA', '9999999999', 'MUMBAI', 'F');
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (4, 'MEGHA', '9994562399', 'KOLKATA', 'F');
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

create table category (CAT_ID int primary key,
 CAT_NAME varchar(20) not null);

INSERT INTO category (CAT_ID, CAT_NAME) VALUES (1, 'BOOKS');
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (2, 'GAMES');
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (3, 'GROCERIES');
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (4, 'ELECTRONICS');
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (5, 'CLOTHES');

create table  product (  PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID));

INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned Milk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with Windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);


CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);





CREATE TABLE orders (
    ORD_ID INT primary key,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE ,
    CUS_ID INT  not null,
    PRICING_ID INT not null ,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-10-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);



CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT not null,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES orders(ORD_ID)
);


insert into rating (RAT_ID, ORD_ID,RAT_RATSTARS) values
 (1 ,101 ,4),
(2 ,102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8 ,108, 4),
(9 ,109 ,3),
(10 ,110, 5),
(11 ,111 ,3),
(12, 112, 4),
(13 ,113 ,2),
(14 ,114 ,1),
(15, 115, 1),
(16 ,116 ,0);

select * from supplier;
select * from customer;
select * from category;
select * from product;
select * from supplier_pricing;
select * from orders;
select * from rating;

-- Quaries
-- 4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

SELECT 
    c.cus_gender, COUNT(c.cus_gender) AS count
FROM
    customer c
        INNER JOIN
    (SELECT 
        c.cus_id AS customerId
    FROM
        customer c
    INNER JOIN orders o ON o.cus_id = c.cus_id
    WHERE
        o.ord_amount >= 3000
    GROUP BY c.cus_id) AS v ON v.customerId = c.cus_id
GROUP BY c.cus_gender;

-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2

select p.pro_name , o.*
from orders o
inner join customer c on c.cus_id=o.cus_id
inner join supplier_pricing sp on sp.pricing_id=o.pricing_id
inner join product p on p.pro_id=sp.pro_id
where c.cus_id=2;


-- 6) Display the Supplier details who can supply more than one product.

SELECT 
    s.*, v.totalProducts
FROM
    supplier s
INNER JOIN
    (SELECT 
        sp.supp_id, COUNT(sp.pro_id) AS totalProducts
    FROM
        supplier_pricing sp
    GROUP BY sp.supp_id) AS v ON v.supp_id = s.supp_id
WHERE
    v.totalProducts > 2;

-- 7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product

-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.
-- order, supplier_pricing ,product

select p.pro_id, p.pro_name
from orders o
inner join supplier_pricing sp on sp.PRICING_ID=o.PRICING_ID
inner join product p on p.pro_id=sp.PRO_ID
where o.ORD_DATE> '2021-10-05';

-- 9) Display customer name and gender whose names start or end with character 'A'.

select * from customer c 
where c.cus_name like 'A%'
or c.cus_name like 'A%';

/*-- 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and 
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average 
Service” else print “Poor Service”. Note that there should be one rating per supplier*/

select * from rating;
select * from orders;

select * from orders;
-- select * from supplier_pricing sp
select * from supplier_pricing;
select * from supplier;



SELECT
  report.supp_id,
  report.supp_name,
  CASE
    WHEN report.average = 5 THEN 'Excellent Service'
    WHEN report.average = 4 THEN 'Good Service'
    WHEN report.average = 2 THEN 'Average Service'
    ELSE 'Poor Service'
  END AS type_of_service
FROM
  (
    SELECT
      s.*,
      final.average
    FROM
      supplier s
      INNER JOIN (
        SELECT
          vv.supp_id,
          AVG(vv.rat_ratstars) AS average
        FROM
          (
            SELECT
              sp.pricing_id,
              sp.pro_id,
              sp.supp_id,
              sp.supp_price,
              v.ord_id,
              v.rat_ratstars
            FROM
              supplier_pricing sp
              INNER JOIN (
                SELECT
                  o.ord_id,
                  o.pricing_id,
                  r.rat_ratstars
                FROM
                  orders o
                  INNER JOIN rating r ON r.ord_id = o.ord_id
              ) AS v ON sp.pricing_id = v.pricing_id
          ) AS vv
        GROUP BY
          vv.supp_id
      ) AS final ON final.supp_id = s.supp_id
  ) AS report;
  