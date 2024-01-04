- [cài đặt wordpress 1 node](#cài-đặt-wordpress-1-node)
  - [1. Chuẩn bị](#1-chuẩn-bị)
  - [2. Tiến hành cài đặt](#2-tiến-hành-cài-đặt)
    - [2.1 Cài đặt LAMP](#21-cài-đặt-lamp)
    - [2.2 Tạo cơ sở dữ liệu cho tài khoản Wordpress](#22-tạo-cơ-sở-dữ-liệu-cho-tài-khoản-wordpress)
  - [3. Tải và cài đặt WordPress trên ubuntu](#3-tải-và-cài-đặt-wordpress-trên-ubuntu)
    - [3.1 Tải WordPress trên ubuntu](#31-tải-wordpress-trên-ubuntu)
    - [3.2 Cấu hình wordpress trên ubuntu](#32-cấu-hình-wordpress-trên-ubuntu)
    - [3.3 Hoàn tất phần giao diện](#33-hoàn-tất-phần-giao-diện)
  - [4. Tải và cài đặt wordpress trên centos 7](#4-tải-và-cài-đặt-wordpress-trên-centos-7)
    - [4.1 Tải WordPress trên centos 7](#41-tải-wordpress-trên-centos-7)
    - [4.2 Cấu hình wordpress trên ubuntu](#42-cấu-hình-wordpress-trên-ubuntu)
    - [4.3 Hoàn tất phần giao diện](#43-hoàn-tất-phần-giao-diện)
  - [5. Test](#5-test)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# cài đặt wordpress 1 node
## 1. Chuẩn bị 
- Trước khi cài đặt WP, phải tiến hành bộ cài đặt LAMP trên máy server

- LAMP là phần nội dung thiết yếu khi máy muốn sử dụng làm web-server. Nhưng nó sẽ là các cục không thống nhất và để thống nhất hay quản trị được nó ta sử dụng wordpress

## 2. Tiến hành cài đặt
### 2.1 Cài đặt LAMP
- [Hướng dẫn cài đặt LAMP](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux-profession/03.LAMP.md)

### 2.2 Tạo cơ sở dữ liệu cho tài khoản Wordpress
- Tạo cơ sở dữ liệu cho tài khoản Wordpress
  - Đăng nhập vào tài khoản root của cơ sở dữ liệu:
  ```
  mysql -u root -p
  ```
  Bạn cần nhập Password mà bạn đã thiết lạp cài đặt khi cài đặt Mariadb. Khi nhập xong sẽ chuyển sang màn hình Mariadb .
  - Tiếp theo thiết lập bạn sẽ tạo cơ sở dữ liệu cho wordpress. Có thể dùng tên bất kỳ cho tên của Database. Trong bài mình đặt là wordpress.
  ```
  CREATE DATABASE wordpress;
  ```
  - Bạn cần tạo một tài khoản riêng để quản lý cơ sở dữ liệu cho Wordpress. Trong bài sẽ đặt
    - user: thanhquang
    - password: Khuongquang99
  ```
  CREATE USER thanhquang@localhost IDENTIFIED BY 'Khuongquang99';
  ```
  - Tiến hành cấp quyền quản lý CSDL Wordpress cho user mới tạo:
  ```
  GRANT ALL PRIVILEGES ON wordpress.* TO thanhquang@localhost IDENTIFIED BY 'Khuongquang99';
  ```
  - Xác thực lại những thay đổi về quyền:
  ```
  FLUSH PRIVILEGES;
  ```
  - Thoát
  ```
  exit
  ```


`Lưu ý`: không nên có ký tự `@` trong passwd

![Alt](/thuctap/anh/Screenshot_539.png)

## 3. Tải và cài đặt WordPress trên ubuntu
### 3.1 Tải WordPress trên ubuntu
- Yêu cầu bắt buộc để sử dụng wordpress bản 

    ![Alt](/thuctap/anh/Screenshot_540.png)

- Cài gói tải xuống wget Tiến hành tải xuống Wordpress với phiên bản mới nhất(bạn cần lưu ý bạn đang thư mục nào thì wp sẽ tải về chỗ đó.ta xem đường dẫn bằng `pwd`)

    ```
    sudo wget https://vi.wordpress.org/wordpress-6.2.3-vi.tar.gz
    ```
    ![Alt](/thuctap/anh/Screenshot_541.png)
- Giải nén file

    ```
    sudo tar xvfz wordpress-6.2.3-vi.tar.gz
    ```
    ![Alt](/thuctap/anh/Screenshot_542.png)

- Copy các file trong thư mục trong WordPress tới đường dẫn /var/www/html. 

    ```
    sudo cp -R [đường dẫn file wp] /var/www/html
    ```
### 3.2 Cấu hình wordpress trên ubuntu
- Di chuyển đến file cấu hình và và chỉnh sửa:

    ```
    cd /var/www/html/wordpress
    ```
- file cấu hình của wordpress là `wp-config.php` .Nhưng do chỉ có file `wp-config-sample.php` ta tiến hành copy ra file mới

    ```
    sudo cp wp-config-sample.php wp-config.php
    ```
    ![Alt](/thuctap/anh/Screenshot_543.png)

- Chỉnh sửa file cấu hình theo user và passwd ta đã tạo ở MySQL trước đó. Tìm nội dung sau đây để chỉnh sửa
    ```
    /** Tên database cho WordPress */
    define( 'DB_NAME', 'wordpress' );

    /** MySQL database tên Usern */
    define( 'DB_USER', 'thanhquang' );

    /** MySQL database password cho user */
    define( 'DB_PASSWORD', 'Khuongquang99' );

    /** MySQL hostname */
    define( 'DB_HOST', 'localhost' );

    /** Database Charset to use in creating database tables. */
    define( 'DB_CHARSET', 'utf8' );
    ```
- Ta tiến hành kiểm tra thử bằng lệnh cat

    ```
    sudo cat wp-config.php
    ```

    ![Alt](/thuctap/anh/Screenshot_544.png)

- Phân quyền:

    ```
    sudo chmod -R 755 /var/www/*
    ```
    - Đối với ubuntu:
    ```
    sudo chown -R www-data:www-data /var/www/*
    ```
    - Đối với centos :
    ```
    sudo chown -R apache:apache /var/www/*
    ```

- Khỏi động lại httpd

    ```
   sudo systemctl restart apache2
    ```
    ```
    sudo systemctl restart httpd
    ```

- Lưu ý khi cài trên ubuntu ta sẽ gõ địa chỉ ip mà không ra thì cần phải thay đổi thư đường dẫn của default root
  - tiến hành chỉnh sửa file 
  ```
  vi /etc/apache2/sites-available/000-default.conf
  ```
  - Tiến hành thêm chứ wordpress vào document root
  ![Alt](/thuctap/anh/Screenshot_593.png)
  - Tiến hành restart lại dịch vụ apache
  ```
  systemctl restart apache2
  ```
  

### 3.3 Hoàn tất phần giao diện

- Trên trình duyệt, gõ `ip` trên thanh url, trình duyệt sẽ xuất hiện như sau:

    ![Alt](/thuctap/anh/Screenshot_545.png)

- Ta tiến hành điền thông tin và cài đặt

    ![Alt](/thuctap/anh/Screenshot_546.png)
    ![Alt](/thuctap/anh/Screenshot_547.png)
-  Ta tiến hành đăng nhập để quản lý

    ![Alt](/thuctap/anh/Screenshot_548.png)

## 4. Tải và cài đặt wordpress trên centos 7

### 4.1 Tải WordPress trên centos 7
- Ta sex tiến hành cài bản wordpress thấp để phù hợp với bản php và mysql

```
wget https://vi.wordpress.org/wordpress-5.7-vi.tar.gz
```
    ![Alt](/thuctap/anh/Screenshot_541.png)
- Giải nén file

    ```
    sudo tar xvfz wordpress-5.7-vi.tar.gz
    ```
    ![Alt](/thuctap/anh/Screenshot_542.png)

- Copy các file trong thư mục trong WordPress tới đường dẫn /var/www/html. 

    ```
    sudo cp -R [đường dẫn file wp] /var/www/html
    ```
### 4.2 Cấu hình wordpress trên ubuntu
- Di chuyển đến file cấu hình và và chỉnh sửa:

    ```
    cd /var/www/html/wordpress
    ```
- file cấu hình của wordpress là `wp-config.php` .Nhưng do chỉ có file `wp-config-sample.php` ta tiến hành copy ra file mới

    ```
    sudo cp wp-config-sample.php wp-config.php
    ```
    ![Alt](/thuctap/anh/Screenshot_543.png)

- Chỉnh sửa file cấu hình theo user và passwd ta đã tạo ở MySQL trước đó

    ```
    sudo sed -i 's/username_here/[user-name]/g' /var/www/html/wordpress/wp-config.php
    sudo sed -i 's/database_name_here/[name-database]/g' /var/www/html/wordpress/wp-config.php
    sudo sed -i 's/password_here/[passwd]/g' /var/www/html/wordpress/wp-config.php
    ```
- Ta tiến hành kiểm tra thử bằng lệnh cat

    ```
    sudo cat wp-config.php
    ```

    ![Alt](/thuctap/anh/Screenshot_544.png)

- Phân quyền:

    ```
    sudo chmod -R 755 /var/www/html/wordpress/
    ```

- Khỏi động lại httpd

    ```
   sudo systemctl restart httpd
    ```

### 4.3 Hoàn tất phần giao diện

- Trên trình duyệt, gõ [ipserver/wordpress] trên thanh url, trình duyệt sẽ xuất hiện như sau:

    ![Alt](/thuctap/anh/Screenshot_552.png)

-  Ta tiến hành đăng nhập để quản lý

    ![Alt](/thuctap/anh/Screenshot_548.png)

## 5. Test
- Thử post 1 bài viết lên trang

    ![Alt](/thuctap/anh/Screenshot_553.png)

# Tài liệu tham khảo
https://github.com/huydv398/Linux-tutorial/blob/master/CentOS-7/WP-1node.md

https://github.com/thanhquang99/thuctap/blob/master/bash_script/scriptcaidatwpub.md