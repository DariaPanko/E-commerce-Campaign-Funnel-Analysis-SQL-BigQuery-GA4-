# E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4
Project Overview

This project demonstrates a complete workflow of digital marketing analytics combined with eCommerce user behavior insights.

The analysis is based on:

- advertising campaign data from Google Ads and Facebook Ads stored in PostgreSQL

- user interaction events exported from Google Analytics 4 into BigQuery.

Key focus areas include:


- evaluation of marketing spend, efficiency, and ROMI


- building a sales funnel covering the entire journey from session start to purchase


- conversion rate analysis across traffic sources, dates, and landing pages


- exploring correlations between user engagement metrics and purchasing behavior

  

Project Goals

- generate detailed performance insights for advertising campaigns
  
- detect the main drop-off stages within the sales funnel
- develop SQL queries optimized for BI dashboard integration
- strengthen skills with advanced PostgreSQL and BigQuery queries

Tools & Technologies

- SQL: PostgreSQL (DBeaver), Google BigQuery

Data Sources:

- ads_analysis_goit_course (PostgreSQL)
- public GA4 eCommerce dataset (BigQuery)
- metrics: ROMI, reach, conversions, engagement time

  
Methodology: 

- funnel Analysis
- time-series aggregation
- correlation analysis

Repository Structure

- SQL/ – all SQL queries
- outputs/ – results of query execution in CSV
- README.md

SQL Scripts

PostgreSQL Queries (Task 1)


- [PostgreSQL_Daily_MIN, MAX, AVG.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/main/PostgreSQL_Daily_MIN%2C%20MAX%2C%20AVG.sql) – Average, min, max daily spend by platform
- [PostgreSQL_ROMI.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/905af02cc9a077ff2bb6b0b664d8feb770ffb4ee/PostgreSQL_ROMI.sql) – Top 5 days with highest ROMI
- [PostgreSQL_Weekly_value.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/ec8862c7bf498cf85d79479d4c4daf3828917ac2/PostgreSQL_Weekly_value.sql) - Campaign with highest weekly value
- [PostgreSQL_Reach_grown.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/ec8862c7bf498cf85d79479d4c4daf3828917ac2/PostgreSQL_Reach_grown.sql) – Largest month-over-month reach increase

BigQuery Queries (Tasks 2–5)
- [BigQuery_GA4_events_extraction.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/8b2b31f88b778c96612227d13847b25e5b7044b2/BigQuery_GA4_events_extraction.sql) – Extract required GA4 events with selected dimensions
- [BigQuery_conversion_funnel.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/b6e6e88d84fb0604550d821d37f05b38005a977e/BigQuery_conversion_funnel.sql) - Build conversion funnel metrics by date, source, medium, campaign
- [BigQuery_landing_page_conversion.sql](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/71283f98b74cc77c482954f1f20c2e11f80218a1/BigQuery_landing_page_conversion.sql) - Compare conversions by landing page

PostgreSQL Results

- [PostgreSQL_daily_spend_stats.csv]() – Output of Task 1: Average, min, max daily spend by platform
- [PostgreSQL_top5_days_by_romi.csv]() – Output of Task 1: Top 5 days with highest ROMI
- [PostgreSQL_highest_weekly_value_campaign.csv]() – Output of Task 1: Campaign with highest weekly value

BigQuery Results

- [BigQuery_ga4_events_extraction.csv](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/4cfaeb9a41171eaa278b8d87b63ba3de7aea5f79/BigQuery_ga4_events_extraction.csv) – Output of Task 2: Extract required GA4 events with selected dimensions
- [BigQuery_conversion_funnel.csv](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/2856eb9eff30a58b98b0954cc39c037da075ba8e/BigQuery_conversion_funnel.csv) – Output of Task 3: Conversion funnel metrics by date, source, medium, campaign
- [BigQuery_landing_page_conversion.csv](https://github.com/DariaPanko/E-commerce-Campaign-Funnel-Analysis-SQL-BigQuery-GA4-/blob/5311cf8add93ae26d8e82e90a2c1a2291b6069a4/BigQuery_landing_page_conversion.csv) – Output of Task 4: Compare conversions by landing page

Tasks

Task 1: Campaign Details Exploration

Source: PostgreSQL (ads_analysis_goit_course)

Objectives:
- Calculate average, minimum, and maximum daily spend for Google and Facebook Ads
- Identify top-5 days by ROMI
- Determine the campaign with the highest weekly value
- Find the largest month-over-month reach increase

Task 2: GA4 Data Preparation in BigQuery

Source: Public GA4 eCommerce dataset (2021)
Objectives:

- Extract events: session_start, view_item, add_to_cart, begin_checkout, add_shipping_info, add_payment_info, purchase
- Keep dimensions: timestamp, users, sessions, country, device, traffic source, campaign name

  
Task 3: Conversion Calculations

Goal: Build a conversion funnel (from session start to purchase) by date, source, medium, campaign.

Metrics:
- visit_to_cart
- visit_to_checkout
- visit_to_purchase

  
Task 4: Landing Page Conversion Comparison

Source: GA4 dataset (2020)

Objectives:
- Identify the page path of session start
- Calculate conversion from session start to purchase

Results
 
- SQL queries run successfully in PostgreSQL and BigQuery
- Built analytical tables ready for BI integration
- Identified top-performing campaigns and landing pages with highest conversions
- Calculated conversion rates and identified drop-off points in the funnel
