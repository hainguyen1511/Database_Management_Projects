select count(*) from yelp_donut.donut_data;

SELECT name, city, rating
FROM yelp_donut.donut_data
LIMIT 10;

SELECT name, city, rating, country
FROM yelp_donut.donut_data
ORDER BY country
LIMIT 10;

SELECT name, city, rating, country
FROM yelp_donut.donut_data
ORDER BY country
OFFSET 1000
LIMIT 10;

SELECT name, city, county, state, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE state = 'OR'
LIMIT 5;

SELECT name, city, county, state, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE state = 'OR' AND review_count < 4
ORDER BY review_count;

SELECT name, city, county, state, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE state = 'OR' AND review_count > 1000
ORDER BY review_count;

SELECT name, city, county, state, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE city = 'Portland' AND state = 'OR'
LIMIT 5;

SELECT name, city, county, state, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE city = 'Portland' AND state = 'OR'
LIMIT 5;

SELECT DISTINCT state, name, city
FROM yelp_donut.donut_data
WHERE city = 'Portland'
;

SELECT name, city, state, liked_by_vegans
FROM yelp_donut.donut_data
WHERE city = 'Portland' AND state = 'OR' AND liked_by_vegans = 'liked by vegans'
;

SELECT name, city, county, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE state = 'OR'
ORDER BY rating DESC
LIMIT 5;

SELECT name, city, county, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE rating = 5
ORDER BY state, city;

select count(*) from yelp_donut.donut_data
WHERE rating = 5
;

SELECT name, city, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE name LIKE 'Co%' AND state = 'CA'
;

SELECT name, city, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE name LIKE 'co%' AND state = 'CA'
;

SELECT name, city, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE LOWER(name) LIKE 'co%' AND state = 'CA'
LIMIT 5;

SELECT name, city, state, country, rating, review_count, price_indicator
FROM yelp_donut.donut_data
WHERE LOWER(name) LIKE 'donut' AND state = 'OR'
;