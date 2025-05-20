# Dockerfile
FROM python:3.12.0-slim

# Working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY data.json .
COPY matches.py .
COPY matches-deployment.yaml .
COPY matches-service.yaml .

# Copy templates directory
COPY templates/ ./templates/

# Expose the port Flask is running on
EXPOSE 5000

# Command to run the application
CMD ["python", "matches.py"]