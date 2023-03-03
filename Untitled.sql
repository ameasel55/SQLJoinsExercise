/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name
FROM Products as p
LEFT JOIN Categories as c
ON p.categoryID = c.categoryID
WHERE c.name LIKE "%COMPUTERS%";

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 SELECT p.name, p.price , r.rating
 FROM products as p
 INNER JOIN reviews as r 
 ON p.productID = r.productID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS total
FROM sales AS s							
INNER JOIN employees AS e
ON e.EmployeeID = s.employeeID			   /*DID NOT DO THIS RIGHT*/
GROUP BY e.EmployeeID
ORDER BY total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.name as "Department Name", c.name as "Category Name"                               /*DID NOT DO THIS RIGHT*/
FROM departments as d
INNER JOIN categories as c
ON c.DepartmentID = d.DepartmentID
WHERE c.name = "appliances" or c.name = "games";   /*DID NOT DO THIS RIGHT*/

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT p.Name, Sum(s.Quantity) AS "Total Units Sold",
Sum(s.Quantity * s.PricePerUnit) AS "Total Profit from Product"
FROM products AS p
INNER JOIN sales AS s
ON s.ProductID = P.ProductID
WHERE p.ProductID = 97;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON r.productID = p.ProductID
WHERE p.ProductID = 857 
AND r.rating =1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT e.employeeID, e.FirstName, e.LastName, p.Name,
Sum(s.quantity) AS "Total Sold"
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName

