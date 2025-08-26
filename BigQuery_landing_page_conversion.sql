WITH session_starts AS (
  SELECT
    CONCAT(user_pseudo_id, '-', CAST((
      SELECT ep.value.int_value 
      FROM UNNEST(event_params) AS ep 
      WHERE ep.key = 'ga_session_id'
    ) AS STRING)) AS user_session_id,
    REPLACE(SPLIT((
      SELECT ep.value.string_value 
      FROM UNNEST(event_params) AS ep 
      WHERE ep.key = 'page_location'
    ), '?')[OFFSET(0)], 'https://shop.googlemerchandisestore.com/', '') AS page_path
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_2020*`
  WHERE event_name = 'session_start'
),

purchases AS (
  SELECT DISTINCT
    CONCAT(user_pseudo_id, '-', CAST((
      SELECT ep.value.int_value 
      FROM UNNEST(event_params) AS ep 
      WHERE ep.key = 'ga_session_id'
    ) AS STRING)) AS user_session_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_2020*`
  WHERE event_name = 'purchase'
)

SELECT
  s.page_path,
  COUNT(DISTINCT s.user_session_id) AS total_sessions,
  COUNT(DISTINCT CASE WHEN p.user_session_id IS NOT NULL THEN s.user_session_id END) AS total_purchases,
  ROUND(COUNT(DISTINCT CASE WHEN p.user_session_id IS NOT NULL THEN s.user_session_id END) / COUNT(DISTINCT s.user_session_id) * 100, 2) AS conversion_percent
FROM session_starts s
LEFT JOIN purchases p
  ON s.user_session_id = p.user_session_id
GROUP BY s.page_path
ORDER BY conversion_percent DESC
