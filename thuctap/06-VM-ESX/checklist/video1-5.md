# 1. Cấu trúc các file của máy ảo
![Alt](/thuctap/anh/Screenshot_958.png)

các máy ảo được build lên và được lưu trữ trong 1 folder. Folder này sẽ bao gồm tất các các file chi tiết về cấu hình.
- `VM.vmx` : file chứa cấu hình của VM
- `VM.vswp`: file chứa swap file
- `VM.nvram`: file chứa cấu hình BIOS của máy ảo
- `VM.log`: file ghi lại lịch sử 
- `vm.vmtx`: file cấu hình template
- `VM.vmdk`: file chứa disk
- `VM.vmsn`: file chứa trạng thái snapshot
- `VM.vmem`: file chứa snapshot memory


# 2. Quá trình triển khai 1 máy ảo
![Alt](/thuctap/anh/Screenshot_959.png)
# 3. Lưu ý
- Ta có thể vào trực tiếp trên máy chủ chứa ESXi và quản lý bằng SHELL
  ![Alt](/thuctap/anh/Screenshot_961.png)
  Nhấn `alt +F2` để vào shell
  ![Alt](/thuctap/anh/Screenshot_962.png)

# 4. Các thành phần của ESXi
- DCUI: Đây là viết tắt của "Direct Console User Interface". Đây là giao diện người dùng trực tiếp trên máy chủ VMware ESXi mà bạn có thể truy cập từ màn hình máy chủ hoặc từ xa thông qua một kết nối console.
- VMM: Viết tắt của "Virtual Machine Manager". VMM cho phép quản trị viên tạo, quản lý và giám sát các máy ảo trên nền tảng ảo hóa của VMware.
- VMware Agent : Được sử dụng để quản lý cơ sở hạ tầng của VMware từ xa thông qua một ứng dụng
- Giao diện cho phép quản lý phần cứng từ xa thông qua APIs
## 4.1 VM kernal
- Tương tự như Linux thì VM kernal trong ESXi được xem như là nhân của toàn bộ hệ điều hành. Tất cả các tiến trình chạy trên hệ thống đều cần VM kernal điều khiển
## 4.2 File system
- ESXi cũng được quản lý các file system như trong linux vậy. Ta có thể SSH vào và tiến hành xem. Hoặc có thể enable shell trên trực tiếp máy vật lý và nhấn `alt +F2` để vào giao diện quản lý bằng câu lệnh
  ![Alt](/thuctap/anh/Screenshot_963.png)
- Trong ESXi cũng có các file log tương tự như linux vậy. Ta có thể xem bằng đường dẫn `/var/log`
  ![Alt](/thuctap/anh/Screenshot_964.png)
- `vmkernel.log`: Đây là file log chính ghi lại các hoạt động của VMkernel, bao gồm thông tin về khởi động hệ thống, lỗi phần cứng, và các hoạt động của máy ảo.

- `hostd.log`: File log này chứa thông tin về dịch vụ hostd, đóng vai trò quản lý trạng thái và hoạt động của máy chủ.

- `vpxa.log`: File log này ghi lại các sự kiện và thao tác từ dịch vụ vpxa, được sử dụng để giao tiếp với vCenter Server.

- `messages`: File log này chứa các thông báo từ hệ thống, bao gồm các thông báo từ kernel và các ứng dụng.

- `vmksummary.log`: File này ghi lại tổng hợp các thông tin quan trọng về VMkernel, bao gồm số lần khởi động, thời gian chạy, và thông tin về tài nguyên.

- `esxupdate.log`: Ghi lại các hoạt động cập nhật và nâng cấp hệ thống từ công cụ esxupdate.

- `boot.gz`: Đây là file log nén chứa thông tin về quá trình khởi động của ESXi.

- `auth.log`: File log này chứa thông tin về quá trình xác thực và đăng nhập vào hệ thống.