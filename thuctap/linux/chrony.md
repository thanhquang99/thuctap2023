- [Chrony là gì](#chrony-là-gì)
- [Chuẩn bị trước khi cài đặt](#chuẩn-bị-trước-khi-cài-đặt)
- [cài đặt chrony trên cả 2 server](#cài-đặt-chrony-trên-cả-2-server)
- [Cấu hình chrony làm NTP server](#cấu-hình-chrony-làm-ntp-server)
- [cấu hình chrony trên NTP client](#cấu-hình-chrony-trên-ntp-client)
- [Kiểm tra lại tổng quát](#kiểm-tra-lại-tổng-quát)
- [Giải thích các lệnh trong file `chrony`](#giải-thích-các-lệnh-trong-file-chrony)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Chrony là gì
- chrony là dịch vụ đồng bộ hóa thời gian giúp tương thích với nhiều hệ điề hành khác nhau như linux, mac os...
- Mô hình tối thiểu của chrony 

![Alt](/thuctap/anh/Screenshot_345.png)

- Bắt buộc phải có 1 máy làm NTP server để các client lấy thời gian từ đây đồng bộ và NTP server lấy time từ các pool của ubuntu trên internet

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
- [Xác định xem trong file chrony có những gì](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux/chrony.md#gi%E1%BA%A3i-th%C3%ADch-c%C3%A1c-l%E1%BB%87nh-trong-file-chrony)

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

# Giải thích các lệnh trong file `chrony`

![Alt](/thuctap/anh/Screenshot_222.png)

- Vùng 1: 4 dòng trong vùng 1 nó định nghĩa xem máy sẽ đồng bộ thời gian từ đâu ,như trên hình nó sẽ lấy các pool của ubuntu để đồng bộ thời gian theo từ trên xuống dưới
- vùng 2 :chỉ định tệp chưa mật khẩu khi server và client thực hiện kết nối với nhau
- vùng 3: file lưu trữ tốc độ mà đồng hồ hệ thống tăng giảm
- vùng 4: chỉ ra file lưu trữ file log
- vùng 5:chỉ ra thời gian tối đa cho phép 2 máy bị lệch để cập nhật
- vùng 6:Đồng bộ hóa máy với thời gian thực trên vùng 1
- vùng 7: Nếu 3 bản cập nhật đầu tiên mà đồng hồ hệ thống không lệch 1s so với bản cập nhật thì không cần cập nhật
- Vùng 8: cho phép các ip có địa chỉ mạng như trên tham gia


# Tài liệu tham khảo 

https://news.cloud365.vn/cai-dat-chrony-tren-ubuntu-18-04/

https://news.cloud365.vn/cai-dat-chrony-tren-centos-rhel-7/