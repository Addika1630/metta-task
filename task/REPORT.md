# Predictive Modeling Report

### 1. Introduction
   
   This report presents a predictive modeling approach to analyze and cluster developers' performance based on the historical data. The study focuses on key
   performance metrics, including merge time, review time, pickup time, and review cycles count, to forecast and improve developer efficiency. The report covers model
   selection, feature engineering, model performance evaluation, and insights for business stakeholders.

### 2. Feature Engineering
   Feature engineering involved transforming raw PR event data into structured metrics that provide insights into developers' workflows. In our case, we have a
   history of pull requests for each developer and the process each request goes through until it is merged. Our task is to extract features from this data to better
   understand developers' performance.

   Among the newly extracted features, __pickup time__ measures the time between a pull request being opened and a reviewer beginning their review. A long pickup
   time can indicate a lack of visibility or unavailable reviewers, leading to slower feedback cycles and longer development times. __Review time__ measures the time
   it takes for a pull request to be reviewed and for feedback to be provided. Long review times can impact team productivity and morale. __Merge time__ is a key
   metric that measures the time from a pull request receiving an approved review until it is merged into the main codebase. A long merge time can indicate conflicts
   with other changes or the presence of manual processes for merging.


The following steps were implemented:

**1.1 Feature Extraction**

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

**1.2 Data Preprocessing**

   - **Timestamp Conversion:** Converted Unix timestamps (updated_at) into datetime format for accurate time calculations.

   - **Data Grouping:** Data grouping was performed to analyze each pull request (PR) individually. The dataset was grouped by organization, repository, and PR ID,
     ensuring that all related events were processed together. This allowed for accurate calculations of pickup time, review time, merge time, and review cycles for
     each PR..

###  3. Model Selection Process
   The goal of this model is to analyze and cluster developers' performance based on key PR metrics, and to classify developers into performance clusters using
   machine learning techniques. The task is to segment developers based on their PR performance and predict future developer's behaviors. Key performance metrics
   like merge time, review time, review_cycles_count and pickup time are the features used to assess each developer's workflow.

   **Clustering Approach: K-Means**
   
   The first major part of this model is to segment developers into clusters based on their performance metrics. For this, we utilized K-Means Clustering, a popular
   unsupervised learning technique. Here's why it was selected:
   - Unsupervised Learning: Since developers' performance labels (good, average, poor) are not available beforehand, an unsupervised learning approach was necessary.
     K-Means helps group similar performance behaviors together.
   
   - Simplicity & Efficiency: K-Means is a simple and efficient algorithm to segment developers based on continuous variables like merge time, review time, and pickup
     time. It's computationally lightweight compared to more complex models.
   
   - Interpretability: K-Means provides an easy-to-understand outcome, where developers can be classified into distinct clusters. These clusters represent different
     performance patterns, making it easier for decision-makers to interpret the results.

   **Classification Approach: K-Nearest Neighbors (KNN)**
   
   After clustering, we implemented K-Nearest Neighbors (KNN) to classify developers into performance clusters based on their key metrics. KNN was selected for the
   following reasons:

   - Simplicity and Effectiveness: KNN is simple and effective for small to medium-sized datasets like ours, where developers are characterized by a small number of
     features. KNN classifies based on the closest neighbor in the feature space, making it suitable for our needs.

   - Non-linearity: Since KNN doesn’t assume any linear relationship between the features, it is a great choice for this problem where performance metrics might have
     complex interactions.

   - Accuracy Metrics: KNN's performance was evaluated using accuracy, precision, recall, and F1-score to assess how well the model predicts developers' performance
     clusters. These metrics give a comprehensive understanding of model performance and allow for fine-tuning.

   **Why KNN Over Other Models:**
   - Decision Trees and Random Forest: While decision trees offer interpretability, they are prone to overfitting on smaller datasets. Random Forest could improve
     performance but would be computationally more expensive, especially with a larger dataset. KNN, in contrast, provides a good balance of simplicity,
     interpretability, and performance for this problem.

   - Logistic Regression or SVM: Both logistic regression and SVM are linear models that might not perform well with the non-linear relationships inherent in the
     developer's performance data. KNN, being a non-parametric model, is better suited for this problem, which does not require assumptions about data distribution.

   
   
