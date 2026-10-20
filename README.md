![Static Badge](https://img.shields.io/badge/SQL-blue) ![Static Badge](https://img.shields.io/badge/Power%20BI-gold)   

# Cocooncenter Pharmacy

## Contents
- [Purpose](#purpose)  
- [Objectives](#objectives)  
- [Skills](#skills)
- [Key Insights](#key-insights)  
- [Previews](#previews)
- [Final Project](#final-projects)

## Purpose
The purpose of this project is to demonstrate my ability to query, analyse, and interpret customer review and product data using SQL, and communicate key findings through data visualisation in Power BI.

## Objectives
- Identify the brands and product categories receiving the highest and lowest customer ratings.
- Identify popular products with comparatively low customer ratings that may require further investigation.
- Explore positive and negative customer feedback to identify potential reasons for satisfaction and dissatisfaction.
- Compare customer ratings and product recommendations across age groups and other available customer segments.
- Investigate potential relationships between product prices, quality scores, and customer satisfaction.
- Assess data completeness and identify data-quality issues that may affect the analysis.
- Use SQL queries and summary statistics to answer the business questions.
- Develop relevant charts and visualisations to communicate findings clearly.
- Present key trends, business implications, and practical recommendations in a concise report and Power BI dashboard.

## Skills
| ![Static Badge](https://img.shields.io/badge/Technical%20Skills-steelblue) | ![Static Badge](https://img.shields.io/badge/Soft%20Skills-9994C0) |
|---|---|
| SQL | Business problem-solving |
| Power BI | Translating findings into business actions |
| KPI development | Communicating insights clearly |
| Data modelling | Visualisation |
| Dashboard development | Providing post-explanation |
| Exploratory Data Analysis | Investigating data quality |
| Statistical analysis | Data cleaning |

## Key Insights
  
**Overall customer satisfaction**

- The dataset contains 1,539 records, with customer ratings, prices, and product codes available for all records.
- The average customer rating is 4.78 out of 5, with ratings ranging from 1 to 5.
- Overall, 96.0% of records have a positive rating of 4 or 5, while 2.3% have a rating of 1 or 2. The remaining 1.7% have a rating of 3.
- A total of 1,321 records have a five-star rating, representing 85.8% of all records.
- No customer ratings are missing, providing a complete baseline for analysing ratings across the dataset.

**Brand performance**

- Among brands with at least 20 reviews, Topicrem has the highest average customer rating, at 4.85 out of 5 across 295 records.
- Eucerin has the lowest average rating among brands with at least 20 reviews, at 4.61 out of 5 across 214 records.
- Bioderma has the largest representation in the dataset, with 602 records and an average customer rating of 4.85 out of 5.
- Some smaller brands achieve perfect average ratings of 5.00, although their limited sample sizes make direct comparisons less reliable.

**Product category performance**

- Body Moisturisers is the largest category, with 1,067 records and an average customer rating of 4.82 out of 5.
- Body Soothing Products has an average rating of 4.84 out of 5 across 68 records, making it a strong performer among categories with meaningful representation.
- Body Healing / Repairing Products averages 4.64 out of 5 across 258 records.
- Body Radiance / Well-Being has the lowest average rating among the listed categories, at 4.07 out of 5 across 15 records. This result should be interpreted cautiously due to the small sample size.

**Product popularity and customer feedback**

- Bioderma Atoderm Ultra Nourishing Cream, 2 × 500 ml, is the most-reviewed product represented in the dataset, with 507 product reviews and an average customer rating of approximately 4.85 out of 5.
- Topicrem UH Body Milk, 2 × 500 ml, ranks second in review volume, with 295 reviews and an average customer rating of approximately 4.85 out of 5.
- Eucerin products feature prominently among highly reviewed products, although some have lower average ratings than leading Bioderma and Topicrem products.
- The negative-review query identifies 35 records rated 1 or 2. A separate keyword-based query identifies 17 records rated 1–3 that mention potential issues involving damage, leakage, expiry, smell, or delivery.
- Positive-review keyword searches identify examples of high-rated feedback mentioning quality, recommendations, moisturising, and skin. These provide starting points for further investigation, but additional review analysis would be needed to establish the main drivers of satisfaction and dissatisfaction.

**Customer demographics and recommendations**

- Among reviewers with available age-group information, the 45–54 age group has the highest average rating, at 4.88 out of 5 across 50 records.
- The 17-or-under age group has the lowest average rating, at 4.33 out of 5 across just three records. This sample is too small to support a strong conclusion.
- Male reviewers average 4.84 out of 5 across 57 records, compared with 4.76 out of 5 across 443 female-reviewer records.
- Recommendation data contains more positive than negative recommendations among records with available information. However, 72.7% of records have no available recommendation value, limiting the conclusions that can be drawn about customer recommendation behaviour.

**Product pricing, quality, and data limitations**

- The average listed product price is €16.99, with prices ranging from €3.20 to €34.50.
- The pricing analysis allows products to be compared by price, customer ratings, overall ratings, and review volume. However, the current findings do not establish whether more expensive products provide greater satisfaction or better value.
- Age-group information is unavailable for 67.3% of records, limiting the representativeness of demographic comparisons.
- The initial product-quality query returns no rows because the quality scores are stored as decimal strings, such as 4.9 and 5.0, rather than the exact string values 1, 2, 3, 4, and 5 expected by the query. Consequently, the relationship between quality scores, price, and customer satisfaction requires further investigation.

**Business recommendations**

Based on the findings, I would recommend investigating the factors contributing to the high ratings of Topicrem and Bioderma and exploring whether these could be applied to lower-rated brands, particularly Eucerin. I would also recommend prioritising popular products with comparatively low ratings for further review, as potential issues affecting these products could influence a larger number of customers. Analysing negative customer feedback in greater depth could also help distinguish product-related concerns from packaging and delivery issues. Further investigation into lower-rated product categories could help identify opportunities to improve customer satisfaction. In addition, improving the completeness of demographic and recommendation data would support more reliable customer-segment analysis. I would recommend correcting the product-quality query and validating the underlying data before drawing conclusions about the relationship between price, quality, and customer satisfaction. These steps would strengthen the analysis and support more informed business decisions.
  
## Previews

![Dashboard Preview](Cocooncenter_pharmacy.pdf)

## Final Projects

[Final SQL Project](SQL/cocooncentrepharmacysql.sql)  
  
[Final Power BI Dashboard](Dashboard/Cocooncenter_pharmacy.pbix)
  
###### Original dataset available in repository
