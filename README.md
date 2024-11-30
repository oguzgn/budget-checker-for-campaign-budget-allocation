# Budget Checker

## **Overview**
This project provides a SQL-based solution for analyzing and monitoring the performance of marketing campaigns. The `budget-checker.sql` script aggregates and evaluates campaign performance over 7-day (L7D) and 30-day (L30D) periods. The results enable insights into the cost distribution and effectiveness of campaigns, particularly for **Sales Objectives**.

---

## **1. Data Modelling**

### **1.1 Scope and Context**
- The dataset includes campaigns with two primary objectives: **Sales** and **Purchase**.
- This example focuses solely on **Sales Objective** campaigns.
- Metrics other than costs are exclusively tailored for sales-oriented analysis, thus do not filter with `objective='sales'`.

### **1.2 Data Structure**
- **Final Table**: A daily campaign performance dataset that serves as the foundation of this query. For more details, check the related repository: [**fully-automated-performance-marketing-dashboard**](https://github.com/oguzgn/fully-automated-performance-marketing-dashboard).

### **1.3 Modelling Approach**
- **Time Intervals**: Metrics are aggregated over:
  - **Last 7 Days (L7D)**
  - **Last 30 Days (L30D)**
- **Partition By Logic**:
  - **Partition by Objective**: Provides an overview of all sales campaigns combined.
  - **Partition by Campaign**: Focuses on the performance of individual campaigns.
  - This enables both general and campaign-specific performance insights.

### **1.4 Fixed Time Range**
- **7-Day Metrics**: If a date falls within the last 7 days, the same aggregated value is assigned to all rows in this range.
- **30-Day Metrics**: Metrics span the full 30-day period, with no further breakdown.

---

## **2. Code Structure**

### **2.1 temp1**
This step processes raw data using `CASE WHEN` logic to aggregate metrics by time intervals. Key calculations:
- **Objective-Level Metrics**: Aggregates performance for all sales campaigns combined.
- **Campaign-Level Metrics**: Aggregates performance for each individual campaign.

### **2.2 temp2**
- Removes redundant values from `temp1`.
- Adds additional dimensions (e.g., channel, country) for granular filtering and segmentation.

### **2.3 Final Query**
- Outputs the processed data, sorted by **30-day campaign cost (Sales_Cost_campaign_L30D)**.

---

## **3. Use Case Example**
Suppose there are 15 **Sales Campaigns**:
- **Partition by Objective**: Displays the total performance of all 15 campaigns.
- **Partition by Campaign**: Highlights the individual contribution of each campaign.

This structure enables the identification of campaigns with the highest cost and performance, facilitating informed decision-making.

---

## **4. Notes**
- Data is limited to the most recent 30 days.
- The daily structure of the dataset enhances the ability to analyze and monitor performance marketing dashboards effectively.

---

This query is designed to streamline performance analysis and budget optimization for marketing campaigns. 🎯
