FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 8000 (default if PORT is not provided)
EXPOSE ${PORT:-8000}

# Start Uvicorn, binding to the Railway-provided port or defaulting to 8000
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]
