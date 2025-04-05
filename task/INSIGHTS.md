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

__Recommendation__

  To reduce the number of unmerged pull requests, teams should start by clearly defining problems before development begins. This minimizes confusion, shortens
  resolution time, and reduces the likelihood of rejection. Developers should verify whether a similar issue has already been addressed to avoid duplication.
  Introducing clear and standardized code quality guidelines can also help maintain consistency across submissions and streamline the review process. Encouraging
  regular communication between team members and reviewers further ensures alignment on expectations. These practices not only improve merge rates but also enhance
  overall development efficiency and collaboration within the team.
  
__Pull Request Metrics__

Pull Request metrics are an essential tool for software team productivity. By analyzing engineering metrics such as number of pull requests merged, and pull request lifetime teams can gain valuable insights into their development process.

**Number of PRs Merged**

I created an interactive dashboard to showcase trends and insights. Based on the data, addis-belete, angelicawill, and georgeciubotaru are the top three developers with the highest number of merged Pull Requests. However, this does not mean that other developers should be underestimated. For example, teodorus-nathaniel joined later but still managed to merge a high number of Pull Requests in a short period. Here is the number of Pull Request merged and their developer's name.

![pull-request-merged](https://github.com/user-attachments/assets/98a801df-f609-420a-8457-4199bceba24b)

From the plotted graph of Pull Requests merged over time, the highest number of merges occurred at the end of June 2024 and the end of October 2024. Conversely, the lowest number of merged Pull Requests was observed in the late September 2024 (around the 20s).

I have linked the interactive dashboard to allow further exploration of these insights and trends. [here](https://developer-performance.streamlit.app/)
