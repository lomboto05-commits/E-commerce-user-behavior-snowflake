-- Purchase-only revenue
SELECT
    COUNT_IF(event_type = 'purchase') AS purchase_events,
    ROUND(SUM(IFF(event_type = 'purchase', price, 0)), 2) AS purchase_revenue
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL;


-- Price summed across all event types
SELECT
    COUNT(*) AS total_events,
    ROUND(SUM(price), 2) AS all_event_price_total
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL;


-- Brand revenue comparison
SELECT
    brand,
    ROUND(SUM(price), 2) AS all_event_price,
    ROUND(
        SUM(IFF(event_type = 'purchase', price, 0)),
        2
    ) AS purchase_price
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE brand IS NOT NULL
GROUP BY brand
ORDER BY all_event_price DESC
LIMIT 10;


-- Category revenue comparison
SELECT
    category_code,
    ROUND(SUM(price), 2) AS all_event_price,
    ROUND(
        SUM(IFF(event_type = 'purchase', price, 0)),
        2
    ) AS purchase_price
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
WHERE category_code IS NOT NULL
GROUP BY category_code
ORDER BY all_event_price DESC
LIMIT 10;
