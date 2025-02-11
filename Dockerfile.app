FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 3000 (or the value of PORT if set)
EXPOSE ${PORT:-3000}

# Run Uvicorn, binding to the Railway PORT or defaulting to 3000
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-3000} --interface ipv4"]

