# SaaS User Onboarding Funnel Analysis

![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white)
![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=flat&logo=googlecloud&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoftexcel&logoColor=white)
![Mixpanel](https://img.shields.io/badge/Mixpanel-7856FF?style=flat)

## Problem Statement

An AI SaaS platform with **7,700+ users across 5 countries** was experiencing
significant user drop-off during onboarding. The product team needed to identify
exactly *where* users were abandoning the journey and *why* — to prioritize the
right fix.

---

## Methodology

**1. Funnel construction** — Mapped the full 4-stage onboarding journey:
`Signup → Activation → Feature Use → Subscription`

**2. Cohort segmentation** — Broke down each stage by:
- Device type (mobile vs desktop)
- Traffic source (organic, paid, referral)
- Region (5 countries)
- User tenure (new vs returning)

**3. User journey mapping** — Used heatmaps and session-level data to find
friction within the Activation stage specifically.

---

## Key Findings

| Stage Transition | Users | Drop-off Rate |
|---|---|---|
| Signup → Activation | 7,700 → ~4,620 | **40% drop-off** |
| Activation → Feature Use | 4,620 → ~3,790 | 18% |
| Feature Use → Subscription | 3,790 → ~3,350 | 11% |

**Critical insight**: Mobile users from 2 specific regions showed **2× higher
drop-off** than desktop users at the Activation stage — pointing to a UX
friction issue, not a product-market fit issue.

---

## Dashboards & Charts


![Funnel Drop-off Chart](dashboards/funnel_chart.png)
![Cohort Retention Grid](dashboards/cohort_retention_grid.png)

---

## Recommended Action & Projected Impact

Based on the friction analysis in the Activation stage, I recommended an
**interactive product walkthrough** for new users (especially mobile).

- Projected **+20% activation rate** improvement
- Finding presented directly to product and operations teams
- Recommendation adopted for next-quarter roadmap

---

## Repository Structure

```
├── queries/
│   ├── 01_funnel_drop_off.sql        # Stage-by-stage conversion & drop-off
│   ├── 02_cohort_segmentation.sql    # Breakdown by device, region, source
│   └── 03_retention_analysis.sql    # 7-day and 30-day retention cohorts
├── dashboards/
│   ├── funnel_chart.png
│   ├── cohort_retention_grid.png
│   └── drop_off_by_segment.png
├── data/
│   └── sample_data.csv              # Anonymised 50-row sample
└── README.md
```

---

## Tools & Skills

`SQL` `BigQuery` `Excel` `Mixpanel` `Funnel Analysis` `Cohort Analysis`
`User Journey Mapping` `User Segmentation` `SaaS Analytics`

---

*Part of my product analytics portfolio. See also:
[Feature Adoption & A/B Testing →](https://github.com/omkarpattnaik8080/feature-adoption-ab-testing)*
