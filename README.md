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
PostgreSQL_highest_weekly_value_campaign.sql – Campaign with highest weekly value
PostgreSQL_monthly_reach_growth.sql – Largest month-over-month reach increase
