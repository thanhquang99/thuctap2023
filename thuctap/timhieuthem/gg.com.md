Khi bạn vào trình duyệt gõ `google.com` thì điều gì đã xảy ra thông quá trình ngắn ngủi đó?
- Laptop sẽ gửi yêu cầu đến máy chủ DNS để phản hồi lại IP của tên miền mà bạn gõ
- Lap top thiết lập kết nối với server thông qua địa chỉ IP (giao thức TCP/IP)
- Nếu máy bạn có firewall thì phải xem firewall có cho phép kết nối đó không
- Sau khi thiết lập kết nối trình duyệt sẽ yêu cầu SSL hoặc TLS để mã hóa dữ liệu (đối với https)
- Do google có rất nhiều truy cập nên cần phải có cân bằng tải, thông qua cân bằng tải yêu cầu của bạn sẽ được đưa đến máy chủ
- Máy chủ phản hồi thông qua cân bằng tải rồi mới đưa đến máy của bạn (html, css, javácript)
- máy bạn nhận được các tập tin này sẽ trả về cho trình duyệt 
- trình duyệt sẽ đọc các tập tin này và hiển thị ra kết quả mà bạn nhìn thấy

![Alt](/thuctap/anh/Screenshot_537.png)