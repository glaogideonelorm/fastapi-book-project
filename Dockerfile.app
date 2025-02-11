FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 3000 (Railway should set PORT to 3000 or you can configure it)
EXPOSE 3000

# Start Uvicorn, reading PORT from the environment (default to 3000 if not set)
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-3000}"]
