#set page(
  margin: (top: 0.6in, bottom: 0.6in, left: 0.5in, right: 0.5in)
)
#set text(size: 10pt)

// Bold section headings
#show heading.where(level: 1): it => {
  set text(weight: "bold")
  it
}

= CV Match Analysis — Tony Cheung

== Best Fits (Experience Mapping to JD Requirements)

1. Data Analytics Intern, TechFlow Solutions — Directly maps to "mine, manipulate and perform statistical analysis on multiple data sets" and "select features, build, and optimize classifiers". The churn analysis (5,000+ users) demonstrates statistical modeling and business impact (USD120K annual savings).

2. Operations Analytics Intern, Global Logistics Corp — Maps to "apply advanced statistical and machine learning techniques to build, maintain, and improve on multiple real-time decision systems" and "generate and validate hypotheses with A/B, multi-variate methods". The A/B testing framework for warehouse slotting and presentation to director-level stakeholders align with campaign impact measurement.

3. Supply Chain Optimization (HKUST Course) — Maps to "build, maintain, and improve on multiple real-time decision systems" through facility location modeling and sensitivity analysis.

4. Capstone Project: Demand Forecasting — Demonstrates "advanced statistical and machine learning techniques" (XGBoost, LLM-powered feature extraction) and business outcome (14% lower MAPE vs ARIMA baseline).

5. Data Visualization Dashboard (HKUST Career Services) — Shows "analyze data and draw insights from large data sets" and "visualization" skills (Tableau, Power BI, Plotly, Dash).

== Missing Evidence (Gaps)

1. Formal Statistics Foundation — While the BSc in Data Science covers statistics, the CV lacks explicit mention of coursework in probability theory, multivariate analysis, or experimental design beyond "exposure". The JD prefers "exposure in statistical concepts, such as distributions, hypothesis testing and linear regression is preferred" — the CV mentions this as a preference rather than demonstrated mastery.

2. Advanced ML Techniques — The JD lists "basic machine learning techniques including clustering, decision trees" as required. The CV shows strong ML experience (churn prediction, A/B testing, XGBoost) but frames it as applied rather than emphasizing the underlying algorithmic understanding.

3. Real-Time Decision Systems — The JD emphasizes "multiple real-time decision systems". The CV describes static analytics (dashboards, reports) and optimization projects but doesn't explicitly mention deploying models in production environments or managing live decision pipelines.

4. Certifications — The JD expects a bachelor's/master's in a quantitative field. The CV states the MSc is "expected 2026", meaning the candidate is still a fresh graduate. While this aligns with the "fresh graduates are welcome" note, the lack of immediate credential strength could be a minor concern.

== What to Emphasize

- Quantify impact more consistently across all bullets (already strong in experience section)
- Frame experience as "real-time" where applicable (e.g., A/B testing framework for warehouse slotting, real-time dashboard updates)
- Highlight statistical rigor — explicitly mention hypothesis testing, significance testing, and confidence intervals in the CV
- Connect projects to business outcomes more clearly (the capstone already does this well with 14% MAPE improvement)
- Show cross-functional collaboration — the capstone was a team effort and the logistics internship involved 3 product teams