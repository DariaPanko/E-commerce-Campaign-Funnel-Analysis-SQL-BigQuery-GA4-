WITH google_facebook AS (
SELECT 
'Facebook Ads' AS media_source, 
ad_date, 
fc.campaign_name, 
fa.adset_name, 
fabd.spend,
fabd.impressions,
fabd.clicks,
fabd.leads, 
fabd.value, 
fabd.reach
FROM public.facebook_ads_basic_daily FABD
LEFT JOIN public.facebook_campaign fc 
ON fabd.campaign_id = fc.campaign_id
LEFT JOIN facebook_adset fa 
ON fa.adset_id = fabd.adset_id
UNION ALL 
SELECT 
'Google Ads' AS media_source, 
ad_date, 
campaign_name, 
adset_name, 
spend,
impressions, 
clicks,
leads, 
value, 
reach
FROM google_ads_basic_daily GABD), 
montly_stats AS (
SELECT
    campaign_name, 
    date_trunc('month', ad_date)::date AS month_start, 
    SUM(COALESCE(reach, 0)) AS total_reach
FROM google_facebook
GROUP BY campaign_name, month_start
), 
previous_month AS (
SELECT 
    campaign_name, 
    month_start, 
    total_reach, 
    LAG(total_reach) OVER (PARTITION BY campaign_name ORDER BY month_start) AS prev_total_reach
FROM montly_stats)
SELECT
    campaign_name,
    month_start AS current_month,
    total_reach,
    COALESCE(prev_total_reach, 0) AS prev_reach,
    (total_reach - COALESCE(prev_total_reach, 0)) AS reach_growth
FROM previous_month
ORDER BY reach_growth DESC
LIMIT 1;