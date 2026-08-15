-- Calculate the original event-level cart-to-purchase rate
SELECT
    COUNT_IF(event_type = 'cart') AS cart_events,
    COUNT_IF(event_type = 'purchase') AS purchase_events,
    ROUND(
        100.0 * COUNT_IF(event_type = 'purchase')
        / NULLIF(COUNT_IF(event_type = 'cart'), 0),
        2
    ) AS event_cart_to_purchase_pct
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL;
