-- ================================================
-- Funnel Drop-Off Analysis: 4-Stage Onboarding
-- Platform: 7,700+ users | Tools: SQL, BigQuery
-- Author: Omkar Pattnaik
-- ================================================

WITH funnel_stages AS (

  -- Stage 1: Total signups
  SELECT
    '1_Signup'        AS stage,
    COUNT(DISTINCT user_id) AS users
  FROM `project.dataset.user_events`
  WHERE event_name = 'signup'

  UNION ALL

  -- Stage 2: Activated users (completed profile/first action)
  SELECT
    '2_Activation',
    COUNT(DISTINCT user_id)
  FROM `project.dataset.user_events`
  WHERE event_name = 'activation_complete'

  UNION ALL

  -- Stage 3: Used a core feature
  SELECT
    '3_Feature_Use',
    COUNT(DISTINCT user_id)
  FROM `project.dataset.user_events`
  WHERE event_name = 'feature_first_use'

  UNION ALL

  -- Stage 4: Converted to subscription
  SELECT
    '4_Subscription',
    COUNT(DISTINCT user_id)
  FROM `project.dataset.subscriptions`
  WHERE status = 'active'

)

SELECT
  stage,
  users,
  LAG(users) OVER (ORDER BY stage) AS prev_stage_users,
  ROUND(
    (users * 100.0) /
    NULLIF(LAG(users) OVER (ORDER BY stage), 0), 1
  ) AS conversion_rate_pct,
  ROUND(
    100 - (users * 100.0) /
    NULLIF(LAG(users) OVER (ORDER BY stage), 0), 1
  ) AS drop_off_rate_pct

FROM funnel_stages
ORDER BY stage;
