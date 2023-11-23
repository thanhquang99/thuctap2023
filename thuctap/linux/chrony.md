- [Chrony là gì](#chrony-là-gì)
- [Chuẩn bị trước khi cài đặt](#chuẩn-bị-trước-khi-cài-đặt)
- [cài đặt chrony trên cả 2 server](#cài-đặt-chrony-trên-cả-2-server)
- [Cấu hình chrony làm NTP server](#cấu-hình-chrony-làm-ntp-server)
- [cấu hình chrony trên NTP client](#cấu-hình-chrony-trên-ntp-client)
- [Kiểm tra lại tổng quát](#kiểm-tra-lại-tổng-quát)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Chrony là gì
- chrony là dịch vụ đồng bộ hóa thời gian giúp tương thích với nhiều hệ điề hành khác nhau như linux, mac os...
- Mô hình tối thiểu của chrony 

![Alt](/thuctap/anh/Screenshot_191.png)
- Bắt buộc phải có 1 máy làm NTP server để các client lấy thời gian từ đây đồng bộ và NTP client lấy time từ server vào học theo

# Chuẩn bị trước khi cài đặt 
- Set timezone ở server

```
timedatectl set-timezone Asia/Ho_Chi_Minh
timedatectl 
```
![Alt](/thuctap/anh/Screenshot_192.png)

- Tiến hành stop dịch vụ `timesync`

```
timedatectl set-ntp no
```

![Alt](/thuctap/anh/Screenshot_193.png)

- cấu hình firewall cho phép `ntp` , Mặc định tường lửa của ubuntu sẽ bị tắt nên ta cần bật để bảo đảm an toàn rồi mới cho phép `ntp` sau

```
ufw enable
ufw allow ntp 
ufw status
```

```
systemctl enable firewalld
firewall-cmd --add-service=ntp --permanent 
firewall-cmd --reload
```
![Alt](/thuctap/anh/Screenshot_194.png)

- trên hình ta thấy port 123 của ntp đã allow
# cài đặt chrony trên cả 2 server

- Tải chorny về trên 2 server

```
yum install -y chrony
apt-get install -y chrony
```

- Bật chrony lên cùng máy khi khởi động lần luọt với ubuntu và centos

```
systemctl enable chrony --now
```
```
systemctl enable chronyd.service --now
```
- Kiểm tra trạng thái 

```
systemctl status chrony
```
```
systemctl status chronyd
```
![Alt](/thuctap/anh/Screenshot_195.png)

![Alt](/thuctap/anh/Screenshot_196.png)

- Để có thể cấu hình được chrony thì ta phải biết chrony đang cấu hình những gì. và ta dùng lệnh cat xem file chrony mà bỏ qua những dòng có kí hiệu `$ hoặc #`

```
cat /etc/chrony/chrony.conf | egrep -v '^$|^#'
```

![Alt](/thuctap/anh/Screenshot_197.png)
- Xác định xem trong file chrony có những gì
  - server Xác định các NTP Server bạn muốn sử dụng
  - prefer Đối với nhiều NTP Server chúng ta có thể chỉ đinh ưu tiên kết nối từ NTP Server nào trước thay vì để hệ thống tự lựa chọn
  - driftfile  File lưu trữ  tốc độ mà đồng hồ hệ thống tăng / giảm thời gian
  - makestep Cho phép đồng hồ hệ thống không cập nhật trong 3 bản cập nhật đầu tiên nếu độ lệch của nó nó lơn hơn 1s
  - rtcsync Cho phép đồng bộ hóa kernel của đồng hồ thời gian thực (RTC)
  - maxupdateskew Ngăn chặn việc thay đổi đột ngột nhiều lần làm ảnh hưởng hệ thống
  - logdir Vị trí file log
  - allow Cho phép Client truy cập NTP từ mạng cục bộ
  - keyfile Tệp có chứa mật khẩu để xác thực kết nối giữa Client và Server cho phép chronyc đăng nhập vào chronyd và thông báo cho chronyd về sự hiện diện của liên kết với Internet.
  - generatecommandkey Tạo mật khẩu ngẫu nhiên tự động khi bắt đầu chronyd đầu tiên

# Cấu hình chrony làm NTP server
- Ta cho phép dải mạng từ client truy cập vào bằng cách dùng vi và thêm câu lệnh `allow 192.168.10.0/24` vào file chrony.conf

```
vi /etc/chrony.conf
```

![Alt](/thuctap/anh/Screenshot_199.png)

- restart lại chrony và kiểm tra

```
systemctl restart chrony
chronyc sources -v

```
![Alt](/thuctap/anh/Screenshot_201.png)

- Set đồng bộ thời gian cho đồng hồ của BIOS (Đồng hồ phần cứng)

```
hwclock --systohc
```
- Kiểm tra đồng bộ của date và hwclock đảm bảo đồng bộ

# cấu hình chrony trên NTP client
- Kiểm tra file cấu hình trên centos 7

![Alt](/thuctap/anh/Screenshot_202.png)

- dùng vi chỉnh sửa file cấu hình

```
vi /etc/chrony.conf
```
- Nội dung cần sửa trong vi: thay thế những dòng khoanh trong hình bằng `server 192.168.10.21 iburst`

![Alt](/thuctap/anh/Screenshot_203.png)

![Alt](/thuctap/anh/Screenshot_205.png)

- Khởi động lại chrony

```
systemctl enable chronyd.service
```
- Kiểm tra đồng bộ sử dụng timedatectl

![Alt](/thuctap/anh/Screenshot_206.png)

- Set đồng bộ thời gian cho đồng hồ của BIOS (Đồng hồ phần cứng)

```
hwclock --systohc
```
# Kiểm tra lại tổng quát
- Kiểm tra verify kết nối

```
chronyc tracking
```
![Alt](/thuctap/anh/Screenshot_207.png)

- `chronyc sources -v`

![Alt](/thuctap/anh/Screenshot_208.png)

- `chronyc sourcestats`


![Alt](/thuctap/anh/Screenshot_209.png)

- Stop Chrony và kiểm tra

![Alt](/thuctap/anh/Screenshot_210.png)
# Tài liệu tham khảo 

https://news.cloud365.vn/cai-dat-chrony-tren-ubuntu-18-04/

https://news.cloud365.vn/cai-dat-chrony-tren-centos-rhel-7/