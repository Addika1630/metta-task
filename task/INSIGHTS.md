### Intoroduction
  This report presents an exploratory analysis of pull request metrics to evaluate developer performance and workflow efficiency. By examining merge rates, PR
  timelines, and review cycles, we uncover key patterns and bottlenecks. The insights and recommendations aim to optimize code integration, reduce delays, and
  enhance team collaboration. You can explore the Interactive Dashboard [here](https://developer-performance.streamlit.app/)



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

![pull-request-merge-rate](https://github.com/user-attachments/assets/82b1b30b-38cf-42ef-9a79-eeb64280d34f)

__Recommendation__

  To improve developer efficiency and increase the number of successfully merged pull requests, one effective strategy is to keep PRs small and modular—this is where
  stacking becomes valuable.

  Stacking pull requests allows you to create a sequence of PRs, where each new one builds upon the changes introduced in the previous. This approach enables
  continuous submission of PRs while earlier ones are still under review. Once an earlier PR is reviewed and merged, the subsequent PRs are automatically updated to
  reflect the latest state of the codebase. This keeps changes synchronized and ensures smooth integration.

  Stacking offers two major benefits that improve review response times and overall PR metrics on GitHub:

  - Simplified Reviews: Smaller, more focused PRs are easier to review. This leads to quicker feedback, reduced reviewer fatigue, and a more efficient code review
    cycle.

  - Continuous Progress: By allowing developers to keep working and submitting new PRs, stacking prevents bottlenecks caused by pending reviews and helps maintain
    development momentum.

  Adopting a stacking approach can significantly enhance workflow efficiency, reduce unmerged PRs, and accelerate project delivery.


**Pickup time, Review time and Merge time**

  - Pickup Time is the duration between when a PR is opened and when a reviewer first engages with it. A long pickup time may indicate a lack of visibility, slow
    triaging, or reviewer unavailability, leading to delayed feedback.

  - Review Time measures how long it takes from the first engagement to the first approval of the PR. Extended review times can suggest inefficiencies in the review
    process or unclear code quality standards.

  - Merge Time refers to the time from when a PR is approved to when it is finally merged into the main codebase. Long merge times may point to manual merging
    processes, integration issues, or low prioritization.

  - Review Cycles Count captures the number of feedback iterations a PR goes through. A high count may imply extensive back-and-forth, unclear requirements, or code
    needing multiple revisions before acceptance.

The average total time taken for a pull request—from the moment it is opened to when it is finally merged—is approximately 24 hours or more. This includes pickup time, review time, and merge time. According to the Holdex contributing guidelines, pull requests are expected to be reviewed and merged within 3 to 4 hours. Therefore, the current time frame exceeds the recommended duration. However, data visualization shows that the total time is gradually decreasing over time, which is a positive development.

Breaking down the components, review time accounts for the largest portion of the total time, followed by pickup time, and then merge time. Initially, merge time was higher, but it has significantly decreased, indicating improved efficiency in the final stage of the PR process.

![review-time](https://github.com/user-attachments/assets/ccba57ea-c763-463b-a156-fc2cc3b89249)


When examining the relationship between review cycles count and time, we notice that the number of review cycles was relatively low in the beginning, peaked in the middle, and then dropped again. A high review cycle count often suggests uncertainty from reviewers or the need for significant changes before approval. This can result in longer review times and delays in merging. Streamlining review cycles could help improve overall PR turnaround time.

![review-cycles](https://github.com/user-attachments/assets/566a3e7f-6a9c-4ff3-94df-c9527f23b51d)


__Recommendation__

  To reduce PR turnaround time and align with Holdex's 3–4 hour guideline, teams should streamline the review process by enforcing clearer coding standards and
  improving reviewer availability. Encouraging developers to submit smaller, well-scoped PRs can simplify reviews and reduce cycles. Implementing automated code
  checks can catch issues early, minimizing back-and-forth feedback. Additionally, assigning dedicated reviewers or rotating review shifts ensures quicker pickups.
  Monitoring PR metrics regularly can help identify bottlenecks and improve accountability. By optimizing these processes, teams can significantly reduce pickup and
  review times, leading to faster integrations, improved productivity, and better alignment with contribution standards.


### Conclusion
  In summary, our analysis highlights areas for improving PR efficiency, such as reducing review times and increasing merge rates through better practices like
  stacking and clearer standards. Implementing these strategies will not only enhance developer productivity but also align workflows with Holdex's guidelines for
  faster, more effective collaboration.


















