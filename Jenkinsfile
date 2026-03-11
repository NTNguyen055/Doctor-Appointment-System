pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ntnguyen055/doctor-appointment' 
        // Tên Docker Image sẽ build và push lên Docker Hub

        APP_SERVER_IP = '18.183.172.77' 
        // Địa chỉ IP của server chạy ứng dụng (EC2)

        APP_SERVER_USER = 'ubuntu' 
        // User dùng để SSH vào server

        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        // Lấy thông tin đăng nhập Docker Hub từ Jenkins Credentials
        // Jenkins sẽ tạo 2 biến:
        // DOCKERHUB_CREDS_USR (username)
        // DOCKERHUB_CREDS_PSW (password)
    }

    stages {

        stage('1. Checkout SCM') {
            steps {
                echo 'Đang kéo mã nguồn mới nhất từ GitHub.....'
                // In log ra màn hình Jenkins

                checkout scm
                // Jenkins clone code từ GitHub repository đã cấu hình
            }
        }

        stage('2. Build Image') {
            steps {
                echo 'Đóng gói Docker Image...'

                sh "docker build -t ${IMAGE_NAME}:latest ./docappsystem"
                // Build Docker image từ thư mục ./docappsystem
                // Tag image với tên: ntnguyen055/doctor-appointment:latest
            }
        }

        stage('3. Push to Docker Hub') {
            steps {
                echo 'Đẩy Image lên lưu trữ...'

                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
                // Đăng nhập Docker Hub bằng credentials Jenkins
                // Password được truyền qua stdin để bảo mật

                sh "docker push ${IMAGE_NAME}:latest"
                // Push Docker image lên Docker Hub
            }
        }

        stage('4. Đồng bộ Cấu hình (SCP)') {
            steps {
                echo 'Đẩy tệp cấu hình và Nginx sang App Server...'

                sshagent(credentials: ['app-server-ssh-key']) {
                    // Jenkins dùng SSH key để kết nối tới server EC2

                    sh "ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP} 'mkdir -p ~/doctor-appointment/SQLFile ~/doctor-appointment/nginx'"
                    // Tạo thư mục trên server nếu chưa tồn tại

                    sh "scp -o StrictHostKeyChecking=no docker-compose.yml ${APP_SERVER_USER}@${APP_SERVER_IP}:~/doctor-appointment/"
                    // Copy file docker-compose.yml sang server

                    sh "scp -o StrictHostKeyChecking=no SQLFile/docaspythondb.sql ${APP_SERVER_USER}@${APP_SERVER_IP}:~/doctor-appointment/SQLFile/"
                    // Copy file database SQL

                    sh "scp -o StrictHostKeyChecking=no nginx/default.conf ${APP_SERVER_USER}@${APP_SERVER_IP}:~/doctor-appointment/nginx/"
                    // Copy file cấu hình Nginx
                }
            }
        }

        stage('5. Deploy & Auto-Rollback') {
            steps {
                echo 'Triển khai hệ thống với cơ chế Rollback an toàn...'

                sshagent(credentials: ['app-server-ssh-key']) {

                    sh """ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP} '
                        cd ~/doctor-appointment
                        // Di chuyển vào thư mục project trên server
                        
                        echo "1. Backup phiên bản đang chạy (nếu có)..."
                        docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:previous || true
                        // Backup image hiện tại thành tag previous
                        // Nếu chưa có thì bỏ qua lỗi

                        echo "2. Kéo và chạy phiên bản mới..."
                        docker-compose pull web
                        // Pull image mới từ Docker Hub

                        docker-compose down
                        // Dừng toàn bộ container cũ

                        docker-compose up -d
                        // Khởi động container mới ở chế độ background
                        
                        echo "3. Health Check: Chờ 10 giây để kiểm tra ứng dụng..."
                        sleep 10
                        // Chờ ứng dụng khởi động

                        if [ "\$(docker inspect -f '{{.State.Running}}' django_web)" != "true" ]; then
                            // Kiểm tra container django_web có đang chạy không

                            echo "PHÁT HIỆN LỖI: Container web bị sập! Tiến hành Auto-Rollback..."

                            docker-compose down
                            // Tắt container lỗi

                            docker tag ${IMAGE_NAME}:previous ${IMAGE_NAME}:latest
                            // Khôi phục image cũ

                            docker-compose up -d
                            // Chạy lại phiên bản cũ

                            echo "Rollback thành công! Đã khôi phục phiên bản cũ."

                            exit 1
                            // Báo lỗi cho Jenkins
                        else
                            echo "Container web hoạt động ổn định. Triển khai thành công!"

                            docker image prune -f
                            // Xóa các Docker image không sử dụng để tiết kiệm dung lượng
                        fi
                    '"""
                }
            }
        }
        
        stage('6. Dọn dẹp Jenkins') {
            steps {
                sh 'docker image prune -f'
                // Xóa các image không cần trên máy Jenkins

                sh 'docker logout'
                // Đăng xuất Docker Hub
            }
        }
    }
}