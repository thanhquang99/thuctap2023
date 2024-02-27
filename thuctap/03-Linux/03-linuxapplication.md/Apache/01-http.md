# http là gì
- HTTP (HyperText Transfer Protocol) là một giao thức được sử dụng để truyền tải dữ liệu trên web.
- Trên linux để sử dụng http thì tâ sẽ cài wordpress về để thực hành

# Cài đặt wordpress
- Để cài đặt wordpress ta có thể xem [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/limux-hhtp/01.wordpress1node.md) 

# Tiến hành phân tích log
- `/var/log/httpd`:
    -  `access_log`:
       -  chứa một bản ghi của tất cả các yêu cầu nhận được qua HTTP
       -  Ghi lại địa chỉ IP và ID người dùng
    -  ` error_log`:
       -  chứa tất cả các lỗi gặp phải httpd
       -  bao gồm các vấn đề về bộ nhớ và các lỗi liên quan đến hệ thống khác

  - Định dạng cơ bản các đòng trong access_log (httpd)
    ```
    %h %l %u %t %r %>s %b Refer User_agent
    ```

    - %h: địa chỉ của máy client
    - %l: nhận dạng người dùng được xác định bởi identd (thường không SD vì không tin cậy)
    - %u: tên người dung được xác định bằng xác thức HTTP
    - %t: thời gian yêu cầu được nhận
    - %r: là yêu cầu từ người sử dụng (client)
    - %>s: mã trạng thái được gửi từ máy chủ đến máy khách
    - %b: kích cỡ phản hồi đối với client
    - Refer: tiêu đề Refeer của yêu cầu HTTP (chứa URL của trang mà yêu cầu này được khởi tạo)
    - User_agent: chuỗi xác định trình duyệt 
  - Định dạng này được quyết định trong file `/etc/httpd/conf/httpd.conf`

  ![Alt](/thuctap/anh/Screenshot_577.png)
  ![Alt](/thuctap/anh/Screenshot_575.png)

    - 1: thời gian
    - 2: modul tạo ra thông diệp
    - 3:Process ID
    - 4: thông báo lỗi

  ![Alt](/thuctap/anh/Screenshot_576.png)

|status code|Nội dung|
|-----------|--------|
|200 OK| yêu cầu đã được chấp nhận và xử lý thành công|
|201 Created|Yêu cầu đã được tiếp nhận để xử lý nhưng chưa hoàn thành|
|202 Accepted|Yêu cầu đã được tiếp nhận nhưng chưa xủ lý|
|301 Moved Permanently| Bạn đang truy cập vào URL cũ hãy truy cập vào URL mới|
|400 Bad Request|Server không thể xử lý hoặc sẽ không xử lý các Request lỗi của phía client (ví dụ Request có cú pháp sai...)|
|401 Unauthorized| Bạn đang truy cập page được bảo vệ mà không cung cấp thông tin chính xác|
|403 Forbidden| Bạn đã login được nhưng không có quyền truy cập vào nguồn tài nguyên này|
|404 Not Found| Tài nguyên không được tìm thấy|
|500 Internal Server Error|Đã xảy ra lỗi trên máy chủ của trang web|
|502 Bad Gateway|Bạn đã cố truy cập 1 trang web nhưng 1 máy chủ nhận được 1 phản hồi không hợp lệ từ 1 máy chủ khác cần liên lạc để thực hiện yêu cầu|
|503 Service Unavailable| Máy chủ ngưng hoạt động hoặc quá tải|
|504 Gateway Timeout| máy chủ không nhận được phản hồi kịp thời từ một máy chủ khác mà nó đang truy cập trong khi cố gắng tải trang web |
## Bài tập
- Tiến hành lọc thử file log của dịch vụ apache mà có status code là 304
  ```
  sudo awk '$9 == 304' /var/log/httpd/access_log |more
  ```
    ![Alt](/thuctap/anh/Screenshot_578.png)

