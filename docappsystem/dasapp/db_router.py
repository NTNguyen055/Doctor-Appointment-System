class PrimaryReplicaRouter:
    """
    KIẾN TRÚC ĐỊNH TUYẾN DỮ LIỆU ĐỌC/GHI (READ/WRITE ROUTING ALGORITHM)
    Mục tiêu:
    - Giảm tải (Offload) 100% các thao tác ĐỌC (SELECT) sang máy chủ Replica.
    - Đảm bảo an toàn tuyệt đối cho các thao tác GHI (INSERT, UPDATE, DELETE) bằng cách giữ chúng ở máy chủ Primary.
    """

    def db_for_read(self, model, **hints):
        """
        Bất cứ khi nào mã nguồn gọi các hàm như: User.objects.all(), Doctor.objects.get(), Appointment.objects.filter()...
        Hàm này sẽ được kích hoạt. Nó chỉ định đường dẫn bắt buộc sang máy chủ bản sao.
        """
        # Trả về chuỗi 'replica', tương ứng với khối cấu hình máy phụ sẽ khai báo trong settings.py
        return 'replica'

    def db_for_write(self, model, **hints):
        """
        Bất cứ khi nào mã nguồn gọi các hàm thay đổi dữ liệu như: user.save(), appointment.delete(), doctor.update()...
        Hàm này sẽ được kích hoạt. Nó lập tức chuyển hướng giao thông về lại máy chủ gốc.
        """
        # Trả về chuỗi 'default', tương ứng với khối cấu hình máy chính trong settings.py
        return 'default'

    def allow_relation(self, obj1, obj2, **hints):
        """
        Hàm này ra lệnh cho Django cho phép tạo các phép nối (JOIN) bất kể đối tượng đó đang được bốc lên từ Primary hay Replica.
        """
        db_set = {'default', 'replica'}
        if obj1._state.db in db_set and obj2._state.db in db_set:
            return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        
        if db == 'default':
            # Chỉ cho phép chạy migrate trên database gốc
            return True
        
        # Chặn đứng mọi nỗ lực migrate lên máy bản sao
        return False