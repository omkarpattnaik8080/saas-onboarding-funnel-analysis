-- ================================================
-- Cohort Segmentation: Drop-off by Device, Region, Source
-- ================================================

SELECT
  device_type,
  traffic_source,
  region,
  COUNT(DISTINCT user_id)                           AS total_users,
  COUNT(DISTINCT CASE WHEN reached_activation
        THEN user_id END)                           AS activated,
  ROUND(
    COUNT(DISTINCT CASE WHEN reached_activation
          THEN user_id END) * 100.0
    / NULLIF(COUNT(DISTINCT user_id), 0), 1
  )                                                   AS activation_rate_pct,
  ROUND(
    100 - COUNT(DISTINCT CASE WHEN reached_activation
               THEN user_id END) * 100.0
    / NULLIF(COUNT(DISTINCT user_id), 0), 1
  )                                                   AS drop_off_pct

FROM `project.dataset.user_sessions`
GROUP BY 1, 2, 3
ORDER BY drop_off_pct DESC;
