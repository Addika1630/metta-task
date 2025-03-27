import streamlit as st
import pandas as pd
import plotly.express as px

# Set page config first (before any other Streamlit command)
st.set_page_config(page_title="Merged PRs Dashboard", page_icon="📊", layout="wide")

# Custom CSS to apply a black background to the entire screen and style buttons
st.markdown("""
<style>
    /* Button styles */
    .stButton>button {
        background-color: #444444;
        color: white;
        border: none;
        padding: 6px 12px;  /* Reduced padding for smaller button */
        border-radius: 12px;  /* Rounded corners */
        font-size: 12px;  /* Reduced font size */
        font-weight: bold;
        text-align: center;
        transition: all 0.3s ease;  /* Smooth transition for hover effects */
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);  /* Subtle shadow for depth */
        cursor: pointer;
        width: 120px; 
    }

    .stButton>button:hover {
        background-color: #666666;
        transform: scale(1.05);  /* Slight scaling effect on hover */
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);  /* Increased shadow on hover */
    }

    .stButton>button:focus {
        outline: none;
    }

    /* Adjust color and shadow for button when clicked */
    .stButton>button:active {
        background-color: #555555;
        transform: scale(1.1);
    }
</style>
""", unsafe_allow_html=True)

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

def reset_owner_selection():
    st.session_state.selected_owner = None

def main():
    # Streamlit App Title
    st.title("📊 Interactive Merged PRs Dashboard")

    # Sidebar content
    st.sidebar.title("Holdex")
    st.sidebar.text("Data for merged pull requests")

    # Load data
    df = load_data()
    merged_prs = df[df["action"] == "PR_MERGED"]

    # Show total merged PRs
    total_merged = merged_prs.shape[0]
    st.metric("Total Merged PRs", total_merged)

    # Add an "All" button to reset the selection
    if st.button("Show All"):
        reset_owner_selection()

    # Merged PRs by Owner
    st.subheader("Select an Owner to Filter Data")
    top_owners = merged_prs["owner"].value_counts().head(20)
    
    # Create a responsive grid of buttons for each owner
    cols = st.columns(5)
    for i, (owner, count) in enumerate(top_owners.items()):
        with cols[i % 5]:
            # Make button smaller by using 'st.button' with width control
            if st.button(f"{owner} ({count})", key=owner, use_container_width=False):
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
    st.plotly_chart(fig, use_container_width=True)

    # Show raw data
    if st.checkbox("Show Raw Data"):
        st.dataframe(filtered_prs)

if __name__ == "__main__":
    main()


