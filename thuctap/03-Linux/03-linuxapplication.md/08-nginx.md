- [Giới thiệu về Nginx](#giới-thiệu-về-nginx)
  - [1. Tổng quan về Nginx](#1-tổng-quan-về-nginx)
  - [2. Nginx hoạt động như thế nào?](#2-nginx-hoạt-động-như-thế-nào)
  - [3. Các tính năng mà Nginx có thể dùng](#3-các-tính-năng-mà-nginx-có-thể-dùng)
  - [4. Tổng quan về các file của Nginx](#4-tổng-quan-về-các-file-của-nginx)
- [Cấu hình Nginx(/etc/nginx/nginx.conf)](#cấu-hình-nginxetcnginxnginxconf)
  - [1. Giới thiệu về file cấu hình](#1-giới-thiệu-về-file-cấu-hình)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Giới thiệu về Nginx
## 1. Tổng quan về Nginx
- Nginx là một máy chủ Web Server mã nguồn mở.
- Nginx được phát hành và sử dụng như một web server được thiết kế hướng đến mục đích cải thiện tối đa hiệu năng và sự ổn định
- nhờ vào các khả năng của máy chủ HTTP mà NGINX còn có thể hoạt dộng như một proxy server , reverse proxy, và trung gian để cân bằng tải cho các máy chủ
- Mục tiêu tối thượng của Nginx vẫn là hướng đến hiệu suất cao nhất nên rất được ưa chuộm
## 2. Nginx hoạt động như thế nào?
- Đầu tiên chúng ta cần hiểu các web server hoạt động như thế nào trước đã
  - Khi bạn yêu cầu 1 trang web trên trình duyệt thì trình duyệt sẽ bắt đầu liên lạc với web server chứa trang web đó rồi từ web server mới truy tìm các file liên quan rồi trả lại trình duyệt
  - Thông thường thì mỗi một yêu cầu sẽ được sử lý tuần tự theo các bước như trên và được gọi là Single Thread hay cấu trúc luồng
- Đối với Nginx vì để hiệu suất thì nó sẽ cho phép các thread tương đồng nhau cùng quản lý 1 tiến trình ,tức là mỗi tiến trình sẽ bao gồm nhiều phần nhỏ để các thread có thể nhặt ra cái phù hợp với mình và Worker Connections sẽ làm nhiệm vụ xử lý tất cả Threads đó.
- các Worker Connections chính là bộ phận gửi yêu cầu cho Worker Process, và Worker Process lại tiếp tục gửi nó cho Master Process. Cuối cùng, Master Process sẽ đáp ứng các yêu cầu về cho người dùng
- Bảng so sánh Nginx và Apache

||Nginx|Apache|
|-|----|------|
|Hệ điều hành|Hỗ trợ một số Unix hiện đại và một số tính năng cho window|Chạy trên tất cả các loại hệ thống Unix-like và hỗ trợ đầy đủ cho Windows.|
|Hỗ trợ từ người dùng|có sự hỗ trợ rất tốt|Thiếu sự hỗ trợ người dùng từ phía công ty (Apache Foundation)|
|Tính năng|Có khả năng xử lý đến 1000 kết nối với nội dung tĩnh nhanh gấp 2.5 lần so với Apache. Sử dụng ít bộ nhớ hơn|Xử lý cùng lúc ít kết nối và tốc độ không được nhanh như Nginx|

## 3. Các tính năng mà Nginx có thể dùng
- Máy chủ Web: Nginx có khả năng hoạt động như một máy chủ web, hỗ trợ các giao thức HTTP và HTTPS. Nó có khả năng phục vụ các tệp tĩnh và động.
- Reverse Proxy : Nginx có khả năng hoạt động như một máy chủ proxy ngược, điều hướng yêu cầu từ người dùng đến các máy chủ ứng dụng hoặc dịch vụ phía sau một cách hiệu quả.
- Cân Bằng Tải: Nginx cung cấp tính năng cân bằng tải tự động giữa nhiều máy chủ, giúp phân phối tải và tăng cường sẵn sàng và hiệu suất
- Mô-đun và Tùy Chọn Cấu Hình Linh Hoạt
- 
- Hiệu suất Cao: Nginx được biết đến với khả năng xử lý đồng thời hàng ngàn kết nối với tài nguyên hệ thống tối thiểu.
## 4. Tổng quan về các file của Nginx
- Để cài Nginx (đối với centos 7)
  ```
  yum install -y epel-release
  yum -y update
  yum install nginx -y
  ```
- Tất cả các thư mục liên quan đến cấu hình của nginx sẽ nằm ở `/etc/nginx` 
  ![Alt](/thuctap/anh/Screenshot_685.png)
  - `nginx.conf`: Đây là tệp cấu hình chính cho máy chủ Nginx. Mọi thay đổi trong đây sẽ áp dụng cho toàn bộ mọi thứ liên quan đến Nginx
  - `sites-available` :Thư mục chứa các tệp cấu hình trang web . Ở đây bạn có thể thêm các tệp cấu hình nhưng nó vẫn chưa thể hoạt động
  - `sites-enabled` : Thư mục này mới chính là nơi các tệp cấu hình có thể được áp dụng . Thông thường thì ta sẽ tạo một symblink từ sites-available đến sites-enabled nhằm mục đích khi không muốn sử dụng ta chỉ cần ngắt symblink chứ không cần xóa file
  - `conf.d` : Thư mục này thường chứa các tệp cấu hình bổ sung mà bạn có thể muốn bổ sung vào cấu hình chính
  - `mime.types` : (Multipurpose Internet Mail Extensions) Tệp này liên quan đến mở rộng của mail
  - `fastcgi_params`: Tệp này chứa các tham số mặc định cho cấu hình FastCGI, một giao thức mà Nginx sử dụng để giao tiếp với các ứng dụng FastCGI, như PHP-FPM
  - `scgi_params`: được sử dụng để định nghĩa các tham số và cài đặt liên quan đến giao thức SCGI (Simple Common Gateway Interface)
  - `uwsgi_params`:  được sử dụng để định nghĩa các tham số và cài đặt liên quan đến giao thức uWSGI. uWSGI là một dịch vụ giao tiếp trung gian (middleware) giữa máy chủ web và các ứng dụng hoặc dịch vụ Python (hoặc các ngôn ngữ khác) chạy trên máy chủ cục bộ.
- Các file liên quan đến nội dung website thì sẽ được đặt ở `/var/www/html/` đối với ubuntu và `/usr/share/html` đối với centos , tuy nhiên ta vẫn có thể thay đổi thư mục để quản lý hoặc bảo mật hơn khi sử dụng nhiều site trên cùng một server
# Cấu hình Nginx(/etc/nginx/nginx.conf)
## 1. Giới thiệu về file cấu hình
- Mặc định file cấu hình của nginx sẽ nằm ở `/etc/nginx/nginx.conf`
- Nginx quản lý cấu hình theo `Derective` và `Block`
  - `Derective` là các câu lệnh cấu hình cụ thể
  - `Block` là tập hợp các câu lệnh lại với nhau dùng làm cho 1 việc gì đó
- Dưới đây là nội dung của file
    ```
    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log notice;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }


    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent" "$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile        on;
        #tcp_nopush     on;

        keepalive_timeout  65;

        #gzip  on;

        include /etc/nginx/conf.d/*.conf;
    }
  ```
## 2. Giải thích file cấu hình
### 2.1 Main block
- Main block là tập hợp các câu lệnh không được đóng trong dấu `{}` 
- Giải thích
  - `user  nginx`: quy định worker processes được chạy với tài khoản nào , ở đây là nginx
  - `worker_processes  auto` : chỉ ra web server được dùng số CPU core (processor) , giá trị này tương ứng với số CPU Core có trên máy chủ
  - `error_log  /var/log/nginx/error.log notice` : đường dẫn của file log
  - `pid        /var/run/nginx.pid` : số PID của master process
### 2.2 event block
- `worker_connections 1024`: Giá trị này liên quan đến worker processes, 1024 có nghĩa là mỗi worker process sẽ chịu tải là 1024 kết nối cùng lúc .Giá trị này chúng ta có thể tùy thuộc vào phần cứng của máy chủ 

### 2.3 http block
- `include       /etc/nginx/mime.types` và `default_type  application/octet-stream;` :Gọi tới file chứa danh sách các file extension trong nginx
- `log_format` định nghĩa cấu trúc in ra log
- ` access_log` chỉ ra đường dẫn lưu lại log thành công
- `sendfile on` : cho phép gửi file
- `tcp_nopush     on` : Nginx sẽ gửi dữ liệu phản hồi mà không cần chờ đủ một phần nhất định của dữ liệu hoặc cho đến khi có thêm dữ liệu
- `keepalive_timeout  65` :  Xác định thời gian chờ trước khi đóng 1 kết nối, ở đây là 65s
- `include /etc/nginx/conf.d/*.conf` chỉ những file có đuôi `.conf` mới có thể được tham gia block http

## 3. Một số lệnh của Nginx
- Kiểm tra các file cấu hình đã đúng chưa
  ```
  nginx -t
  ```
- Restart lại nginx
  ```
  nginx -s
  ```
# Tài liệu tham khảo
https://github.com/hocchudong/ghichep-nginx?tab=readme-ov-file

https://github.com/hocchudong/ghichep-nginx/blob/master/docs/nginx-conf.md

https://github.com/huydv398/Linux-tutorial/blob/master/Fundamental/File-Structure&config.md

https://viblo.asia/p/tim-hieu-tong-quan-ve-nginx-63vKjOExZ2R