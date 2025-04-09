# 🧠 Developer Coaching Dashboard

Welcome to the Developer Coaching Dashboard, a powerful data analytics tool designed to enhance the coaching and development of software engineers. Built using Streamlit, this platform offers a comprehensive view into developers' pull request (PR) activity, providing actionable insights to optimize performance, collaboration, and engagement.

## 📊 Project Overview

The dashboard leverages key performance metrics such as **merge time**, **review time**, **pickup time**, and **review cycles** to help managers and teams make informed decisions about coaching, resource allocation, and process improvements. It features advanced functionalities like clustering developers based on performance metrics, interactive data visualizations, and predictive modeling to assess future trends and potential challenges.

Key capabilities include:

- **Pull Request Efficiency Analysis**: Track and analyze key metrics over time, such as the time spent on reviewing and merging PRs.
- **Developer Clustering**: Group developers into clusters based on performance to identify trends and outliers.
- **Predictive Modeling**: Forecast future developer performance using machine learning algorithms like K-Means and KNN.
- **Interactive Dashboards**: Visualize PR trends, review cycles, and more with interactive charts.

This dashboard is ideal for engineering managers and teams looking to improve developer performance, streamline workflows, and provide personalized coaching.

---


## 📁 Project Structure

```bash
holdex-trial-data_scientist/
├── notebook/
│   ├── data_cleaning.ipynb          # Data Cleaning notebook
│   └── feature_engineering.ipynb    # Featue Engineering notebook
├── INSIGHTS.md                      # Insights and Recommendation report
├── PREDICTIVE_REPORT.md             # Predictive model report
├── app.py                           # Predictive model report
├── requirements.txt                 # Python dependencies
└── README.md                        # Project documentation
```
---

### Description of Key Files:
  - **notebook/data_cleaning.ipynb**: This notebook contains the steps to clean the raw data, handle missing values, and prepare it for analysis and modeling.

  - **notebook/feature_engineering.ipynb**: In this notebook, feature engineering techniques are applied to create new features and transform existing ones to improve
    model performance.

  - **INSIGHTS.md**: Provides insights, key findings, and recommendations based on the data analysis conducted in the project.

  - **PREDICTIVE_REPORT.md**: Contains a detailed report on the predictive modeling process, including model selection, training, evaluation, and performance metrics.

  - **app.py**: The main Python application file that serves the Developer Coaching Dashboard. It provides an interactive user interface for analyzing pull requests,
    developer performance, and efficiency. The app is built using Streamlit and incorporates multiple features:
  
  - **requirements.txt**: Lists all necessary Python libraries and dependencies to replicate the project environment. It can be installed with `pip install -r
    requirements.txt`.

## 🛠️ Tech Stack

- `Python 3.8+`
- `Pandas`, `NumPy`
- `Scikit-learn`
- `Streamlit`
- `Plotly`
- `KMeans`, `KNN`, `StandardScaler`

---

## ⚙️ Installation

  1. Clone the repostory:

  ```bash
  git clone https://github.com/Addika1630/holdex-trial-data_scientist.git
  ```

  2. Navigate to the project directory:
  ```
  cd holdex-trial-data_scientist
  ```

  3. Install the required dependencies:
  ```
  pip install -r requirements.txt
  ```

  4. Run the application
   ```
  streamlit run app.py
  ```

  5. Navigate to the local repository by visiting the URL provided by Streamlit, typically:
 ```
  http://localhost:8501
  ```


### 📸 Screenshots
**Dashboard Overview**

Number of Pull Requests Merged versus Date

![pull-request-merge-rate](https://github.com/user-attachments/assets/0c521371-84cb-480e-8b2a-ab7471fe2a77)


Average Time Taken to Merge Pull Requests versus Date
![review-time](https://github.com/user-attachments/assets/7f5ec078-0233-4bb1-951e-f615d554e92f)


## 📬 Contact

If you have any questions or feedback, feel free to reach out to the project maintainer:

- **Email**: addisu05mulat@gmail.com
- **GitHub**: [Addika1630](https://github.com/Addika1630)


## Use Cases

- **Coaching Efficiency**: Track which developers are having difficulty with merging or reviewing pull requests and provide additional coaching.
- **Performance Tracking**: Visualize trends over time to assess how different developers' performance has changed.
- **Predictive Analysis**: Forecast future performance trends based on historical PR data, enabling proactive interventions.



