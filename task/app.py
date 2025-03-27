import streamlit as st
import pandas as pd
import plotly.express as px

# Load data
def load_data():
    df = pd.read_csv("https://raw.githubusercontent.com/Addika1630/metta-task/refs/heads/main/task/exports.csv")
    df["updated_at"] = pd.to_datetime(df["updated_at"], unit='s')
    return df

# Initialize session state for selected owner
if "selected_owner" not in st.session_state:
    st.session_state.selected_owner = None

def select_owner(owner):
    st.session_state.selected_owner = owner

def main():
    st.title("📊 Interactive Merged PRs Dashboard")
    df = load_data()
    merged_prs = df[df["action"] == "PR_MERGED"]

    # Show total merged PRs
    total_merged = merged_prs.shape[0]
    st.metric("Total Merged PRs", total_merged)

    # Merged PRs by Owner
    st.subheader("Select an Owner to Filter Data")
    top_owners = merged_prs["owner"].value_counts().head(20)
    cols = st.columns(4)
    
    for i, (owner, count) in enumerate(top_owners.items()):
        with cols[i % 4]:
            if st.button(f"{owner} ({count})"):
                select_owner(owner)
    
    # Filter data by selected owner
    if st.session_state.selected_owner:
        st.subheader(f"Showing Data for: {st.session_state.selected_owner}")
        filtered_prs = merged_prs[merged_prs["owner"] == st.session_state.selected_owner]
    else:
        filtered_prs = merged_prs

    # Merged PRs Over Time
    merged_over_time = filtered_prs.resample("W", on="updated_at").size()
    fig = px.line(x=merged_over_time.index, y=merged_over_time.values, labels={'x': 'Date', 'y': 'Number of PRs Merged'}, title="Merged PRs Over Time")
    st.plotly_chart(fig)

    # Merged PRs by Repository (Top 20)
    merged_by_repo = filtered_prs["repository"].value_counts().head(20)
    st.subheader("Merged PRs by Repository")
    st.bar_chart(merged_by_repo)

    # Merged PRs by Organization (Top 20)
    merged_by_org = filtered_prs["organization"].value_counts().head(20)
    st.subheader("Merged PRs by Organization")
    st.bar_chart(merged_by_org)

    # Show raw data
    if st.checkbox("Show Raw Data"):
        st.dataframe(filtered_prs)

if __name__ == "__main__":
    main()


