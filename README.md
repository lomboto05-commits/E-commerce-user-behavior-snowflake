# E-Commerce User Behaviour Analysis

## 📊 Project Overview

This project analyses e-commerce user behaviour using **Snowflake SQL** and **Power BI**, focusing on customer engagement, purchasing behaviour, revenue and conversion throughout the e-commerce journey.

The project uses **884,474 recorded events** covering product views, cart activity and purchases. The data was cleaned and validated in Snowflake before being analysed using SQL and presented through a Power BI dashboard.

The main objective was to understand how users interact with an e-commerce platform and identify patterns across the customer journey from product discovery through to purchase.

---

## 🔄 Analytics Workflow

E-Commerce Event Data  
↓  
Snowflake RAW Layer  
↓  
Data Cleaning & Validation  
↓  
Clean Analytical Dataset  
↓  
SQL Analysis  
↓  
Funnel & Revenue Analysis  
↓  
Power BI Dashboard

---

## 🛠️ Technologies Used

- **Snowflake** – data storage, transformation and analysis




## 🗄️ Snowflake Data Analysis

The project uses a layered structure within Snowflake:

**RAW**
- `EVENTS`

**CLEANED**
- `EVENTS_CLEAN`
- `EVENTS_CLEAN_FINAL`

The source CSV was loaded into the `RAW.EVENTS` table using the Snowflake interface.

The data was then cleaned and validated before being used for the final analysis.

### Data Quality Checks

The cleaning and validation process included:

- NULL value checks
- Duplicate record detection
- Duplicate user/product/time combinations
- Price validation
- Detection of zero and negative prices
- Minimum and maximum price checks
- Timestamp validation
- Event-type validation

Snowflake functions including `COUNT_IF` and `TRY_TO_TIMESTAMP_NTZ` were used during the validation process.

The raw data was preserved to maintain traceability between the source data and the final analytical dataset.

---

## 📈 Key Metrics

| Metric | Result |
|---|---:|
| Total Events | **884,474** |
| Purchase Events | **37,343** |
| Purchase Revenue | **€5,125,113.92** |
| Session Cart-to-Purchase Rate | **50.31%** |

---

## 🛒 Customer Journey & Funnel Analysis

A key part of the analysis was understanding movement through the e-commerce funnel.

**Product Views → Cart → Purchase**

Two approaches to cart-to-purchase conversion were evaluated.

### Event-Level Conversion

The event-level calculation produced:

**69.11%**

This compares purchase events against cart events.

### Session-Level Conversion

A more meaningful funnel measure was created at the **session level**.

The session-level calculation identifies sessions containing a cart event and checks whether those same sessions also contained a purchase.

The resulting conversion rate was:

### **50.31%**

The session-level measure provides a more appropriate representation of conversion because it evaluates the customer journey at the session level rather than simply comparing event counts.

A CTE and session-based logic were used for the analysis, with a JOIN-based calculation used to validate the result.

---

## 💰 Revenue Analysis

Purchase revenue was calculated using purchase events only.

### **€5,125,113.92**

across:

### **37,343 purchase events**

Revenue was analysed across:

- Brands
- Product categories
- Individual users
- Purchase activity

The analysis also included metric validation between the Snowflake SQL results and the Power BI dashboard.

Revenue measures were aligned using consistent purchase-event filtering so that the dashboard and SQL analysis use the same metric definitions.

---

## 🧪 Metric Validation

An important part of the project was validating that metrics remained consistent between the underlying Snowflake analysis and the Power BI reporting layer.

This included:

- Validating purchase revenue
- Comparing brand and category revenue
- Checking funnel calculations
- Comparing event-level and session-level conversion
- Ensuring Power BI visual filters matched the intended metric definitions

This helped ensure that the final dashboard reflects the same analytical definitions used in the underlying SQL analysis.

---

## 📊 Power BI Dashboard

The Power BI dashboard brings the main analysis together into a single view.

It includes:

- Total events
- Total revenue
- Total purchases
- Session cart-to-purchase rate
- Events by type
- Purchase revenue by brand
- Revenue by category
- Average purchase price by category
- Top users by purchase activity
- Top users by spending

### Dashboard

![Power BI Dashboard](E_Commerce_PowerBi_Dashboard.PNG)

[View the full Power BI dashboard](E-commerce_user_behavior_Dashboard.pdf)


---

## 🔎 Key Findings

### Customer Engagement

Product views make up the majority of recorded events, showing that browsing activity is substantially higher than cart and purchase activity.

### Purchasing Behaviour

The dataset contains **37,343 purchase events**, providing a substantial base for analysing purchasing behaviour.

### Revenue

Total purchase revenue is approximately **€5.13M**, with significant differences in revenue across brands and product categories.

### Funnel Conversion

The session-level cart-to-purchase rate is **50.31%**.

The difference between the event-level rate of **69.11%** and the session-level rate demonstrates why metric definitions and aggregation level are important when analysing customer journeys.

### Customer Spending

The dashboard identifies users with comparatively high purchase activity and spending, allowing potential high-value customer behaviour to be explored.

---

## ⚠️ Limitations

- The dataset represents recorded website events rather than complete customer histories.
- Event-level and session-level conversion metrics measure different aspects of user behaviour.
- The analysis is limited to the fields available in the dataset.
- Customer retention and long-term behaviour cannot be fully evaluated from the available event data alone.
- Correlation-based observations should not be interpreted as proof of causation.

---

## 🎯 Skills Demonstrated

- Snowflake
- SQL
- Data cleaning
- Data-quality validation
- Event-level analytics
- Session-level analysis
- Funnel analysis
- CTEs
- JOINs
- Aggregation
- Window functions
- Revenue analysis
- Metric validation
- Power BI
- Data visualisation
- Business-focused analytical reporting
- GitHub version control

---

## 🤖 AI Assistance

AI assistance was used during development for some coding help and validation.

---
- **SQL** – data exploration, cleaning, validation and analytics
- **Power BI** – dashboard development and data visualisation
- **GitHub** – version control and project documentation
