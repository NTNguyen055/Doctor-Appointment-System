pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ntnguyen055/doctor-appointment'
        
        // Cấu hình mạng phân tán: Khai báo IP của toàn bộ cụm máy chủ
        APP_SERVER_IP_1 = '13.212.214.54'
        APP_SERVER_IP_2 = '13.229.211.98'
        
        APP_SERVER_USER = 'ubuntu'
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('1. Checkout SCM') {
            steps {
                echo 'Đang kéo mã nguồn mới nhất từ nhánh chính của GitHub...'
                checkout scm
            }
        }

        stage('2. Build Image') {
            steps {
                echo 'Đóng gói mã nguồn Django thành khối Docker Image nguyên khối...'
                sh "docker build -t ${IMAGE_NAME}:latest ./docappsystem"
            }
        }

        stage('3. Push to Docker Hub') {
            steps {
                echo 'Bơm bản phân phối Image lên kho lưu trữ đám mây Docker Hub...'
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }

        stage('4. Phân phối Cấu hình (SCP Cluster)') {
            steps {
                echo 'Thiết lập luồng SCP chuyển tệp cấu hình đến toàn bộ cụm máy chủ (Cluster)...'
                sshagent(credentials: ['app-server-ssh-key']) {
                    // Truyền tải cho Node 1
                    sh "ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP_1} 'mkdir -p ~/doctor-appointment/nginx'"
                    sh "scp -o StrictHostKeyChecking=no docker-compose.yml ${APP_SERVER_USER}@${APP_SERVER_IP_1}:~/doctor-appointment/"
                    sh "scp -o StrictHostKeyChecking=no nginx/default.conf ${APP_SERVER_USER}@${APP_SERVER_IP_1}:~/doctor-appointment/nginx/"
                    
                    // Truyền tải cho Node 2
                    sh "ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP_2} 'mkdir -p ~/doctor-appointment/nginx'"
                    sh "scp -o StrictHostKeyChecking=no docker-compose.yml ${APP_SERVER_USER}@${APP_SERVER_IP_2}:~/doctor-appointment/"
                    sh "scp -o StrictHostKeyChecking=no nginx/default.conf ${APP_SERVER_USER}@${APP_SERVER_IP_2}:~/doctor-appointment/nginx/"
                }
            }
        }

        stage('5. Deploy & Auto-Rollback Cluster') {
            steps {
                echo 'Kích hoạt kịch bản triển khai song song và khôi phục tự động...'
                sshagent(credentials: ['app-server-ssh-key']) {
                    
                    // Khối lệnh thực thi trên Node 1
                    sh """ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP_1} '
                        cd ~/doctor-appointment
                        echo "[Node 1] Đang đánh dấu phiên bản sao lưu..."
                        docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:previous || true
                        echo "[Node 1] Đang tải bản cập nhật và tái tạo Container..."
                        docker-compose pull web
                        docker-compose down
                        docker-compose up -d
                        
                        echo "[Node 1] Kích hoạt tiến trình Health Check nội bộ (10s)..."
                        sleep 10
                        if [ "\$(docker inspect -f '{{.State.Running}}' django_web)" != "true" ]; then
                            echo "[Node 1] PHÁT HIỆN SỰ CỐ: Tiến hành Auto-Rollback..."
                            docker-compose down
                            docker tag ${IMAGE_NAME}:previous ${IMAGE_NAME}:latest
                            docker-compose up -d
                            echo "[Node 1] Đã Rollback thành công về bản ổn định."
                            exit 1
                        else
                            echo "[Node 1] Dịch vụ trực tuyến ổn định. Triển khai hoàn tất!"
                            docker image prune -f
                        fi
                    '"""

                    // Khối lệnh thực thi trên Node 2
                    sh """ssh -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP_2} '
                        cd ~/doctor-appointment
                        echo "[Node 2] Đang đánh dấu phiên bản sao lưu..."
                        docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:previous || true
                        echo "[Node 2] Đang tải bản cập nhật và tái tạo Container..."
                        docker-compose pull web
                        docker-compose down
                        docker-compose up -d
                        
                        echo "[Node 2] Kích hoạt tiến trình Health Check nội bộ (10s)..."
                        sleep 10
                        if [ "\$(docker inspect -f '{{.State.Running}}' django_web)" != "true" ]; then
                            echo "[Node 2] PHÁT HIỆN SỰ CỐ: Tiến hành Auto-Rollback..."
                            docker-compose down
                            docker tag ${IMAGE_NAME}:previous ${IMAGE_NAME}:latest
                            docker-compose up -d
                            echo "[Node 2] Đã Rollback thành công về bản ổn định."
                            exit 1
                        else
                            echo "[Node 2] Dịch vụ trực tuyến ổn định. Triển khai hoàn tất!"
                            docker image prune -f
                        fi
                    '"""
                }
            }
        }
        
        stage('6. Dọn dẹp Máy chủ Jenkins') {
            steps {
                echo 'Xóa bộ nhớ đệm nội bộ để giải phóng không gian...'
                sh 'docker image prune -f'
                sh 'docker logout'
            }
        }
    }
}