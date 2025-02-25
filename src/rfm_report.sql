USE super_market;
CREATE OR REPLACE VIEW rfm_report AS (
    SELECT
        rss.customer_segment,
        COUNT(*) AS number_of_customer
    FROM rfm_score_sales AS rss
    GROUP BY rss.customer_segment
    ORDER BY number_of_customer DESC
);