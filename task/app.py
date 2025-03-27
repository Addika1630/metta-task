import streamlit as st
import pandas as pd
import plotly.express as px

# Load Data
def load_data():
    df = pd.read_csv("https://raw.githubusercontent.com/Addika1630/metta-task/refs/heads/main/task/exports.csv")
    df["updated_at"] = pd.to_datetime(df["updated_at"], unit='s')  # Convert time
    return df

def main():
    st.set_page_config(page_title="PR Dashboard", layout="wide")
    st.title("📊 Interactive Merged Pull Requests Dashboard")
    df = load_data()
    
    # Filter for merged PRs
    merged_prs = df[df["action"] == "PR_MERGED"]
    
    # Sidebar Filter - Select Owner
    owners = merged_prs["owner"].unique()
    selected_owner = st.sidebar.selectbox("Select Owner:", ["All"] + list(owners))
    
    if selected_owner != "All":
        merged_prs = merged_prs[merged_prs["owner"] == selected_owner]
    
    total_merged = merged_prs.shape[0]
    st.metric("Total Merged PRs", total_merged)
    
    # Merged PRs Over Time
    merged_over_time = merged_prs.resample("W", on="updated_at").size()
    fig_time = px.line(merged_over_time, x=merged_over_time.index, y=merged_over_time.values, 
                       labels={'x': 'Date', 'y': 'Number of PRs Merged'},
                       title=f"Merged PRs Over Time ({selected_owner})")
    st.plotly_chart(fig_time, use_container_width=True)
    
    col1, col2 = st.columns(2)
    
    # Merged PRs by Organization
    merged_by_org = merged_prs["organization"].value_counts().reset_index()
    merged_by_org.columns = ["Organization", "PR Merges"]
    fig_org = px.bar(merged_by_org, x="Organization", y="PR Merges", title="Merged PRs by Organization")
    col1.plotly_chart(fig_org, use_container_width=True)
    
    # Merged PRs by Repository
    merged_by_repo = merged_prs["repository"].value_counts().reset_index().head(20)
    merged_by_repo.columns = ["Repository", "PR Merges"]
    fig_repo = px.bar(merged_by_repo, x="Repository", y="PR Merges", title="Top 20 Merged PRs by Repository")
    col2.plotly_chart(fig_repo, use_container_width=True)
    
    # Merged PRs by Owner (Interactive Clickable Chart)
    merged_by_owner = merged_prs["owner"].value_counts().reset_index().head(20)
    merged_by_owner.columns = ["Owner", "PR Merges"]
    fig_owner = px.bar(merged_by_owner, x="Owner", y="PR Merges", title="Top 20 Merged PRs by Owner", hover_data=["Owner"],
                        color="PR Merges")
    st.plotly_chart(fig_owner, use_container_width=True)
    
    # Show raw data
    if st.checkbox("Show Raw Data"):
        st.dataframe(merged_prs)

if __name__ == "__main__":
    main()


