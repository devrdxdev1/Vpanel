# Use an official Python 3 image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install system dependencies (for sqlite3 and others)
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose Render's default dynamic port
EXPOSE 3000

# Start the app (Render sets the $PORT environment variable automatically)
CMD ["python3", "hvm.py"]
