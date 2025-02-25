USE super_market;
# RFM - Recency Frequency Monetary
CREATE OR REPLACE VIEW rfm_score_sales AS (
    WITH rfm_sales AS (
        SELECT s.customer_name,
            (SELECT MAX(order_date) FROM sales) - MAX(s.order_date) AS recency,
            COUNT(DISTINCT s.order_id) AS frequency,
            ROUND(SUM(s.sales), 0) AS monetary
        FROM sales AS s
        GROUP BY customer_name
    ),
    # dividing customer into 4 segments
    rfm_score AS (
        SELECT
            rs.*,
            NTILE(4) OVER(ORDER BY rs.recency DESC) AS r_score,
            NTILE(4) OVER(ORDER BY rs.frequency) AS f_score,
            NTILE(4) OVER(ORDER BY rs.monetary) AS m_score
        FROM rfm_sales AS rs
    ),
    rfm_comb AS (
        SELECT
            *,
            CONCAT_WS('', r_score, f_score, m_score) AS rfm_comb
        FROM rfm_score
    )
    SELECT
        rc.*,
        CASE
            WHEN rc.rfm_comb IN (111, 112, 121, 132, 211, 211, 212, 114, 141) THEN 'CHURNED CUSTOMER'
                WHEN rc.rfm_comb IN (133, 134, 143, 224, 334, 343, 344, 144) THEN 'SLIPPING AWAY, CANNOT LOSE'
                WHEN rc.rfm_comb IN (311, 411, 331) THEN 'NEW CUSTOMERS'
                WHEN rc.rfm_comb IN (222, 231, 221,  223, 233, 322) THEN 'POTENTIAL CHURNERS'
                WHEN rc.rfm_comb IN (323, 333,321, 341, 422, 332, 432) THEN 'ACTIVE'
                WHEN rc.rfm_comb IN (433, 434, 443, 444) THEN 'LOYAL'
            ELSE 'Other'
        END AS customer_segment
    FROM rfm_comb AS rc
);