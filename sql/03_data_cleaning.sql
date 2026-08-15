--  DATA CLEANING



-- 1. Check for NULL values
-- Identify missing values before making any changes.

SELECT
    COUNT(*) AS total_rows,
    COUNT_IF(event_time IS NULL) AS null_event_time,
    COUNT_IF(event_type IS NULL) AS null_event_type,
    COUNT_IF(product_id IS NULL) AS null_product_id,
    COUNT_IF(category_id IS NULL) AS null_category_id,
    COUNT_IF(category_code IS NULL) AS null_category_code,
    COUNT_IF(brand IS NULL) AS null_brand,
    COUNT_IF(price IS NULL) AS null_price,
    COUNT_IF(user_id IS NULL) AS null_user_id,
    COUNT_IF(user_session IS NULL) AS null_user_session
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 2. Check for potential duplicate events
-- Identify repeated combinations of user, product, event and timestamp.

SELECT
    event_time,
    event_type,
    product_id,
    user_id,
    COUNT(*) AS duplicate_count
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW
GROUP BY
    event_time,
    event_type,
    product_id,
    user_id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- 3. Check for exact duplicate records
-- An exact duplicate has identical values across all event fields.

SELECT
    event_time,
    event_type,
    product_id,
    category_id,
    category_code,
    brand,
    price,
    user_id,
    user_session,
    COUNT(*) AS duplicate_count
FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW
GROUP BY
    event_time,
    event_type,
    product_id,
    category_id,
    category_code,
    brand,
    price,
    user_id,
    user_session
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- 4. Create a separate schema for cleaned data
-- The raw data is kept unchanged for traceability.

CREATE SCHEMA IF NOT EXISTS ECOMMERCE_USER_BEHAVIOUR.CLEANED;


-- 5. Remove exact duplicate records
-- DISTINCT keeps one copy of each unique record.

CREATE TABLE ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN AS

SELECT DISTINCT
    event_time,
    event_type,
    product_id,
    category_id,
    category_code,
    brand,
    price,
    user_id,
    user_session

FROM ECOMMERCE_USER_BEHAVIOUR.RAW.EVENTS_RAW;


-- 6. Validate the cleaned row count

SELECT COUNT(*) AS cleaned_rows
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN;


-- 7. Validate event_time conversion
-- Remove the UTC text and test conversion to a timestamp.

SELECT
    COUNT(*) AS total_rows,
    COUNT(
        TRY_TO_TIMESTAMP_NTZ(
            REPLACE(event_time, ' UTC', ''),
            'YYYY-MM-DD HH24:MI:SS'
        )
    ) AS valid_timestamps,
    COUNT(*) -
    COUNT(
        TRY_TO_TIMESTAMP_NTZ(
            REPLACE(event_time, ' UTC', ''),
            'YYYY-MM-DD HH24:MI:SS'
        )
    ) AS invalid_timestamps
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN;


-- 8. Validate price values
-- Check for missing, zero or negative prices.

SELECT
    COUNT(*) AS total_rows,
    COUNT_IF(price IS NULL) AS null_price,
    COUNT_IF(price < 0) AS negative_price,
    COUNT_IF(price = 0) AS zero_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN;


-- 9. Validate user and session fields

SELECT
    COUNT(*) AS total_rows,
    COUNT_IF(user_id IS NULL) AS null_user_id,
    COUNT_IF(user_session IS NULL) AS null_user_session,
    COUNT(DISTINCT user_id) AS unique_users,
    COUNT(DISTINCT user_session) AS unique_sessions
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN;


-- 10. Create the final cleaned table
-- Convert event_time from text to a proper timestamp.

CREATE OR REPLACE TABLE ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL AS

SELECT
    TRY_TO_TIMESTAMP_NTZ(
        REPLACE(event_time, ' UTC', ''),
        'YYYY-MM-DD HH24:MI:SS'
    ) AS event_time,
    event_type,
    product_id,
    category_id,
    category_code,
    brand,
    price,
    user_id,
    user_session

FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN;


-- 11. Validate the final cleaned table

SELECT
    COUNT(*) AS total_rows,
    COUNT_IF(event_time IS NULL) AS null_event_time
FROM ECOMMERCE_USER_BEHAVIOUR.CLEANED.EVENTS_CLEAN_FINAL;
