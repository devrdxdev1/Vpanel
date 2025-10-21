# Use a Python base image
FROM python:3.10-slim

# Install system dependencies for sqlite3 support
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables to avoid Python output buffering
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . /app/

# Expose the port that the application will run on (e.g., port 8000 for Django/Flask)
EXPOSE 3000

# Command to run the application (replace with your actual entry point)
CMD ["python", "hvm.py"]  # Or any other command based on your entry point
