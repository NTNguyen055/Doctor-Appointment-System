FROM python:3.10-slim

# Cài đặt thư viện hệ thống
# libpq-dev: hỗ trợ psycopg2
# default-libmysqlclient-dev, pkg-config: hỗ trợ mysqlclient
# build-essential: hỗ trợ biên dịch các gói C (như numpy)
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy và cài đặt requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code vào container
COPY . .

EXPOSE 8000

# Chạy server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]