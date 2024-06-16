# Online Food Ordering App

![Diagram](SQL Insights/diagram.png)

Table and Data Queries Present in food.sql file (SQL Insights/food.sql).

**Anirudh**
1) Most ordered dish/ count of menduitem id
```sql
select MenuItemID, Quantity
from OrderDetails 
Left join Orders on Orders.OrderID= OrderDetails.OrderID;
```
2) Least ordered restaurant/ least order restaurant wise
3) Most valuable customer/ highest amount customer wise
4) Most ordered date across restaurants

**Sambit**
1. Total customer 
2. Customer with maximum orders 
```sql
SELECT CustomerID, COUNT(*) AS order_count
FROM Orders
GROUP BY CustomerID
```
3. Most expensive items 
```sql
SELECT Name, Price
FROM MenuItems
WHERE price = (SELECT MAX(price) FROM MenuItems);
```
4. Restaurant with maximum orders
5. Restaurant with max rating

**Krushang**
1. Increasing customer base over the months or years
```sql
select DATE_FORMAT(RegistrationDate, '%Y-%m') as month_year, count(*) as customers from customers
group by DATE_FORMAT(RegistrationDate, '%Y-%m') ;
```
2. business per customer
```sql
select c.Name, sum(o.TotalAmount) Total_purchase
from customers c
left join orders o on c.CustomerID = o.CustomerID
group by c.Name ;
```
3. orders per customer
```sql
select c.Name, count(o.OrderDate) Total_orders
from customers c
left join orders o on c.CustomerID = o.CustomerID
group by c.Name
```
4 Average price per food items per restaurant



**Jiendra**
1. restaurants with max customers
```sql
SELECT RestaurantID, count(OrderID) as Net_Orders FROM menuitems m
join orderdetails o on m.MenuItemID = o.MenuItemID
group by RestaurantID
order by RestaurantID;
```
2. best selling Products
```sql
select Category,Product_quantities from 
    (SELECT Category, sum(Quantity) as Product_quantities, rank() over(order by sum(Quantity) desc) as rankings FROM menuitems m
    join orderdetails o on m.MenuItemID = o.MenuItemID
    group by Category
    order by Product_quantities desc) a
where rankings = 1; 
```
3. monthly sales
```sql
select year(OrderDate) Year, month(OrderDate) Month, sum(TotalAmount) Sales from orderdetails od
join orders o on o.OrderID = od.OrderID
group by Year, Month;
```
**Rahul**
1. Regular customer visit 
2. Most expensive items 
3. Average per customer bill
4. Total Food billing & Total beverage billing

**Arun Kumar**
1. Restaurant with High order value
2. Food ordered the most
3. Restaurant wise food cost for better comparison
4. customers with low orders

**Himanshu**

1. Top-Performing Restaurants
```sql
SELECT r.Name, r.Rating, COUNT(o.OrderID) AS OrderCount
FROM Restaurants r
JOIN Orders o ON r.RestaurantID = o.RestaurantID
GROUP BY r.Name, r.Rating
ORDER BY OrderCount DESC, r.Rating DESC;
```
2. Customer Spending Patterns
```sql
SELECT c.Name, AVG(o.TotalAmount) AS AvgOrderValue, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC;
```
3. Restaurant Performance by Cuisine
```sql
SELECT r.Name AS RestaurantName, m.Category, COUNT(o.OrderID) AS OrderCount, AVG(r.Rating) AS AvgRating
FROM Restaurants r
JOIN MenuItems m ON r.RestaurantID = m.RestaurantID
JOIN Orders o ON r.RestaurantID = o.RestaurantID
GROUP BY r.Name, m.Category
ORDER BY OrderCount DESC, AvgRating DESC;
```
4. Order Frequency by Day of the Week
```sql
SELECT DAYNAME(OrderDate) AS DayOfWeek, COUNT(*) AS OrderCount
FROM Orders
GROUP BY DayOfWeek
ORDER BY FIELD(DayOfWeek, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```


**Manish Nunes**

1. Total number of Customers
```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM orders;
```
2. Total Number of Restaurants
```sql
SELECT COUNT(DISTINCT restaurant_id) AS total_restaurants FROM restaurants;
```
3. Total Number of orders
```sql
SELECT COUNT(*) AS total_orders FROM orders;
```
4. Total Revenue Generated
```sql
SELECT SUM(order_total) AS total_revenue FROM orders;
```
5. Average Rating of Restaurant
```sql
SELECT AVG(rating) AS average_rating FROM restaurant_reviews;
```
6. Most popular menu item by quanity sold
```sql
SELECT menu_item, SUM(quantity) AS total_quantity_sold
FROM order_items
GROUP BY menu_item
ORDER BY total_quantity_sold DESC
LIMIT 1;
```
7. Most Profitable Restaurant
```sql
SELECT restaurant_id, SUM(order_total) AS total_revenue
FROM orders
GROUP BY restaurant_id
ORDER BY total_revenue DESC
LIMIT 1;
```
8. Customer with the highest Spending
```sql
SELECT c.Name AS top_spender, SUM(o.TotalAmount) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY total_spent DESC
LIMIT 1;
```
9. Number of orders places in Last Month
```sql
SELECT COUNT(*) AS orders_last_month
FROM Orders
WHERE OrderDate >= DATE_SUB('2023-03-01', INTERVAL 1 MONTH);
```
10. Average Order Value
```sql
SELECT AVG(TotalAmount) AS average_order_value
FROM Orders;
```

1. Total Number of Restaurants
SELECT COUNT(*) AS total_restaurants
FROM restaurants;


-----

**Insights to Get**

1. Total number of Customer
```sql
SELECT COUNT(*) AS TotalCustomers FROM Customers;
```
2. Total Number of Restaurants
```sql
SELECT COUNT(*) AS TotalRestaurants FROM Restaurants;
```
3. Total Number of orders
```sql
SELECT COUNT(*) AS TotalOrders FROM Orders;
```
4. Total Revenue Generated
```sql
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
```
5. Average Rating of Restaurant
```sql
SELECT AVG(Rating) AS AverageRating FROM Restaurants;
```
6. Most popular menu item by quanity sold
```sql

```
7. Most Profitable Restaurant
```sql

```
8. Customer with the highest Spending
```sql

```
9. Number of orders places in Last Month
```sql

```
10. Average Order Value
```sql

```
11. Number of Different Menu Item sold
```sql

```
12. Total number of pizzas sold
```sql

```
13. Total revenue from each restaurant
```sql

```
14. Number of orders by each customer
```sql

```
15. Top 3 most frequenty ordered menu items
```sql

```
16. Average Spending per customer
```sql

```
17. Total Quantity of each menu item sold
```sql

```
18. Revenuw Generated by each category of menu items
```sql

```
19. Most popular restaurant by numbers of orders
```sql

```
20. Percentage of orders by each category of menu items
```sql

```
21. Monthly revenue growth rate
```sql

```
22. Number of new customers per month
```sql

```
23. Average rating of restaurants by number of orders
```sql

```
24. Top 3 Customers by order Frequency 
```sql

```
25. Average Customer Bill
```sql

```
