import streamlit as st
import pandas as pd

def load_data():
    # Load the dataset (modify the file path as needed)
    df = pd.read_csv("exports.csv")
    return df

def main():
    st.title("📊 Merged Pull Requests Dashboard")
    df = load_data()
    
    # Filter for merged PRs
    merged_prs = df[df["action"] == "PR_MERGED"]
    total_merged = merged_prs.shape[0]
    
    st.metric("Total Merged PRs", total_merged)
    
    # Merged PRs by Organization
    merged_by_org = merged_prs["organization"].value_counts()
    st.subheader("Merged PRs by Organization")
    st.bar_chart(merged_by_org)
    
    # Merged PRs by Repository
    merged_by_repo = merged_prs["repository"].value_counts()
    st.subheader("Merged PRs by Repository")
    st.bar_chart(merged_by_repo)
    
    # Merged PRs by Owner
    merged_by_owner = merged_prs["owner"].value_counts().head(20)
    st.subheader("Merged PRs by Owner")
    st.bar_chart(merged_by_owner)
    
    # Show the raw data (optional)
    if st.checkbox("Show Raw Data"):
        st.dataframe(merged_prs)

if __name__ == "__main__":
    main()


