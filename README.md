# E-commerce User Behaviour Analysis

E-commerce user behaviour analytics using Snowflake, SQL and Power BI.

## Project Overview

This project analyses e-commerce event data to understand customer engagement, purchasing behaviour, revenue patterns and product performance.

The analysis was performed using SQL in Snowflake, with the results presented through an interactive Power BI dashboard.

The project focuses on transforming raw e-commerce event data into meaningful business insights.

## Technologies Used

- Snowflake
- SQL
- Power BI
- GitHub

## Dataset

The dataset contains e-commerce user events, including:

- Product views
- Add-to-cart events
- Purchases
- Product categories
- Brands
- Prices
- User IDs

The data was analysed to identify patterns in customer engagement, purchasing activity and spending behaviour.

## SQL Analysis

The SQL analysis was performed in Snowflake.

The queries used to analyse the data are available in the `sql` folder.

The analysis includes:

- Filtering data using `WHERE`
- Aggregating data using `SUM`, `AVG` and `COUNT`
- Grouping results using `GROUP BY`
- Sorting results using `ORDER BY`
- Ranking and limiting results
- Handling missing values using `IS NOT NULL`
- Rounding numerical results using `ROUND`

The queries were designed to answer business-focused questions around customer behaviour, product performance and purchasing activity.

## Project Objective

The objective of this project was to demonstrate the ability to:

- Analyse large-scale e-commerce event data
- Write SQL queries in Snowflake
- Identify meaningful customer and revenue patterns
- Transform analysis into clear business insights
- Build an interactive Power BI dashboard
- Present data analysis in a professional and accessible format

## Power BI Dashboard

The Power BI dashboard provides an overview of customer engagement, purchasing behaviour and product performance.

![E-commerce Power BI Dashboard](E_Commerce_PowerBi_Dashboard.PNG)

### Dashboard KPIs

The dashboard contains four main KPIs:

- **Total Events:** 884,474
- **Total Revenue:** €5.13M
- **Total Purchases:** 37,343
- **Cart-to-Purchase Rate:** 69.11%

### Customer Engagement

The dataset contains **884,474 total events**.

Event activity is heavily concentrated around product views:

- **Views:** approximately 790K
- **Cart events:** approximately 50K
- **Purchases:** approximately 40K

This shows that product browsing represents the largest stage of customer activity, while a smaller proportion of events progress through the purchasing funnel.

### Cart-to-Purchase Conversion

The dashboard reports a **69.11% cart-to-purchase rate**.

This indicates that a significant proportion of recorded cart events progress to a purchase, suggesting relatively strong conversion among users who have already demonstrated purchase intent.

### Brand Performance

The dashboard compares purchase value across brands.

The highest-performing brands include:

| Brand | Purchase Value |
|---|---:|
| Top brand | €16.2M |
| Palit | €11.6M |
| MSI | €9.0M |
| Gigabyte | €8.8M |
| ASUS | €6.7M |
| Samsung | €4.9M |
| AMD | €3.7M |
| LG | €3.3M |
| Sapphire | €3.2M |

Palit, MSI and Gigabyte are among the strongest-performing brands in the analysis.

### Revenue by Category

The dashboard identifies the strongest product categories based on recorded purchase value.

The leading category generated approximately **€45M**, followed by a category generating approximately **€20M**.

Other leading categories include:

- Electronics video and TV
- Computer peripherals
- Electronics telephone
- Computer components
- Electronics audio and acoustic

These results highlight the importance of computer and electronics-related categories within the dataset.

### Average Purchase Price

The dashboard also compares average purchase prices across categories.

The highest average purchase prices shown are:

| Category | Average Purchase Price |
|---|---:|
| Electronics video/projectors | €746.69 |
| Appliances/kitchen | €666.57 |
| Electronics audio/music | €436.68 |
| Country yard cultivator | €429.05 |
| Computer components | €385.98 |
| Computer peripherals | €375.43 |
| Electronics video/TV | €354.06 |

This provides an indication of which categories contain higher-value purchases.

### Top Users by Purchases

The dashboard identifies the users with the highest number of recorded purchase events.

The highest purchasing user recorded **56 purchases**, followed by users with:

- 49 purchases
- 45 purchases
- 43 purchases
- 42 purchases
- 39 purchases
- 36 purchases
- 33 purchases

This helps identify highly active customers within the dataset.

### Top Users by Spending

The dashboard also identifies the highest-spending users.

The highest-spending user generated approximately **€12.1K** in recorded purchase value.

Other high-spending users generated approximately:

- €9.4K
- €8.6K
- €8.4K
- €8.0K
- €6.6K
- €6.3K
- €5.9K
- €5.7K
- €5.5K

This analysis helps highlight customers with comparatively high purchasing value.

## Key Findings

The analysis identified several important patterns:

1. **Product views dominate customer activity**, with approximately 790K view events compared with around 50K cart events and 40K purchase events.

2. **The cart-to-purchase rate is 69.11%**, indicating strong conversion among recorded cart events.

3. **Total revenue is €5.13M**, with 37,343 recorded purchases shown in the dashboard KPI.

4. **Brand performance varies considerably**, with the leading brand recording approximately €16.2M in purchase value, followed by Palit at €11.6M, MSI at €9.0M and Gigabyte at €8.8M.

5. **Computer and electronics categories represent major areas of purchase activity**, with the leading category recording approximately €45M in the category breakdown.

6. **Average purchase prices vary substantially between categories**, with the highest category average reaching €746.69.

7. **A small number of users show particularly high levels of purchasing activity**, with the highest user recording 56 purchases.

8. **High-spending customers can be identified from the event data**, with the highest-spending user recording approximately €12.1K.

> Note: The category and brand charts use aggregated `PRICE` values from the underlying event data, while the dashboard's Total Revenue KPI represents the project's revenue measure. These figures should therefore be interpreted as separate dashboard measures rather than directly compared.

## SQL Questions

The SQL analysis was structured around business questions relating to:

- Customer engagement
- Event activity
- Purchasing behaviour
- Revenue and product categories
- Brand performance
- Customer purchasing frequency
- Customer spending
- Average purchase prices
- Ranking and identifying top-performing users and products

The SQL queries used to answer these questions are available in the `sql` folder.

## Business Value

This analysis demonstrates how e-commerce event data can be transformed into actionable business information.

The results can help businesses:

- Understand customer behaviour throughout the purchasing funnel
- Identify high-performing brands and categories
- Identify high-value customers
- Monitor purchasing activity
- Compare average product prices
- Understand conversion behaviour
- Support data-driven commercial decisions
