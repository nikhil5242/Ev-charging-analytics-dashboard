# ⚡ EV Charging Network Performance & Revenue Insights

## 📊 Project Overview

This project presents an **interactive Power BI dashboard** designed to analyze EV charging station performance across multiple dimensions including utilization, pricing strategy, and revenue generation.

The objective is to provide **data-driven insights** that help optimize charging infrastructure, improve customer experience, and maximize revenue.

---

## 🎯 Key Business Questions

* How does utilization vary across time (hourly, daily, seasonal)?
* What is the impact of different pricing strategies on demand?
* Which pricing model maximizes revenue without reducing usage?
* Where is there a risk of customer churn?

---

## 📌 Dashboard Structure

### 🟦 1. Executive Overview

* Total Stations
* Average Utilization Rate
* Total Revenue
* Average Wait Time
👉 Provides a high-level snapshot of network performance

---

### 🟦 2. Utilization & Demand Patterns

* Peak vs Off-Peak Analysis
* Hourly Utilization Trends
* Weekday vs Weekend Comparison
* Demand Heatmap

👉 Helps identify usage behavior and peak demand windows

---

### 🟦 3. Pricing & Revenue Insights

* Price vs Utilization (Scatter Plot with Trend)
* Revenue vs Pricing Strategy (Combo Chart)
* Session Duration by Pricing Model
* Churn Risk Distribution

👉 Enables pricing optimization and revenue strategy decisions

---

## 📊 Dashboard Preview

### 🔹 Executive Overview

![Executive Overview](Executive Overview.png)

### 🔹 Utilization & Demand Patterns

![Utilization](Utilization & Demand Patterns.png)

### 🔹 Pricing & Revenue Insights

![Pricing](Pricing & Revenue Insights.png)

---

## 🛠️ Tools & Technologies

* Microsoft Power BI
* DAX (Data Analysis Expressions)
* Excel / CSV Dataset
* Data Modeling & Visualization

---

## 📂 Dataset

Due to GitHub file size limitations, only a sample dataset is included in this repository.

* 📄 Sample Dataset: `ev_dataset_sample.csv`

👉 Full dataset can be accessed here:
https://docs.google.com/spreadsheets/d/1XNqOZAwHPnrEf47TGGKXCZ7f0QDQCb0X/edit?usp=sharing&ouid=118069519635142473615&rtpof=true&sd=true

> Note: The dashboard is built using the complete dataset. The sample dataset is provided for structure and reproducibility.

---

## 📈 Key Insights

* Peak-hour utilization is significantly higher than off-peak periods
* Pricing strategy has a direct impact on utilization and revenue
* Flat pricing leads to longer session durations, impacting availability
* Certain segments show higher churn risk due to inefficiencies

---

## 🧪 Hypothesis Testing & Statistical Validation

To validate observed patterns from the dashboard, statistical hypothesis testing was performed using:

* **t-Test (Two-Sample Assuming Unequal Variances)**
* **ANOVA: Single Factor**

---

### 🔹 Hypothesis 1: Pricing Strategy Impacts Utilization

**Test Used:** t-Test (Unequal Variance)
**Objective:** Compare utilization between pricing models

* t-Statistic: **283.09**
* p-value (two-tail): **0.0000**

✅ **Conclusion:**
Reject the null hypothesis. Pricing strategy has a **statistically significant impact** on utilization.

---

### 🔹 Hypothesis 2: Peak vs Non-Peak Utilization Difference

**Test Used:** t-Test (Unequal Variance)
**Objective:** Compare peak-hour and non-peak utilization

* t-Statistic: **-66.48**
* p-value (two-tail): **0.0000**

✅ **Conclusion:**
Reject the null hypothesis. Peak-hour utilization is **significantly different** from non-peak periods.

---

### 🔹 Hypothesis 3: Multi-Group Comparison (ANOVA)

**Test Used:** ANOVA (Single Factor)
**Objective:** Compare utilization across multiple groups (e.g., pricing types / time segments)

* Result: **Statistically Significant Difference Observed**

✅ **Conclusion:**
At least one group differs significantly, confirming that **operational factors influence charging behavior**.

---

### 📊 Business Interpretation

* Pricing models directly influence customer behavior and station usage
* Peak demand is statistically proven, not just visually observed
* Strategic pricing and load balancing can significantly improve performance

---


## 💡 Business Recommendations

* Implement dynamic pricing during peak hours to optimize load
* Improve station availability during high-demand periods
* Monitor high churn-risk segments and improve user experience
* Optimize pricing models to balance utilization and revenue

---

## 📁 Repository Contents

* `EV_Dashboard.pbix` → Power BI Dashboard File
* `Executive Overview.png`, `Utilization & Demand Patterns.png`, `Pricing & Revenue Insights.png` → Dashboard Screenshots

---

## 🚀 Author

**Nikhil Matade**
Aspiring Data Analyst | Power BI | Data Visualization

---

## ⭐ If you found this useful, consider giving it a star!
