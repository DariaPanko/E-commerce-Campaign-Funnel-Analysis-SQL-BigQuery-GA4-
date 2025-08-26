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
SELECT campaign_name, 
date_trunc ('week', ad_date)::DATE AS week_start, 
SUM(COALESCE(value, 0)) AS total_weekly_value
FROM google_facebook
GROUP BY week_start, campaign_name
ORDER BY total_weekly_value DESC LIMIT 1;