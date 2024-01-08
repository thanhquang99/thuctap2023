- [Cách tạo virtual host (Server Block)](#cách-tạo-virtual-host-server-block)
  - [1. Virtual host là gì?](#1-virtual-host-là-gì)
  - [2. Sở lược về cách tạo virtual host](#2-sở-lược-về-cách-tạo-virtual-host)
  - [3. Thực hành](#3-thực-hành)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Cách tạo virtual host (Server Block)
## 1. Virtual host là gì?
- Virtual Host là một kỹ thuật cho phép nhiều website có thể dùng chung một địa chỉ ip. Thuật ngữ này được sử dụng với các website sử dụng Apache server. Trong các website sử dụng Nginx server thì nó được gọi là Server Block
- Đây là kỹ thuật dùng để cấu hình cho web server khi bạn muốn có nhiều nhiều website với các tên miền khác nhau được sử dụng chung trên cùng một máy chủ.
  ![Alt](/thuctap/anh/Screenshot_686.png)
## 2. Sở lược về cách tạo virtual host
- Như đã giới thiệu ở bai bài trước thì các thư mục lưu nội dung trang web sẽ mặc định được lưu ở `/usr/share/html`
- Yêu cầu cần làm là ta sẽ tạo ra nhiều thư mục lưu nhiều trang web và cấu hình lại nginx để cho có thể trỏ chính xác website đến thư mục lưu của chính nó
- Những file cấu hình ta cần sửa là chính là `sites-available` và `sites-enabled`  đối với ubuntu hoặc `conf.d` đối với centos và tạo thêm các thư mục lưu trữ trang web ở `/usr/share/nginx`
## 3. Thực hành
- Tạo ra 2 file cấu hình virtual host
  ```
  vi /etc/nginx/conf.d/vhostthanhquang1.com.conf
  vi /etc/nginx/conf.d/vhostthanhquang2.com.conf
  ```
- Thêm nội dung sau vào các file vừa tạo tương ứng
  - file `/etc/nginx/conf.d/vhostthanhquang1.com.conf`
    ```
          server {
            listen      80;
            server_name     vhost1.com www.thanhquang1.com;
            access_log      /var/log/nginx/access-vhostthanhquang1.com.log;
            error_log       /var/log/nginx/error-vhostthanhquang1.com.log;
            root    /usr/share/nginx/vhostthanhquang1.com;
            index   index.php index.html index.htm;
        }
    ```
  - file `/etc/nginx/conf.d/vhost2.com.conf`
    ```
          server {
            listen      80;
            server_name     vhost1.com www.vhostthanhquang2.com;
            access_log      /var/log/nginx/access-vhostthanhquang2.com.log;
            error_log       /var/log/nginx/error-vhostthanhquang2.com.log;
            root    /usr/share/nginx/vhostthanhquang2.com;
            index   index.php index.html index.htm;
        }
    ```
  - Giải thích:
    - `listen 80` : chỉ ra port 80 lắng nghe các yêu cầu http
    - `server_name`: chỉ ra tên miền ứng với các virtual host gồm cả đầy đủ và viết tắt
    - `access_log` và `error_log`: chỉ ra đường dẫn chứa log thành công và thất bại
    - `root`: chỉ ra đường dẫn đến thư mục tương ứng khi ta vào trình duyệt gõ virtual host
    - `index` : chỉ ra các tệp mặc định xuất hiện khi ta truy cập vào web
- Tạo 2 thư mục chứa website cho virtual host đã tạo
  ```
  mkdir /usr/share/nginx/vhostthanhquang1.com
  mkdir /usr/share/nginx/vhostthanhquang2.com
  ```
- Thay đổi chủ sở hữu để nginx có thể thao tác với các thư mục này. Mặc định người dùng nginx được tạo ra khi ta tiến hành tải nginx về ta có thể xem bằng lệnh `cat /etc/nginx/nginx.conf`
  ![Alt](/thuctap/anh/Screenshot_687.png)
  ```
  chown nginx:nginx -R /usr/share/nginx/vhostthanhquang1.com
  chown nginx:nginx -R /usr/share/nginx/vhostthanhquang2.com
  ```
- Tạo thêm 2 file index.html trên mỗi virtual host để có thể kiểm tra kết quả
  ```
  vi /usr/share/nginx/vhostthanhquang1.com/index.html
  vi /usr/share/nginx/vhostthanhquang2.com/index.html
  ```
- Thêm vào nội dung sau:
  ```
    <DOCTYPE html>
    <html>
      <head>
        <title>www.vhost1.com</title>
      </head>
      <body>
        <h1>Success: You Have Set Up a Virtual Host</h1>
        <h1>www.vhost1.com and vhost1.com</h1>
      </body>
    </html>
  ```
  ```
    <DOCTYPE html>
    <html>
      <head>
        <title>www.vhost2.com</title>
      </head>
      <body>
        <h1>Success: You Have Set Up a Virtual Host</h1>
        <h1>www.vhost2.com and vhost2.com</h1>
      </body>
    </html>
  ```
- Tiến hành restart lại nginx
  ```
  systemctl restart nginx
  ```
- Ta tiến hành ngắt kết nối internet và chỉnh sửa file host trên window của mình (do đây là tôi dùng VMware và dùng ip private)
  - mở notepate++ bằng quyền admin
  - Chọn file mở theo đường dẫn `C:\Windows\System32\drivers\etc/hosts`
  - Thêm vào nội dung sau:
  ```
  192.168.10.21 vhostthanhquang1.com www.vhostthanhquang1.com www.vhostthanhquang2.com vhostthanhquang2.com
  ```
  ![Alt](/thuctap/anh/Screenshot_688.png)
- Bây giờ ta có thể vào trình duyệt và gõ tên miền và đây là kết quả
  ![Alt](/thuctap/anh/Screenshot_689.png)
# Tài liệu tham khảo
https://github.com/hocchudong/ghichep-nginx/blob/master/docs/nginx-virtualhost.md

https://github.com/huydv398/Linux-tutorial/blob/master/Fundamental/File-Structure&config.md