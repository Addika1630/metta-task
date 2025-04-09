<!DOCTYPE html>
<html>
<body>

  <h1>Integrating API in Wordpress Project</h1>

  <h2>Overview</h2>

  <p>In this project, I integrated a Flask API into a WordPress site, enabling sentiment analysis. Users submit text through WordPress, which is sent to the Flask API for analysis, returning sentiment and confidence scores in real-time.</p>

  <h2>Introduction</h2>

  <p>This project integrates a Flask API into a WordPress site to perform sentiment analysis. Users can input text through the WordPress interface, which is then sent to the Flask API. The API processes the text to determine sentiment—whether it’s positive or negative—along with a confidence score. This integration enhances WordPress with dynamic data analysis capabilities, offering users immediate insights into the sentiment of their content or reviews.</p>

  <h2>Features</h2>

  <ol>
    <li><strong>app.py (Flask API):</strong> I developed an endpoint (/predict) that processes input text, predicts sentiment (positive/negative), and returns a confidence score. Added error handling for smooth interaction.</li>
    <li><strong>app.php (WordPress Integration):</strong> Created a function to send text to the Flask API, retrieve the sentiment and confidence score, and display it under the “Analyze Sentiment” button in WordPress. Enhanced the interface for clarity.</li>
    <li><strong>docker-compose.yaml:</strong> Configured Flask and WordPress as services with distinct containers, defined networking, and mapped ports to ensure the WordPress interface could communicate with the Flask API effectively.</li>
  </ol>

  ## Getting Started

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/Addika1630/api_ml-service.git
    ```

2. **Navigate to the Required Directory:**
    ```bash
    cd api_ml-service/bash-wordpress-docker-setup
    ```

3. **Build and Start Services:**
   Ensure Docker and Docker Compose are installed, then run:
    ```bash
    sudo docker-compose up
    ```
   This command will build and start both the Flask and WordPress containers.

4. **Access WordPress and Flask Services:**
   - Once the containers are running, open your web browser and navigate to:
      - Sentiment Analysis: `http://localhost:8030/?page_id=5`
      - WordPress: `http://localhost:8030` (or the port specified in your `docker-compose.yaml`)
      - Flask API: `http://localhost:5000` (or the port specified in your `docker-compose.yaml` for Flask)

5. **Testing the Integration:**
   - In WordPress, use the integrated plugin or shortcode to send a sample request to the Flask API.
   - You should see the output of the sentiment analysis directly on the WordPress page.

6. **Stopping the Services:**
   - To stop the running containers, press `CTRL+C` in the terminal where you ran `docker-compose up`.
   - Alternatively, run:
     ```bash
     sudo docker-compose down
     ```

7. **Optional: Rebuilding the Containers:**
   - If you've made changes to the code and need to rebuild the containers, run:
     ```bash
     sudo docker-compose up --build
     ```

This setup will ensure your Flask API and WordPress services are properly connected and running in Docker.


  <h2>Usage</h2>

  <p>Clone the repository, set up Docker containers, and navigate to the WordPress page with the sentiment analysis form. Enter text, and the Flask API will analyze the sentiment, displaying the result and confidence score directly on the page.</p>

  <h2>User Interface</h2>

  <p>The WordPress page features a simple form where users can input text for sentiment analysis. Upon submitting, the Flask API processes the input and returns the sentiment (positive/negative) along with the confidence score, which is displayed below the form for the user's reference.</p>

  

</body>

</html>
