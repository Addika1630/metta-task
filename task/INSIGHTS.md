### Intoroduction
This document provides key insights from the interactive dashboard built to analyze developers' performance based on their pull request (PR) workflows. The goal is to identify bottlenecks and areas for improvement in the development process.

### Exploratory Data Analysis (EDA)

**Merge rate**

Now, we can calculate the percentage of pull requests that were successfully merged out of the total pull requests that were opened. This metric helps assess developer productivity and code integration efficiency. The pull requests that were not merged may have been rejected due to quality concerns, conflicts, or failure to meet project requirements. Additionally, some pull requests may have been closed because they were no longer necessary, either due to changes in project priorities or because their functionality was addressed elsewhere. Understanding these trends can provide valuable insights into development workflows and help improve overall pull request management.

Pull Request Merge Rate Analysis

From the total **4,506** opened pull requests, **4,058** were successfully merged.  
The merge rate is calculated as follows:

$$
\frac{4058}{4506} \times 100 = 90.05\%
$$

This means **90.05%** of the opened pull requests were merged. The remaining **9.94%** were either rejected, closed without merging, or deemed unnecessary.

