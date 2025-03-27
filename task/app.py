import streamlit as st
import pandas as pd
import plotly.express as px

# Custom CSS for black background, except for the buttons
st.markdown("""
        <style>
            .main {
                background-color: #000000;
                color: white;
            }
            .css-18e3th9 {
                background-color: #000000;
            }
            .css-1y0tads {
                background-color: #000000;
                color: white;
            }
            .stButton>button {
                background-color: #444444;
                color: white;
            }
            .stMetric>div>div {
                background-color: #333333;
                color: white;
            }
            .stTextInput>div>input {
                background-color: #333333;
                color: white;
            }
            /* Styling the buttons to have normal background */
            .stButton button {
                background-color: #555555;
                color: white;
            }
            /* Keep the button backgrounds light */
            .stButton>button:hover {
                background-color: #888888;
            }
        </style>
    """, unsafe_allow_html=True)

# Set page config first, before any other Streamlit commands
st.set_page_config(page_title="Merged PRs Dashboard", page_icon="📊", layout="wide")

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
    cols = st.columns(4)
    for i, (owner, count) in enumerate(top_owners.items()):
        with cols[i % 4]:
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


