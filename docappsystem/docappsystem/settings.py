"""
File cấu hình Django cho project docappsystem.
"""

from pathlib import Path
import os

# Xây dựng đường dẫn gốc của project, ví dụ: BASE_DIR / 'thư_mục_con'
BASE_DIR = Path(__file__).resolve().parent.parent

# CẢNH BÁO BẢO MẬT: Giữ SECRET_KEY bí mật khi deploy production
SECRET_KEY = 'django-insecure-=u!!em!u$#9d=ew1uzeq&=90w(%62nx5b)9j66kbhh2*ee__il'

# CẢNH BÁO BẢO MẬT: Không bật DEBUG khi chạy trên môi trường production
DEBUG = True

# Cho phép tất cả các host truy cập (cần thiết khi chạy trong Docker hoặc môi trường test)
ALLOWED_HOSTS = ['*']

# Định nghĩa các ứng dụng được cài đặt trong project
INSTALLED_APPS = [
    'django.contrib.admin',          # Trang quản trị Django
    'django.contrib.auth',           # Hệ thống xác thực người dùng
    'django.contrib.contenttypes',   # Quản lý kiểu dữ liệu nội dung
    'django.contrib.sessions',       # Quản lý session người dùng
    'django.contrib.messages',       # Hệ thống thông báo
    'django.contrib.staticfiles',    # Quản lý file tĩnh (CSS, JS, Images)
    'dasapp',                       # App chính của hệ thống
    'docappsystem',                 # App project (dùng để load templates/static nếu cần)
]

# Danh sách middleware xử lý request/response
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',         # Middleware bảo mật
    'django.contrib.sessions.middleware.SessionMiddleware',  # Middleware quản lý session
    'django.middleware.common.CommonMiddleware',             # Middleware xử lý chung
    'django.middleware.csrf.CsrfViewMiddleware',             # Middleware chống tấn công CSRF
    'django.contrib.auth.middleware.AuthenticationMiddleware', # Middleware xác thực người dùng
    'django.contrib.messages.middleware.MessageMiddleware',  # Middleware xử lý message
    'django.middleware.clickjacking.XFrameOptionsMiddleware', # Middleware chống clickjacking
]

# File cấu hình URL gốc của project
ROOT_URLCONF = 'docappsystem.urls'

# Cấu hình hệ thống template
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',

        # Thư mục chứa template chung của project
        'DIRS': [os.path.join(BASE_DIR,'templates')],

        # Cho phép Django tự động tìm template trong từng app
        'APP_DIRS': True,

        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',      # Cung cấp biến debug cho template
                'django.template.context_processors.request',    # Cung cấp object request
                'django.contrib.auth.context_processors.auth',   # Cung cấp thông tin user
                'django.contrib.messages.context_processors.messages', # Cung cấp message

                # Context processor tùy chỉnh (bật nếu tồn tại file tương ứng)
                # 'dasapp.custom_context_processors.logo_context_processor',
            ],
        },
    },
]

# Cấu hình WSGI để deploy ứng dụng
WSGI_APPLICATION = 'docappsystem.wsgi.application'

# Cấu hình cơ sở dữ liệu
# Sử dụng MySQL và kết nối tới container MySQL trong Docker
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',  # Sử dụng MySQL backend
        'NAME': 'docaspythondb',              
        'USER': 'root',                       
        'PASSWORD': 'Banhmi4o@',               
        'HOST': 'db',                          # Tên service MySQL trong docker-compose.yml
        'PORT': '3306',                        
    }
}

# Cấu hình kiểm tra độ mạnh của mật khẩu
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
        # Kiểm tra mật khẩu không được giống thông tin người dùng
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        # Kiểm tra độ dài tối thiểu
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
        # Ngăn sử dụng mật khẩu phổ biến
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
        # Ngăn sử dụng mật khẩu chỉ chứa số
    },
]

# Cấu hình ngôn ngữ mặc định của hệ thống
LANGUAGE_CODE = 'en-us'

# QUAN TRỌNG: Cấu hình múi giờ Việt Nam để lưu đúng thời gian vào database
TIME_ZONE = 'Asia/Ho_Chi_Minh'

# Bật hệ thống quốc tế hóa (internationalization)
USE_I18N = True

# Đặt False để Django lưu thời gian đúng theo giờ hệ thống (không chuyển sang UTC)
USE_TZ = False

# Cấu hình đường dẫn file tĩnh (CSS, JS, Images)
STATIC_URL = 'static/'

# Thư mục chứa file tĩnh trong project
STATICFILES_DIRS = [os.path.join(BASE_DIR,'static')]

# Cấu hình file media (ảnh upload, file người dùng upload)
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Kiểu khóa chính mặc định cho model
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Sử dụng CustomUser model thay vì User mặc định của Django
AUTH_USER_MODEL = 'dasapp.CustomUser'
