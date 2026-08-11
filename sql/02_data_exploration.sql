--(Note that the below quries should be ran individually) 
-- =====================================================
-- E-COMMERCE USER BEHAVIOUR - DATA EXPLORATION
-- =====================================================

-- 1. Total number of events
SELECT
    COUNT(*) AS total_events
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 2. Number of unique users
SELECT
    COUNT(DISTINCT user_id) AS unique_users
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 3. Number of unique products
SELECT
    COUNT(DISTINCT product_id) AS unique_products
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 4. Number of unique sessions
SELECT
    COUNT(DISTINCT user_session) AS unique_sessions
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 5. Event type breakdown
SELECT
    event_type,
    COUNT(*) AS event_count
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW
GROUP BY event_type
ORDER BY event_count DESC;


-- 6. Event type breakdown with percentages
SELECT
    event_type,
    COUNT(*) AS event_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS event_percentage
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW
GROUP BY event_type
ORDER BY event_count DESC;


-- 7. Inspect the structure and sample records
SELECT *
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW
LIMIT 10;
