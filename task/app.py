import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

def load_data():
    # Load the dataset (modify the file path as needed)
    df = pd.read_csv("https://raw.githubusercontent.com/Addika1630/metta-task/refs/heads/main/task/exports.csv")
    
    # Convert 'updated_at' to datetime format
    df["updated_at"] = pd.to_datetime(df["updated_at"], unit='s')
    
    return df

def main():
    st.title("📊 Merged Pull Requests Dashboard")
    df = load_data()
    
    # Filter only merged PRs
    merged_prs = df[df["action"] == "PR_MERGED"]
    total_merged = merged_prs.shape[0]
    
    st.metric("Total Merged PRs", total_merged)

    # Group by date to count PR_MERGED per day
    merged_over_time = merged_prs.resample("W", on="updated_at").size()

    # Time-series plot
    st.subheader("Merged PRs Over Time")
    fig, ax = plt.subplots()
    ax.plot(merged_over_time.index, merged_over_time.values, marker='o', linestyle='-', color='b', linewidth=2)
    ax.set_xlabel("Date")
    ax.set_ylabel("Number of PRs Merged")
    ax.set_title("PR Merges Over Time")
    ax.grid(True)
    
    # Display the matplotlib figure in Streamlit
    st.pyplot(fig)

if __name__ == "__main__":
    main()
