# Sử dụng Python 3.11 để tương thích với numpy mới
FROM python:3.11-slim

# Cài đặt các thư viện hệ thống cần thiết
# Thêm netcat-openbsd để dùng cho lệnh kiểm tra kết nối (nc)
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    libpq-dev \
    build-essential \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code vào
COPY . .

# Cấp quyền thực thi cho file entrypoint.sh (quan trọng)
RUN chmod +x /app/entrypoint.sh

# Mở port
EXPOSE 8000

# Thiết lập ENTRYPOINT là file script chờ đợi
ENTRYPOINT ["/app/entrypoint.sh"]

# Lệnh mặc định sẽ được truyền vào "$@" của entrypoint
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]