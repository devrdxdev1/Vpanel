FROM python:3.10-slim

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# Possibly install other system dependencies if required (e.g., docker CLI, ssh, etc)
# expose whichever port you plan to use (Render picks up $PORT anyway)
EXPOSE 3000

# Use environment variable PORT provided by Render
CMD ["python3", "hvm.py"]
