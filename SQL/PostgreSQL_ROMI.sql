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
fabd.value	
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
value
FROM google_ads_basic_daily GABD), 
daily_romi AS (
    SELECT
        ad_date,
        SUM(spend) AS total_spend,
        SUM(value) AS total_value,
        CASE 
            WHEN SUM(spend) = 0 THEN 0
            ELSE SUM(value) / SUM(spend)
        END AS romi
    FROM google_facebook
    GROUP BY ad_date
)
SELECT ad_date,
ROMI
FROM daily_romi
ORDER BY ROMI DESC
LIMIT 5;