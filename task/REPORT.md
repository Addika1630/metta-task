# Predictive Modeling Report

### Introduction
   
   This report presents a predictive modeling approach to analyze and cluster developers' performance based on the historical data. The study focuses on key performance
   metrics, including merge time, review time, pickup time, and review cycles count, to forecast and improve developer efficiency. The report covers model selection,
   feature engineering, model performance evaluation, and insights for business stakeholders.

### Feature Engineering
   Feature engineering involved transforming raw PR event data into structured metrics that provide insights into developers' workflow. The following steps were implemented:

**1. Feature Extraction**

The following key metrics were derived:

- Pickup Time: Pickup time measures how long it takes for a developer to first engage with a pull request after it is opened. The code calculates it as the time
  difference between the PR_OPENED event and the first event related to developer engagement, such as PR_COMMENTED, PR_REVIEW_COMMENT, PR_REJECTED, or
  PR_REVIEW_REJECT. If no such event exists, the pickup time is recorded as zero, assuming immediate engagement or inactivity.

- Review Time: The time from first engagement to the first approval.

- Merge Time: The time from approval to the final merge.

- Total Time: The sum of pickup time, review time, and merge time.

- Opened to Merged Time: The total duration from PR opened to merge completion.

- Review Cycles Count: The number of review comments and rejection events, representing iterations before approval.

**2. Data Preprocessing**

- Timestamp Conversion: Converted Unix timestamps (updated_at) into datetime format for accurate time calculations.

- Data Grouping: Aggregated PR events based on organization, repository, and id to analyze each PR individually.


   
   
