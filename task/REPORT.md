# Predictive Modeling Report

### Introduction
   
   This report presents a predictive modeling approach to analyze and cluster developers' performance based on the historical data. The study focuses on key
   performance metrics, including merge time, review time, pickup time, and review cycles count, to forecast and improve developer efficiency. The report covers model
   selection, feature engineering, model performance evaluation, and insights for business stakeholders.

### Feature Engineering
   Feature engineering involved transforming raw PR event data into structured metrics that provide insights into developers' workflows. In our case, we have a
   history of pull requests for each developer and the process each request goes through until it is merged. Our task is to extract features from this data to better
   understand developers' performance.

   Among the newly extracted features, __pickup time__ measures the time between a pull request being opened and a reviewer beginning their review. A long pickup
   time can indicate a lack of visibility or unavailable reviewers, leading to slower feedback cycles and longer development times. __Review time__ measures the time
   it takes for a pull request to be reviewed and for feedback to be provided. Long review times can impact team productivity and morale. __Merge time__ is a key
   metric that measures the time from a pull request receiving an approved review until it is merged into the main codebase. A long merge time can indicate conflicts
   with other changes or the presence of manual processes for merging.


The following steps were implemented:

**1. Feature Extraction**

The following key metrics were derived:

   - **Pickup Time:** Pickup time measures how long it takes for a developer to first engage with a pull request after it is opened. Calculates it as the time
     difference between the PR_OPENED event and the first event related to developer engagement, such as PR_COMMENTED, PR_REVIEW_COMMENT, PR_REJECTED, or
     PR_REVIEW_REJECT. If no such event exists, the pickup time is recorded as zero, assuming immediate engagement or inactivity.

   - **Review Time:** Review time represents the duration from the first engagement (pickup event) to the first approval of the pull request. The code identifies the
     earliest event in PR_APPROVED or PR_REVIEW_APPROVE, then calculates the time difference from the pickup time. If no approval event exists, review time remains
     zero. This metric helps in evaluating how quickly reviews are conducted and if any bottlenecks exist in the approval process.

   - **Merge Time:** Merge time tracks the time taken from approval to the final merging of the pull request. The code identifies the PR_MERGED event and calculates
     the time difference from the first approval event. If no merge event is found, merge time is recorded as zero. This metric helps assess delays between approval
     and integration, highlighting potential inefficiencies in the development workflow, such as waiting times before merging approved code..

   - **Review Cycles Count:** Review cycles count represents the number of iterations a pull request goes through before final approval. The code
     identifies all occurrences of PR_COMMENTED, PR_REVIEW_COMMENT, PR_REJECTED, and PR_REVIEW_REJECT, then counts their unique timestamps. Each event indicates a
     review round where feedback was given, requiring modifications. A higher count suggests multiple review iterations, which could indicate either thorough code
     quality checks or inefficiencies in the review process.
     
   - **Total Time:** The sum of pickup time, review time, and merge time.

   - **Opened to Merged Time:** The total duration from PR opened to merge completion.

**2. Data Preprocessing**

   - **Timestamp Conversion:** Converted Unix timestamps (updated_at) into datetime format for accurate time calculations.

   - **Data Grouping:** Data grouping was performed to analyze each pull request (PR) individually. The dataset was grouped by organization, repository, and PR ID,
     ensuring that all related events were processed together. This allowed for accurate calculations of pickup time, review time, merge time, and review cycles for
     each PR..


   
   
