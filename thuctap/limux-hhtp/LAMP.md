- [LAMP](#lamp)
- [Tiến hành cài đặt](#tiến-hành-cài-đặt)
  - [Trên ubuntu-server](#trên-ubuntu-server)
    - [Cài đặt apache](#cài-đặt-apache)
    - [Cài đặt hệ quản trị cơ sở dữ liệu (mariadb)](#cài-đặt-hệ-quản-trị-cơ-sở-dữ-liệu-mariadb)
    - [Cài đặt php](#cài-đặt-php)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# LAMP
- LAMP là viết tắt của Linux, Apache, My-sql,PHP
- Các phần mềm này kết hợp với nhau tạo thành các stack phần mềm, từ đó giúp các thành phần Website hoạt động trên nền tảng này hiệu quả.
- Linux chính là hệ điều hành
- Apache là phần mềm web server với mã nguồn mở . Nó giúp các website đưa nội dung lên web
- My-sql là hệ quản trị cơ sở dữ liệu với nguồn mở
- PHP: Hypertext Preprocessor ,được coi như là ngôn ngữ kịch bản hay là một loại mã lệnh dùng để phát triển ứng dụng cho máy chủ
# Tiến hành cài đặt
## Trên ubuntu-server
- Do LAMP là viết tắt của Linux, Apache, My-sql,PHP mà ta đã có linux rồi nên ta sẽ tiến hành cài thêm 3 dịch vụ nữa
### Cài đặt apache
- Tiến hành update 

```
apt -y update
```
- Cài đặt apache2

```
sudo apt install -y apache2
```
- Tiến hành khởi động lại và kiểm tra dịch vụ apache2

```
systemctl reload apache2
systemctl status apache2
```

![Alt](/thuctap/anh/Screenshot_338.png)

- Tiến hành tự động bật khi khởi động lại máy

```
systemctl enable apache2 
```
- tường lửa cho phép dịch vụ apache ở port 80 và 443

```
ufw allow in "Apache Full"
```
![Alt](/thuctap/anh/Screenshot_339.png)

- lên trình duyệt gõ ip của máy kiểm tra

![Alt](/thuctap/anh/Screenshot_340.png)

### Cài đặt hệ quản trị cơ sở dữ liệu (mariadb)
- Tiến hành cài dịch vụ 

```
apt install -y software-properties-common mariadb-server mariadb-client
```
- Khởi động và kiểm tra trạng thái dịch vụ

```
systemctl start mariadb
systemctl status mariadb
```

![Alt](/thuctap/anh/Screenshot_341.png)

- Giống như linux thì mariadb cũng có các tài khoản khác nhau và cao nhất là root. nhưng khi mới bắt đầu root sẽ chưa có mật khẩu nên ta cần tiến hành cài đặt nó

```
mysql_secure_installation
```

![Alt](/thuctap/anh/Screenshot_342.png)

- Giải thích các cài đặt
  - 1 Ấn `enter` nếu chưa có mật khẩu root
  - 2 `y` nếu muốn set mật khẩu root
  - 3 `y` nếu muốn xóa các user khác
  - 4 `y` nếu muốn không cho đăng nhập tài khoản root từ xa
  - 5 `y` nếu muốn xóa các database test
  - 6 `y` nếu muốn load lại bảng phân quyền

### Cài đặt php

- Cài đặt php và các gói hỗ trợ

```
apt -y install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
```

- Kiểm tra lại bản php

```
php -v
```

![Alt](/thuctap/anh/Screenshot_343.png)

- Kích hoạt module Apache cho PHP 7.4

```
a2enmod php7.4
```

- Khởi động lại apache2

```
systemctl reload apache2 
```
- Thêm file info.php 

```
echo "<?php phpinfo();?>" > /var/www/html/info.php
```
- Vào trình duyệt gõ địa chỉ trên thanh url theo dạng sau(sau khi kiểm tra xong ta cần xóa file info.php đi vì nó làm lộ hết thông tin hệ thống):

```
<địa chỉ ip>/info.php
```

![Alt](/thuctap/anh/Screenshot_344.png)

# Tài liệu tham khảo

https://news.cloud365.vn/huong-dan-cai-dat-lamp-stack-tren-ubuntu-20-04-lts/

https://github.com/huydv398/Linux-tutorial/blob/master/CentOS-7/LAMP.md