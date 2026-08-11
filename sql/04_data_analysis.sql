-- E-commerce User Behaviour Analysis
-- Data Analysis using Snowflake
-- Dataset: E-commerce User Behaviour

-- =========================================================
-- 01. Event type distribution
-- =========================================================

SELECT
    event_type,
    COUNT(*) AS event_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
GROUP BY event_type
ORDER BY event_count DESC;


-- =========================================================
-- 02. Cart to purchase conversion rate
-- =========================================================

SELECT
    COUNT_IF(event_type = 'cart') AS cart_events,
    COUNT_IF(event_type = 'purchase') AS purchase_events,
    ROUND(
        COUNT_IF(event_type = 'purchase') * 100.0
        / COUNT_IF(event_type = 'cart'),
        2
    ) AS cart_to_purchase_rate
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL;


-- =========================================================
-- 03. Top brands by number of purchases
-- =========================================================

SELECT
    brand,
    COUNT(*) AS purchase_count
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND brand IS NOT NULL
GROUP BY brand
ORDER BY purchase_count DESC
LIMIT 10;


-- =========================================================
-- 04. Top brands by total revenue
-- =========================================================

SELECT
    brand,
    ROUND(SUM(price), 2) AS total_revenue
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND brand IS NOT NULL
  AND price IS NOT NULL
GROUP BY brand
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================================
-- 05. Average purchase price by brand
-- =========================================================

SELECT
    brand,
    ROUND(AVG(price), 2) AS average_purchase_price
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND brand IS NOT NULL
  AND price IS NOT NULL
GROUP BY brand
ORDER BY average_purchase_price DESC
LIMIT 10;


-- =========================================================
-- 06. Top categories by number of purchases
-- =========================================================

SELECT
    category_code,
    COUNT(*) AS purchase_count
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY purchase_count DESC
LIMIT 10;


-- =========================================================
-- 07. Top categories by total revenue
-- =========================================================

SELECT
    category_code,
    ROUND(SUM(price), 2) AS total_revenue
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
  AND price IS NOT NULL
GROUP BY category_code
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================================
-- 08. Average purchase price by category
-- =========================================================

SELECT
    category_code,
    ROUND(AVG(price), 2) AS average_purchase_price
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
  AND price IS NOT NULL
GROUP BY category_code
ORDER BY average_purchase_price DESC
LIMIT 10;


-- =========================================================
-- 09. Top users by number of purchases and total spending
-- =========================================================

SELECT
    user_id,
    COUNT(*) AS purchase_count,
    ROUND(SUM(price), 2) AS total_spent
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE event_type = 'purchase'
  AND user_id IS NOT NULL
GROUP BY user_id
ORDER BY purchase_count DESC
LIMIT 10;
