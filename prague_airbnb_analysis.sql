-- Creating table for clean Airbnb Prague data

CREATE TABLE airbnb_prague (
    id BIGINT PRIMARY KEY,  -- BIGINT замість INTEGER
    name TEXT,
    host_id BIGINT,         -- BIGINT
    host_name TEXT,
    neighbourhood_group TEXT,
    neighbourhood TEXT,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    room_type TEXT,
    price INTEGER,
    minimum_nights INTEGER,
    number_of_reviews INTEGER,
    last_review DATE,
    reviews_per_month DECIMAL(5,2),
    calculated_host_listings_count INTEGER,
    availability_365 INTEGER,
    number_of_reviews_ltm INTEGER,
    license TEXT,
    price_usd DECIMAL(10,2)
    
    -- 1. How many rows were imported?
SELECT COUNT(*) FROM airbnb_prague;
-- Must be 7453

-- 2. View first 5 rows
SELECT * FROM airbnb_prague LIMIT 5;

/*
 * QUESTION 1: Income by district in Prague
 * Source: cleaned Airbnb data (7,453 listings)
 * Income formula: price * (365 - days available)
 */

SELECT 
    neighbourhood,
    COUNT(*) as listings_count,
    AVG(price_usd) as avg_price,
    AVG(availability_365) as avg_days_available,
    ROUND(AVG(365 - availability_365), 2) as avg_days_booked,
    ROUND(AVG(price_usd * (365 - availability_365)), 2) as avg_yearly_income,
    ROUND(AVG(price_usd * (365 - availability_365)) / 12, 2) as avg_monthly_income
FROM airbnb_prague
GROUP BY neighbourhood
HAVING COUNT(*) >= 10
ORDER BY avg_yearly_income DESC;

/*
 * QUESTION 2: Professionals (5+ listings) vs amateurs (1 listing)
 */

WITH host_categories AS (
    SELECT 
        *,
        CASE 
            WHEN calculated_host_listings_count >= 5 THEN 'Professional (5+)'
            WHEN calculated_host_listings_count = 1 THEN 'Amateur (1)'
            ELSE 'Medium (2-4)'
        END as host_type
    FROM airbnb_prague
)
SELECT 
    host_type,
    COUNT(*) as listings_count,
    ROUND(AVG(price_usd), 2) as avg_price,
    ROUND(AVG(availability_365), 2) as avg_days_available,
    ROUND(AVG(365 - availability_365), 2) as avg_days_booked,
    ROUND(AVG(price_usd * (365 - availability_365)), 2) as avg_yearly_income,
    ROUND(AVG(number_of_reviews), 2) as avg_reviews
FROM host_categories
WHERE host_type IN ('Professional (5+)', 'Amateur (1)')
GROUP BY host_type;

/*
 * QUESTION 3: Best price-occupancy ratio
 * Finding districts with high occupancy AND high price
 */

SELECT 
    neighbourhood,
    COUNT(*) as listings_count,
    AVG(price_usd) as avg_price,
    AVG(365 - availability_365) as avg_booked,
    AVG(price_usd * (365 - availability_365)) as avg_income
FROM airbnb_prague
GROUP BY neighbourhood
HAVING COUNT(*) >= 10
ORDER BY avg_income DESC;

/*
 * QUESTION 4: How does minimum nights affect income?
 */

SELECT 
    CASE 
        WHEN minimum_nights = 1 THEN '1 night'
        WHEN minimum_nights = 2 THEN '2 nights'
        WHEN minimum_nights BETWEEN 3 AND 4 THEN '3-4 nights'
        WHEN minimum_nights BETWEEN 5 AND 7 THEN '5-7 nights'
        ELSE '8+ nights'
    END as booking_category,
    COUNT(*) as listings_count,
    ROUND(AVG(price_usd), 2) as avg_price,
    ROUND(AVG(365 - availability_365), 2) as avg_days_booked,
    ROUND(AVG(price_usd * (365 - availability_365)), 2) as avg_yearly_income,
    ROUND(AVG(number_of_reviews), 2) as avg_reviews
FROM airbnb_prague
GROUP BY 
    CASE 
        WHEN minimum_nights = 1 THEN '1 night'
        WHEN minimum_nights = 2 THEN '2 nights'
        WHEN minimum_nights BETWEEN 3 AND 4 THEN '3-4 nights'
        WHEN minimum_nights BETWEEN 5 AND 7 THEN '5-7 nights'
        ELSE '8+ nights'
    END
ORDER BY avg_yearly_income DESC;