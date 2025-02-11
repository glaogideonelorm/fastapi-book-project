FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose the port (defaulting to 8000 if PORT is not set)
EXPOSE ${PORT:-8000}

# Start the FastAPI app using the PORT environment variable (default to 8000)
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]
