FROM python:3.11-slim
WORKDIR /app

# install deps
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app code and frontend build
COPY backend/app ./app
COPY frontend/build ./app/frontend_build

# entrypoint
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]
