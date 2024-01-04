- [Tổng hợp lại kiến thức apache](#tổng-hợp-lại-kiến-thức-apache)
  - [Cài đặt apache](#cài-đặt-apache)
  - [Cấu trúc của file config apache](#cấu-trúc-của-file-config-apache)
- [Setting virtual host](#setting-virtual-host)
- [Cài đặt SSL](#cài-đặt-ssl)
  - [Cài đặt Certbot Let’s Encrypt](#cài-đặt-certbot-lets-encrypt)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Tổng hợp lại kiến thức apache
## Cài đặt apache 
- Trên centos 7 thì để cài đặt được dịch vụ apache dùng lệnh
    ```
    yum update httpd -y
    yum install httpd -y
    ```
- Cần mở cổng 80, 443 để cho phép Apache phục vụ các yêu cầu qua HTTP, HTTPS
    ```
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-service=https
    sudo firewall-cmd --reload
    ```
## Cấu trúc của file config apache
![Alt](/thuctap/anh/Screenshot_594.png)
- file `httpd.conf` là 1 file cực kỳ quan trọng ,nó là đầu não để điều khiển các modul phía dưới
- Ta có thể tưởng tượng như là `httpd.conf` là chương trình chính còn tất cả các thư mục hay file còn lại là bổ trợ cho nó hay là các chương trình con hỗ trợ vậy
- Lưu ý khi ta tiến hành thay đổi thì nên copy tạo ra 1 file backup tránh sai sót
# Setting virtual host 
- Khi chúng ta muốn chạy nhiều trang web trên một máy chủ thì hãy nghĩ đến virtual host.
- Virtual host sẽ giúp ta phân biết được các trang web với nhau

![Alt](/thuctap/anh/Screenshot_597.png)
![Alt](/thuctap/anh/Screenshot_596.png)

- Theo mặc định thì khi ta tải xuống apache thì sẽ sinh ra thư mục `/var/www/html`
  - Những lần trước khi cấu hình wordpress thì tôi đã chuyển thư mục wordpress vào thư mục này 
  - Bây giờ khi ta muốn dùng vituarl host một các khoa học hơn ta sẽ tạo ra một thư mục mới trong thưc mục `/var/www` để dễ dàng phân biệt các website với nhau

- Tạo thư mục html cho `wp1.thanhquang.site` và `mail.thanhquang.site` như sau, sử dụng cờ `-p` để tạo bất kỳ thư mục mẹ nào cần thiết:
    ```
    sudo mkdir -p /var/www/wp1.thanhquang.site/html
    ```
    ```
    sudo mkdir -p /var/www/mail.thanhquang.site/html
    ```
- Tạo một thư mục bổ sung để lưu trữ các tệp nhật ký cho trang web:
    ```
    sudo mkdir -p /var/www/wp1.thanhquang.site/log
    ```
    ```
    sudo mkdir -p /var/www/mail.thanhquang.site/log
    ```
- Tiếp theo, chỉ định quyền sở hữu thư mục html với biến môi trường `$USER`
    ```
    sudo chown -R $USER:$USER /var/www/wp1.thanhquang.site/html
    ```
- Đảm bảo rằng gốc web của bạn có các quyền mặc định được đặt:
    ```
    sudo chmod -R 755 /var/www
    ```
- Tiến hành tạo 2 thư mục `sites-available` và `sites-enabled`
    ```
    sudo mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled
    ```
- Tiếp theo bạn khai báo quyền thực thi cho các thư viện ở `sites-enabled` bằng cách thay đổi cấu hình của file `httpd.conf`
    ```
    sudo vi /etc/httpd/conf/httpd.conf
    ```
    - Thêm dòng sau vào cuối:
    ```
    IncludeOptional sites-enabled/*.conf
    ```
    - Lưu và thoát

- Bắt đầu bằng cách tạo hai tệp mới trong thư mục `sites-available`

    ```
    sudo vi /etc/httpd/sites-available/wp1.thanhquang.site.conf
    ```
    - Thêm vào cấu hình sau:
    ```
    <VirtualHost *:80>
    ServerName www.wp1.thanhquang.site
    ServerAlias wp1.thanhquang.site
    DocumentRoot /var/www/wp1.thanhquang.site/html
    ErrorLog /var/www/wp1.thanhquang.site/log/error.log
    CustomLog /var/www/wp1.thanhquang.site/log/requests.log combined
    </VirtualHost>
    ```
    ```
    sudo vi /etc/httpd/sites-available/mail.thanhquang.site.conf
    ```
    - Thêm vào khối cấu hình sau:
    ```
    <VirtualHost *:80>
    ServerName www.mail.thanhquang.site
    ServerAlias mail.thanhquang.site
    DocumentRoot /var/www/mail.thanhquang.site/html
    ErrorLog /var/www/mail.thanhquang.site/log/error.log
    CustomLog /var/www/mail.thanhquang.site/log/requests.log combined
    </VirtualHost>
    ```
- Tạo symlink để liên kết file ở `sites-available` và `sites-enabled`

    ```
    sudo ln -s /etc/httpd/sites-available/wp1.thanhquang.conf /etc/httpd/sites-enabled/wp1.thanhquang.conf
    ```
    ```
    sudo ln -s /etc/httpd/sites-available/mail.thanhquang.site.conf /etc/httpd/sites-enabled/mail.thanhquang.site.conf
    ```

- Bây giờ ta có thể lên mạng gõ tên miền của 2 website và đã nhận thấy sự phân biệt

# Cài đặt SSL
- Điều kiện:
   - Sử dụng Ip public
   - Domain name (thanhquang.site)
   - Server CentOS 7- cài Intial
## Cài đặt Certbot Let’s Encrypt 

Để sử dụng Let’s Encrypt để lấy chứng chỉ SSL, trước tiên bạn cần cài đặt Certbot và mod_ssl, một mô-đun Apache cung cấp hỗ trợ cho mã hóa SSL v3.

Gói certbot không có sẵn thông qua trình quản lý gói theo mặc định. Bạn sẽ cần kích hoạt kho EPEL để cài đặt Certbot.

- Để thêm kho lưu trữ CentOS 7 EPEL, hãy chạy lệnh sau:
    ```
    sudo yum install epel-release -y
    ```
- Bây giờ bạn có quyền truy cập vào kho lưu trữ, hãy cài đặt tất cả các gói được yêu cầu
    ```
    sudo yum install certbot python2-certbot-apache mod_ssl -y
    ```

Việc sử dụng ứng dụng khách certbot Let’s Encrypt để tạo Chứng chỉ SSL cho Apache sẽ tự động hóa nhiều bước trong quy trình. Máy khách sẽ tự động lấy và cài đặt chứng chỉ SSL mới hợp lệ cho các miền bạn cung cấp dưới dạng tham số.
- Để thực hiện cài đặt tương tác và lấy chứng chỉ chỉ bao gồm một miền duy nhất, hãy chạy lệnh certbot với

    ```
    sudo certbot --apache -d example.com
    ```
    ```
    sudo certbot --apache -d mail.thanhquang.site -d wp1.thanhquang.site
    ```

- Output:
  ![Alt](/thuctap/anh/Screenshot_598.png)

- Bây giờ ta có thể vào trình duyệt và truy cập đến domain của mình và đã có https
- Tôi tiến hành cài đặt wordpress trên ,bạn có thể tham khảo [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/limux-hhtp/01.wordpress1node.md) . Và đay là kết quả:
  
    ![Alt](/thuctap/anh/Screenshot_599.png)

# Tài liệu tham khảo
https://github.com/huydv398/Linux-tutorial/blob/master/CentOS-7/Apache-all.md