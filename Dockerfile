# Use an official Python base image
FROM python:3.10-slim

# Install SQLite dev libraries (if you use sqlite3)
RUN apt-get update && apt-get install -y \
        libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Expose port (update if your app uses a different port)
EXPOSE 3000

# Command to run the app (update if your entry point is different)
CMD ["python", "hvm.py"]
