FROM python:3.11‑slim

# Install required system libraries (especially for sqlite3 if used)
RUN apt‑get update && apt‑get install ‑y \
      libsqlite3‑dev build‑essential \
    && rm ‑rf /var/lib/apt/lists/*

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Copy requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the code
COPY . /app/

# Expose the port your app uses (replace if not 8000)
EXPOSE 3000

# Command to run your application (replace app.py with your main file)
CMD ["python", "hvm.py"]
