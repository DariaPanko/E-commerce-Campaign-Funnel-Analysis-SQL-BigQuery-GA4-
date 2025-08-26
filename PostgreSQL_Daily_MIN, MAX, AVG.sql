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
FROM google_ads_basic_daily GABD)
SELECT
    ad_date, 
    media_source,
    AVG(spend) AS average_daily_spend,
    MAX(spend) AS max_daily_spend,
    MIN(spend) AS min_daily_spend
FROM google_facebook
GROUP BY 
ad_date, 
media_source;
