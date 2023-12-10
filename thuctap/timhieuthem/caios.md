# Chuẩn bị
- 1 ổ USB đã cài sẵn OS 
- Tiến hành cắm USB vào server
- Để cài đặt OS thì ta phải khỏi động lại server và bấm nút `F11` để tiến hành vào `Boot Manager`

![Alt](/thuctap/anh/Screenshot_472.png)

- Chọn `one-shot UEFI BOOT Menu` khi server đã có sẵn hệ điều hành rồi và ta muốn tiến hành thay đổi
- Chọn ổ USB để có thể đọc win từ đó

![Alt](/thuctap/anh/Screenshot_473.png)

# Cài OS windows
- Nếu bạn không có key thì chọn ở đây

![Alt](/thuctap/anh/Screenshot_474.png)

- Chọn bản OS (lưu ý nên chọn bản desktop vì nếu chọn server sẽ không có đồ họa)

![Alt](/thuctap/anh/Screenshot_475.png)

![Alt](/thuctap/anh/Screenshot_476.png)

![Alt](/thuctap/anh/Screenshot_477.png)
- Chọn dòng thứ 2 khi ta muốn xóa bản OS cũ và thay thế bản OS mới chứ không phải nâng cấp

- Chọn phân vùng chứa hệ điaauf hành

![Alt](/thuctap/anh/Screenshot_478.png)

- Bây giờ ta cần ngồi đợi server cài OS

![Alt](/thuctap/anh/Screenshot_479.png)

- Thiết lập tài khoản và mật khẩu

![Alt](/thuctap/anh/Screenshot_480.png)

- Tiến hành đăng nhập

![Alt](/thuctap/anh/Screenshot_481.png)

![Alt](/thuctap/anh/Screenshot_482.png)

- Kiểm tra disk đã đầy đủ hay chưa và tiến hành phân vùng

![Alt](/thuctap/anh/Screenshot_483.png)
![Alt](/thuctap/anh/Screenshot_484.png)
![Alt](/thuctap/anh/Screenshot_485.png)
![Alt](/thuctap/anh/Screenshot_486.png)
![Alt](/thuctap/anh/Screenshot_487.png)
![Alt](/thuctap/anh/Screenshot_488.png)
![Alt](/thuctap/anh/Screenshot_489.png)
![Alt](/thuctap/anh/Screenshot_490.png)
![Alt](/thuctap/anh/Screenshot_491.png)

# Cài OS linux (centos7)
- Ta tiến hành khỏi động lại máy rồi `F11` để vào chế độ boot giống như cài Win

![Alt](/thuctap/anh/Screenshot_492.png)

- Tiến hành cài đặt

![Alt](/thuctap/anh/Screenshot_493.png)

- Chọn ngôn ngữ và ấn next

![Alt](/thuctap/anh/Screenshot_494.png)

- Giống như windows ta cần chọn phân vùng cài OS

![Alt](/thuctap/anh/Screenshot_495.png)

- Chọn ổ cài OS và chọn tự động phân vùng

![Alt](/thuctap/anh/Screenshot_496.png)

- Do trước đó ta có cài win rồi nên cần phải xóa phân vùng cài win đó đi

![Alt](/thuctap/anh/Screenshot_497.png)

![Alt](/thuctap/anh/Screenshot_498.png)

- Tiếp tục cài đặt

![Alt](/thuctap/anh/Screenshot_499.png)

- Cài đặt mật khẩu root

![Alt](/thuctap/anh/Screenshot_500.png)

- Reboot lại máy

![Alt](/thuctap/anh/Screenshot_501.png)

- Tiến hành kiểm tra phân vùng xem có đầy đủ dữ liệu không

![Alt](/thuctap/anh/Screenshot_502.png)

- Tiến hành đặt ip tĩnh và ping thử

![Alt](/thuctap/anh/Screenshot_503.png)

# Kiến thức bổ xung
## UEFI và Legacy BIOS
- UEFI và Legacy BIOS là hai chế độ boot mode của máy tính hay server
- UEFI
  - cung cấp nhiều tính năng và lợi ích hơn
  - thời gian khởi động nhanh hơn
  - bảo mật tốt hơn
  - hỗ trợ ổ đĩa lớn hơn và giao diện đồ họa người dùng

-  Một số phần cứng và phần mềm cũ hơn có thể không tương thích với UEFI

||UEFI|Legacy Bios|
|---|----|--------|
|Giới hạn về dung lượng|Sử dụng MBR để lưu thông tin vào ổ cứng|UEFI sử dụng bảng phân vùng GUID (GPT)|
||Giới hạn tổng phân vùng vật lý chỉ còn 4. Mỗi phân vùng chỉ có thể có kích thước tối đa 2TB| Giới hạn dung lượng lý thuyết của UEFI cho các ổ có khả năng boot là hơn 9 zettabyte|
|Tốc độ và hiệu suất||Vì UEFI là nền tảng độc lập, nó có thể tăng cường thời gian boot và tốc độ của máy tính|
|Bảo mật|Bảo mật kém hơn UEFI|UEFI chỉ có thể cho phép các driver và service xác thực load vào lúc hệ thống boot|
|GUI|BIOS cung cấp quyền truy cập vào thông tin phần cứng trong giao diện|UEFI cung cấp giao diện người dùng đồ họa trực quan hơn mà bạn có thể điều hướng bằng chuột và bàn phím|

- Ta có thể cài đặt Boot mode ở phần `System BIOS` và nên chọn `UEFI`

![Alt](/thuctap/anh/Screenshot_504.png)