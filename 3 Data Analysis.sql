# A. KPI’s
# 1. Total Revenue:
SELECT SUM(Total_Price) AS Total_Revenue FROM electronic_sales;
 
# 2. Average Order Value
SELECT (SUM(Total_Price) / COUNT(DISTINCT Customer_ID)) AS Avg_order_Value FROM electronic_sales;
 
# 3. Total Quantity Sold
SELECT SUM(Quantity) AS Total_product_sold FROM electronic_sales;
 
# 4. Total Orders
SELECT COUNT(DISTINCT Customer_ID) AS Total_Orders FROM electronic_sales;
 
# 5. Average Quantity Per Order
SELECT CAST(CAST(SUM(Quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT Customer_ID) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_purchase_per_order
FROM electronic_sales ;
 
# B. Daily Trend for Total Orders
SELECT dayname(Purchase_Date) AS order_day, COUNT(DISTINCT Customer_ID) AS total_orders 
FROM  electronic_sales
GROUP BY dayname(Purchase_Date);

# C. Monthly Trend for Orders
select monthname(Purchase_Date) as Month_Name, COUNT(DISTINCT(Customer_ID)) AS Total_Orders
from electronic_sales
GROUP BY monthname(Purchase_Date);
 
# D. % of Sales by Product Category
SELECT Product_Type, CAST(SUM(Total_Price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(Total_Price) * 100 / (SELECT SUM(Total_Price) from electronic_sales) AS DECIMAL(10,2)) AS PCT
FROM electronic_sales
GROUP BY  Product_Type;


# E. Total Quantity Sold by Product Category
SELECT Product_Type, SUM(Quantity) as Total_Quantity_Sold
FROM electronic_sales
GROUP BY Product_Type
ORDER BY Total_Quantity_Sold DESC;

# F. Customer prefered payment method 
SELECT Payment_Method,Count(Payment_Method) as Total_Payment_Method
FROM electronic_sales
GROUP BY Payment_Method;

# F. Total Quantity Sold by Shipping Type
SELECT Shipping_Type, SUM(Quantity) as Total_Quantity_Sold
FROM electronic_sales
GROUP BY Shipping_Type;

# I. Product Category purchase by Gender
SELECT Gender,Product_Type, SUM(Quantity) as  Total_Quantity_Sold
FROM electronic_sales
GROUP BY Gender,Product_Type 
ORDER BY Gender;




