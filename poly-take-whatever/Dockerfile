FROM python:3.11-slim

WORKDIR /app

# Install Python deps
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy entrypoint and code
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

COPY backend/app ./app

# Ensure frontend build dir exists, even if empty
RUN mkdir -p app/frontend_build
COPY frontend/build ./app/frontend_build

# Copy sample env file into container
COPY .env.example .env

# Start both API and poller
CMD ["./entrypoint.sh"]
