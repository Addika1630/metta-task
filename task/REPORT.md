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

**2.1 Feature Extraction**

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

**2.2 Data Preprocessing**

   - **Timestamp Conversion:** Converted Unix timestamps (updated_at) into datetime format for accurate time calculations.

   - **Data Grouping:** Data grouping was performed to analyze each pull request (PR) individually. The dataset was grouped by organization, repository, and PR ID,
     ensuring that all related events were processed together. This allowed for accurate calculations of pickup time, review time, merge time, and review cycles for
     each PR.
   - **Scaling:** Scaling was applied to the key metrics (pickup time, review time, merge time, and review cycles count) using the StandardScaler. This standardizes
     the features by removing the mean and scaling them to unit variance, ensuring that each feature contributes equally to the model and preventing features with
     larger scales from dominating the analysis.

###  3. Model Selection Process
   The primary goal of this model is to analyze and cluster developers' performance based on key pull request (PR) metrics. We aim to segment developers according to
   their PR performance and predict future behaviors using machine learning techniques. Key performance metrics such as merge time, review time, review cycles count,
   and pickup time serve as the features to evaluate each developer's workflow.
   
   **Clustering Approach: K-Means**
   
   The first step in this model is to segment developers into clusters based on their performance metrics. To achieve this, we employed K-Means Clustering, a widely
   used unsupervised learning algorithm. Below are the reasons for its selection:
   - Unsupervised Learning: Since the labels for developers' performance (such as good, average, or poor) are not predefined, an unsupervised learning method was
     required. K-Means enables grouping developers based on similar performance behaviors without needing labeled data.
   
   - Simplicity & Efficiency: K-Means is straightforward to implement and computationally efficient. It works well with continuous variables, like merge time, review
     time, and pickup time, which makes it ideal for our dataset.
   
   - Interpretability: K-Means offers clear, understandable results. The developers are grouped into distinct clusters, each representing a unique performance
     pattern, which makes it easy for decision-makers to interpret and act upon the results.

   **Classification Approach: K-Nearest Neighbors (KNN)**
   
   After performing clustering, we used K-Nearest Neighbors (KNN) to classify developers into performance clusters based on their key metrics. KNN was chosen for the
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

### 4. Model Performance Metrics

   The model's performance was evaluated using key metrics that provide insights into how well the K-Nearest Neighbors (KNN) model classifies developers into
   performance clusters. After applying K-Means clustering for segmentation, KNN was used for classification, and the model's performance was assessed using the
   following metrics:

   - **Accuracy**
      Measures the proportion of correct predictions made by the model. It indicates how well the model classifies developers into the correct performance clusters.

   - **Precision**
      Represents the proportion of true positive predictions (correctly classified developers) relative to the total number of positive predictions. It reflects how
      accurate the model is when identifying a developer's performance cluster.

   - **Recall**
      Measures the proportion of true positive predictions relative to the total number of actual positives. It indicates how well the model captures all relevant
      instances in a given performance category.

   - **F1 Score**
      The harmonic mean of precision and recall, balancing the trade-off between the two. It is useful when the dataset is imbalanced, providing a single metric that
      accounts for both false positives and false negatives.

   The model's performance was evaluated on a test set using the metrics outlined above. After splitting the dataset into training and testing sets (X_train, X_test,
   y_train, y_test), the KNN classifier was trained on the training data and then used to predict the clusters for the test data.

   Our Metric Output:
   
      Accuracy: 0.91 (91% of the predictions were correct)

      Precision: 1.00 (100% of the positive predictions were correct)

      Recall: 0.91 (91% of the actual positive instances were identified)

      F1 Score: 0.91 (balanced measure of precision and recall)

   These metrics demonstrate that the model performs effectively, with strong accuracy and recall, and an excellent precision score.

   In addition to evaluating the model's performance, the Elbow Method was used to determine the optimal number of clusters for the K-Means clustering. The Elbow
   Method helps identify the "elbow" point in the plot of the within-cluster sum of squares (WCSS), which shows how compact the clusters are. A sharp bend in the
   graph indicates the optimal number of clusters, minimizing the WCSS while avoiding overfitting.

   This method was applied before clustering to ensure that the chosen number of clusters is ideal for effectively segmenting the developers based on their
   performance metrics. In our case, the elbow occurred at around 6 clusters, which was selected as the best number for meaningful segmentation of developer
   performance.

### 5. Business Insights

   From the trained model and clustered data, we have identified several key insights:

   - Developers with long merge times: Certain developers, including hooperben, gimbernat13, FarrukhRZ, and zolotokrylin, take a long time to merge their pull
     requests. A prolonged merge process slows down the overall development cycle, preventing developers from efficiently progressing to new tasks. The average merge
     time for these developers is around 150 hours (approximately six days), highlighting a potential bottleneck in the final integration stage.

   - Developers with long review and pickup times: Some developers, such as Indralukmana and santosojuan99, experience significantly long review and pickup times for
     their pull requests. These delays affect overall development speed, as developers may struggle to start new pull requests if previous ones are not reviewed
     promptly. The average review time for these developers is approximately 200 hours, which, even accounting for weekends, translates to about a week just for the
     review process. Additionally, the average pickup time is 90 hours (approximately three and a half days).

   - High review times compared to other phases: Some developers, such as 0xcoreblock, have notably high review times relative to their merge and pickup times. For
     example, 0xcoreblock has an average review time of 120 hours, which may be attributed to extensive testing or delays in providing feedback. Other developers,
     including jnoun and lmontero18, have experienced similar delays.

These insights can help identify bottlenecks in the review and merge processes, allowing teams to optimize workflows, improve efficiency, and enhance overall
developer productivity.










      
