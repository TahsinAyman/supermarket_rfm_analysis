USE super_market;

# Basic Exploration
DESC sales;

# Summary Metrics
SELECT
    COUNT(DISTINCT s.customer_id) AS total_customer,
    COUNT(DISTINCT s.product_category) AS total_product_category,
    COUNT(DISTINCT s.product_sub_category) AS total_product_sub_category,
    COUNT(*) AS total_records,
    AVG(s.sales) AS avg_sales,
    MAX(s.sales) AS max_sales,
    MIN(s.sales) AS min_sales
FROM sales AS s;

# Metrics of Product category and their sub-category
SELECT
    s.product_category,
    COUNT(DISTINCT s.product_sub_category) AS number_of_subcategory,
    COUNT(*) AS total_sales
FROM sales AS s
GROUP BY s.product_category
ORDER BY total_sales DESC;

SELECT
    s.product_sub_category AS subcategory,
    COUNT(*) AS total_sales
FROM sales AS s
GROUP BY s.product_sub_category
ORDER BY total_sales DESC;

# Duplicates

SELECT
    s.id,
    COUNT(*) AS number_of_record
FROM sales AS s
GROUP BY s.id
HAVING number_of_record > 1;

# Outliers

SELECT
    s.id,
    s.sales
FROM sales AS s
ORDER BY s.sales DESC
LIMIT 10;

