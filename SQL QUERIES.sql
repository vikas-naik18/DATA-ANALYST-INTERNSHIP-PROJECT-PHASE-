CREATE DATABASE e_commerce3;
SELECT COUNT(*) AS Total_Orders,SUM(Return_Cost) AS Total_Returns,
ROUND(SUM(Return_Cost)*100.0/COUNT(*),2) AS Return_Rate_Percentage
FROM  e_commerce3.returns_sustainability_dataset;

SELECT Product_Category,COUNT(*) AS Total_Orders,SUM(Return_Cost) AS Total_Returns,
ROUND(SUM(Return_Cost)*100.0/
COUNT(*),2) AS Return_Rate
FROM  e_commerce3.returns_sustainability_dataset
GROUP BY Product_Category
ORDER BY Return_Rate DESC;

SELECT User_ID,COUNT(*) AS Total_Orders,SUM(Return_Cost) AS Total_Returns,
ROUND(SUM(Return_Cost)*100.0/COUNT(*),2) AS Return_Rate
FROM  e_commerce3.returns_sustainability_dataset
GROUP BY User_ID
ORDER BY Return_Rate DESC;


SELECT Return_Status,ROUND(SUM(Return_Cost)*100.0/ COUNT(*),2) AS Return_Rate
FROM e_commerce3.returns_sustainability_dataset
GROUP BY Return_Status;

SELECT User_Location,ROUND(SUM(Return_Cost)*100.0/ COUNT(*),2) AS Return_Rate
FROM e_commerce3.returns_sustainability_dataset
GROUP BY User_Location
ORDER BY  Return_Rate DESC;




