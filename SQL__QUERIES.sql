Create Database telecom;
USE telecom;
CREATE TABLE telecom_churn (
CustomerID VARCHAR(50),
Gender VARCHAR(10),
SeniorCitizen INT,
Partner VARCHAR(10),
Dependents VARCHAR(10),
Tenure_Months INT,
PhoneService VARCHAR(10),
MultipleLines VARCHAR(20),
InternetService VARCHAR(20),
OnlineSecurity VARCHAR(20),
OnlineBackup VARCHAR(20),
DeviceProtection VARCHAR(20),
TechSupport VARCHAR(20),
StreamingTV VARCHAR(20),
StreamingMovies VARCHAR(20),
Contract VARCHAR(30),
PaperlessBilling VARCHAR(10),
PaymentMethod VARCHAR(50),
MonthlyCharges FLOAT,
TotalCharges FLOAT,
ChurnLabel VARCHAR(10),
ChurnValue INT,
ChurnReason VARCHAR(200)
);
SELECT `Churn Value`, COUNT(*) 
FROM telecom.telco_customer_churn_day
GROUP BY `Churn Value`;

SELECT 
COUNT(*) AS total_customers,
SUM(CAST(`Churn Value` AS UNSIGNED)) AS churned_customers,
ROUND(SUM(CAST(`Churn Value` AS UNSIGNED)) / COUNT(*) * 100, 2) AS churn_rate
FROM telecom.telco_customer_churn_day;

SELECT 
Gender,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY Gender;

SELECT 
Contract,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY Contract
ORDER BY churned_customers DESC;

SELECT 
`Internet Service`,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY `Internet Service`;

SELECT 
`Payment Method`,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY `Payment Method`
ORDER BY churned_customers DESC;

SELECT 
AVG(`Monthly Charges`) AS avg_monthly_charges,
AVG(`Total Charges`) AS avg_total_charges
FROM telecom.telco_customer_churn_day
WHERE `Churn Value` = 1;

SELECT 
`Senior Citizen`,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY `Senior Citizen`;

SELECT 
`Tech Support`,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY `Tech Support`;

SELECT 
`Online Security`,
COUNT(*) AS total_customers,
SUM(`Churn Value`) AS churned_customers
FROM telecom.telco_customer_churn_day
GROUP BY `Online Security`;

SELECT 
`Churn Reason`,
COUNT(*) AS total_cases
FROM telecom.telco_customer_churn_day
WHERE `Churn Value` = 1
GROUP BY `Churn Reason`
ORDER BY total_cases DESC;

SELECT 
CustomerID,
`Tenure Months`,
`Monthly Charges`
FROM telecom.telco_customer_churn_day
WHERE `Tenure Months` < 12
AND `Monthly Charges` > 80;

SELECT 
CustomerID,
`Tenure Months`,
`Monthly Charges`,
CASE
WHEN `Tenure Months` > 24 THEN 'Loyal'
WHEN `Tenure Months` < 12 AND `Monthly Charges` > 80 THEN 'At Risk'
ELSE 'Dormant'
END AS CustomerSegment
FROM telecom.telco_customer_churn_day;
