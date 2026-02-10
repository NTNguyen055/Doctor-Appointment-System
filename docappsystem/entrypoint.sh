#!/bin/sh

# Dừng script nếu có bất kỳ lệnh nào bị lỗi
set -e

# In ra thông báo đang chờ Database
echo "Waiting for MySQL database to start..."

# Vòng lặp kiểm tra: Chừng nào chưa kết nối được tới host 'db' port 3306
# thì ngủ 1 giây rồi thử lại.
while ! nc -z db 3306; do
  sleep 1
done

echo "MySQL started! Starting Django Server..."

# Chạy lệnh thực sự (python manage.py runserver...)
exec "$@"