-- query 1: Berapa rata-rata umur customer jika dilihat dari marital statusnya?
SELECT
	"Marital Status",
	ROUND(AVG("Age")) AS average_age
FROM customer
GROUP BY "Marital Status";


-- query 2: Berapa rata-rata umur customer jika dilihat dari gender nya?
SELECT
    CASE
        WHEN "Gender" = 0 THEN 'Wanita'
        WHEN "Gender" = 1 THEN 'Pria'
    END AS gender_label,
    ROUND(AVG("Age")) AS average_age
FROM customer
GROUP BY "Gender";


-- query 3: Tentukan nama store dengan total quantity terbanyak!
SELECT
	s."StoreName",
	SUM(t."Qty") AS total_qty
FROM store s
JOIN transaction t ON s."StoreID" = t."StoreID"
GROUP BY s."StoreName" 
ORDER BY total_qty DESC
LIMIT 1;


-- query 4: Tentukan nama produk terlaris dengan total amount terbanyak!
SELECT
	p."Product Name",
	SUM(t."TotalAmount") AS total_amount
from product p
JOIN transaction t ON p."ProductID" = t."ProductID" 
GROUP BY p."Product Name"
ORDER BY total_amount DESC
LIMIT 1;