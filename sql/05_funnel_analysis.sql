-- Calculate the proper session-level cart-to-purchase funnel
WITH session_flags AS (
    SELECT
        user_session,
        MAX(IFF(event_type = 'view', 1, 0)) AS viewed,
        MAX(IFF(event_type = 'cart', 1, 0)) AS carted,
        MAX(IFF(event_type = 'purchase', 1, 0)) AS purchased
    FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
    GROUP BY user_session
)

SELECT
    COUNT(*) AS total_sessions,
    SUM(carted) AS sessions_with_cart,
    SUM(IFF(carted = 1 AND purchased = 1, 1, 0)) AS cart_sessions_purchased,
    ROUND(
        100.0 * SUM(IFF(carted = 1 AND purchased = 1, 1, 0))
        / NULLIF(SUM(carted), 0),
        2
    ) AS session_cart_to_purchase_pct
FROM session_flags;


-- Validate the session-level funnel using a self-join
WITH cart_sessions AS (
    SELECT DISTINCT
        user_session
    FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
    WHERE event_type = 'cart'
),

purchase_sessions AS (
    SELECT DISTINCT
        user_session
    FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL
    WHERE event_type = 'purchase'
)

SELECT
    COUNT(*) AS sessions_with_cart,
    COUNT(p.user_session) AS cart_sessions_purchased,
    ROUND(
        100.0 * COUNT(p.user_session)
        / NULLIF(COUNT(*), 0),
        2
    ) AS session_cart_to_purchase_pct
FROM cart_sessions c
LEFT JOIN purchase_sessions p
    ON c.user_session = p.user_session;
