CREATE DATABASE cocooncenterpharmacy;
SHOW DATABASES;
 
 SELECT DATABASE();
 USE cocooncenterpharmacy;
 
 SELECT DATABASE();
 
 #Check the imported data and establish how many records contain the key fields.
 
SELECT *
FROM cocooncenter_pharmacy
LIMIT 10;

SELECT
    COUNT(*) AS TotalRows,
    COUNT(customer_rate) AS ReviewsWithRatings,
    COUNT(price) AS RowsWithPrices,
    COUNT(EAN_code) AS RowsWithProductCodes
FROM cocooncenter_pharmacy;

# Missing information matters because it limits how confidently we can compare customer groups.

SELECT COUNT(*) AS MissingAgeGroups
FROM cocooncenter_pharmacy
WHERE age_group = 'not available';

SELECT COUNT(*) AS MissingRecommendations
FROM cocooncenter_pharmacy
WHERE recommend = 'not available';

SELECT COUNT(*) AS NullRatings
FROM cocooncenter_pharmacy
WHERE customer_rate IS NULL;

# Establish a baseline against which brand, category and customer-segment ratings can be compared.

SELECT
    COUNT(*) AS TotalReviews,
    AVG(customer_rate) AS AverageCustomerRating,
    MIN(customer_rate) AS LowestCustomerRating,
    MAX(customer_rate) AS HighestCustomerRating
FROM cocooncenter_pharmacy
WHERE customer_rate IS NOT NULL;

# Find the highest-rated and lowest-rated brands

SELECT
    brand AS Brand,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating,
    MIN(customer_rate) AS LowestRating,
    MAX(customer_rate) AS HighestRating
FROM cocooncenter_pharmacy
WHERE customer_rate IS NOT NULL
GROUP BY brand
ORDER BY AverageCustomerRating DESC;

SELECT
    brand AS Brand,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating,
    MIN(customer_rate) AS LowestRating,
    MAX(customer_rate) AS HighestRating
FROM cocooncenter_pharmacy
WHERE customer_rate IS NOT NULL
GROUP BY brand
ORDER BY AverageCustomerRating ASC;

# Find the highest-rated and lowest-rated product categories

SELECT
    product_cat AS ProductCategory,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating
FROM cocooncenter_pharmacy
WHERE customer_rate IS NOT NULL
GROUP BY product_cat
ORDER BY AverageCustomerRating DESC;

SELECT
    product_cat AS ProductCategory,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating
FROM cocooncenter_pharmacy
WHERE customer_rate IS NOT NULL
GROUP BY product_cat
ORDER BY AverageCustomerRating ASC;

# Identify popular products with lower ratings

SELECT
    EAN_code AS ProductID,
    description AS ProductName,
    brand AS Brand,
    product_cat AS ProductCategory,
    price AS Price,
    MAX(num_review) AS TotalProductReviews,
    AVG(customer_rate) AS AverageCustomerRating,
    AVG(overall_rate) AS AverageOverallRating
FROM cocooncenter_pharmacy
GROUP BY
    EAN_code,
    description,
    brand,
    product_cat,
    price
ORDER BY
    TotalProductReviews DESC,
    AverageOverallRating ASC
LIMIT 20;

# Find the negative customer reviews

SELECT
    description AS ProductName,
    brand AS Brand,
    customer_rate AS CustomerRating,
    head_review AS ReviewHeadline,
    body_review AS ReviewComment
FROM cocooncenter_pharmacy
WHERE customer_rate BETWEEN 1 AND 2
ORDER BY customer_rate ASC
LIMIT 50;

# Investigate positive feedback

SELECT
    description AS ProductName,
    customer_rate AS CustomerRating,
    head_review AS ReviewHeadline,
    body_review AS ReviewComment
FROM cocooncenter_pharmacy
WHERE customer_rate BETWEEN 4 AND 5
  AND (
      body_review LIKE '%quality%'
      OR body_review LIKE '%recommend%'
      OR body_review LIKE '%moistur%'
      OR body_review LIKE '%skin%'
      OR body_review LIKE '%good%'
  )
ORDER BY customer_rate DESC
LIMIT 50;

# Investigate complaints about product or delivery problems

SELECT
    description AS ProductName,
    customer_rate AS CustomerRating,
    head_review AS ReviewHeadline,
    body_review AS ReviewComment
FROM cocooncenter_pharmacy
WHERE customer_rate BETWEEN 1 AND 3
  AND (
      body_review LIKE '%broken%'
      OR body_review LIKE '%damaged%'
      OR body_review LIKE '%leak%'
      OR body_review LIKE '%expired%'
      OR body_review LIKE '%smell%'
      OR body_review LIKE '%shipping%'
      OR body_review LIKE '%delivery%'
  )
ORDER BY customer_rate ASC
LIMIT 50;

# Compare satisfaction across age groups

SELECT
    age_group AS AgeGroup,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating,
    MIN(customer_rate) AS LowestRating,
    MAX(customer_rate) AS HighestRating
FROM cocooncenter_pharmacy
WHERE age_group <> 'not available'
  AND customer_rate IS NOT NULL
GROUP BY age_group
ORDER BY AverageCustomerRating DESC;

# Compare ratings by gender

SELECT
    gender AS Gender,
    COUNT(*) AS NumberOfReviews,
    AVG(customer_rate) AS AverageCustomerRating
FROM cocooncenter_pharmacy
WHERE gender <> 'not available'
  AND customer_rate IS NOT NULL
GROUP BY gender
ORDER BY AverageCustomerRating DESC;

# Analyse recommendations

SELECT
    age_group AS AgeGroup,
    recommend AS Recommendation,
    COUNT(*) AS NumberOfReviews
FROM cocooncenter_pharmacy
WHERE age_group <> 'not available'
  AND recommend IN ('yes', 'no')
GROUP BY age_group, recommend
ORDER BY age_group ASC, NumberOfReviews DESC;

# Investigate price and satisfaction

SELECT
    EAN_code AS ProductID,
    description AS ProductName,
    brand AS Brand,
    price AS Price,
    AVG(customer_rate) AS AverageCustomerRating,
    AVG(overall_rate) AS AverageOverallRating,
    MAX(num_review) AS TotalProductReviews
FROM cocooncenter_pharmacy
WHERE price IS NOT NULL
GROUP BY
    EAN_code,
    description,
    brand,
    price
ORDER BY price DESC;

# Investigate product quality scores

SELECT
    description AS ProductName,
    brand AS Brand,
    overall_prod_qual AS OverallQualityScore,
    overall_rate AS OverallRating,
    price AS Price,
    MAX(num_review) AS TotalProductReviews
FROM cocooncenter_pharmacy
WHERE overall_prod_qual IN ('1', '2', '3', '4', '5')
GROUP BY
    EAN_code,
    description,
    brand,
    overall_prod_qual,
    overall_rate,
    price
ORDER BY overall_rate DESC;
