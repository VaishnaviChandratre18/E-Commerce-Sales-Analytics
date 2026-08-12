CREATE TABLE Sales(
OrderID Varchar(10),
Order_date DATE,CustomerID Varchar(10),Product Varchar(50),
Category Varchar(50),Quantity INT,Price Numeric(10,2),
Revenue Numeric(12,2));
SELECT*FROM Sales LIMIT 5 ;

-- Total revenue across all orders
SELECT SUM(Revenue) AS Total_Revenue
FROM Sales;

-- Top 5 products by total revenue
SELECT product , SUM(Revenue) AS Total_revenue
From Sales
Group by Product
Order By Total_revenue DESC
LIMIT 5;

--Top 5 Customers by Spend
SELECT CustomerID,SUM(Revenue) as Total_Revenue,Count(*) as orders_placed
From Sales
Group by CustomerID
Order by Total_Revenue DESC
LIMIT 5;
-- Average order value per category
SELECT category, AVG(revenue) AS avg_order_value
FROM sales
GROUP BY category
ORDER BY avg_order_value DESC;

--Repeated customers
SELECT customerid, COUNT(*) AS order_count
FROM sales
GROUP BY customerid
HAVING COUNT(*) > 1
ORDER BY order_count DESC;
-- Products priced above the average price
SELECT product, price, revenue
FROM sales
WHERE price > (SELECT AVG(price) FROM sales)
ORDER BY revenue DESC;
--- Total revenue by month
SELECT EXTRACT(MONTH FROM date) AS month, SUM(revenue) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;