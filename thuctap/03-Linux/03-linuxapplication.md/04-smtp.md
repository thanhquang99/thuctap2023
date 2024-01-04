- [1. SMTP (Simple Mail Transfer Protocol)](#1-smtp-simple-mail-transfer-protocol)
  - [1.1 Tìm hiểu chung](#11-tìm-hiểu-chung)
  - [1.2 Tại sao lại cài đặt máy chủ mail](#12-tại-sao-lại-cài-đặt-máy-chủ-mail)
- [2. Tiến hành cài đặt và cấu hình mail server](#2-tiến-hành-cài-đặt-và-cấu-hình-mail-server)
  - [2.1 Tiến hành cài đặt Postfix](#21-tiến-hành-cài-đặt-postfix)
  - [2.2 Tiến hành cấu hình postfix](#22-tiến-hành-cấu-hình-postfix)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# 1. SMTP (Simple Mail Transfer Protocol)
## 1.1 Tìm hiểu chung
- SMTP là một giao thức chuẩn được sử dụng để gửi email từ một máy chủ email tới máy chủ email khác
- Port mặc định cho SMTP là 25
- 2 Giao thức nhận mail được sử dụng nhiều nhất là POP3 và IMAP
  - POP3 :
    - Khi email được tải về, chúng thường bị xóa khỏi máy chủ 
    - Port mặc định: 110 (POP3), 995 (POP3 với SSL).
  - IMAP :
    -  khác với POP3, IMAP giữ lại tất cả email trên máy chủ
    -  Khi bạn xem email trên một thiết bị, chúng sẽ vẫn còn tồn tại trên máy chủ và có thể được truy cập từ bất kỳ thiết bị nào khác
    -  Port mặc định: 143 (IMAP), 993 (IMAP với SSL)
## 1.2 Tại sao lại cài đặt máy chủ mail
- Mail server : Là hệ thống máy chủ, là một điểm tập trung lưu trữ các hòm thư của người dùng, sắp xếp để gửi và nhận các email
- Nó cung cấp nhiều tính năng như:
  - Tạo một không gian bảo mật mail dành cho các doanh nghiệp
  - Mail có thể sử dụng private trong môi trường của doanh nghiệp
  - Có thể thiết lập sao lưu dữ liệu tự động được

# 2. Tiến hành cài đặt và cấu hình mail server
## 2.1 Tiến hành cài đặt Postfix
- Postfix: Là một máy chủ gửi mail mở rộng cho Linux, thường được sử dụng để nhận và gửi email trên các máy chủ Linux
- Các bước cài đặt
  - Do mặc định thì linux sẽ sử dụng sendmail nên ta cần tiến hành remove để cài Postfix
  ```
  yum remove sendmail
  ```
  - Tiến hành tắt firewalld
  ```
  systemctl disable firewalld
  systemctl stop firewalld
  ```
  - Tiến hành vô hiệu hóa Selinux, chỉnh file như trong hình và tiến hành reboot. Ta có thể xem trạng thái bằng lệnh `sestatus`
  ![Alt](/thuctap/anh/Screenshot_595.png)
  - Tiến hành tải `postfix`
  ```
  yum install -y postfix
  ```
  - Ở máy tôi đã cài đặt sẵn rồi
## 2.2 Tiến hành cấu hình postfix
- File cấu hình chính của postfix `/etc/postfix/main.cf`
- Mặc định postfix sẽ hoạt động trên port 25 và sử dụng giao thức SMTP
- Ta sẽ chỉnh sửa file `main.cf`, nhưng trước tiên ta cần backup lại dữ liệu để nếu chẳng may lỗi thì có thể khôi phục lại được
  ```
  cp /etc/postfix/main.cf /etc/postfix/main.cf.bak
  ```
  ```
  sudo vi /etc/postfix/main.cf
  ```
  - Mở khóa dòng 75, 83 và 99 và chỉnh sửa thành như sau(điều này có nghĩa là ta đang khai báo các biến để về sau tiện lợi dùng hơn thôi):
  ```
  75 myhostname = mail.thanhquang.site
  83 mydomain = thanhquang.site
  99 myorigin = $mydomain
  ```
  ![Alt](/thuctap/anh/Screenshot_600.png)

  - MỞ khóa dòng 113 và khóa dòng 116 . Điều này có ý nghĩa rằng ta cho phại mọi interface tham gia vào việc truyền nhận mail ra ngoài internet
  ![Alt](/thuctap/anh/Screenshot_601.png)
  - Tiếp theo ta đóng dòng 164 và mở dòng 165 ,bởi vì ta đã khai báo thêm các biến ở bước trước nên cần làm như vậy
  ![Alt](/thuctap/anh/Screenshot_602.png)
  - Ta sửa lại dòng 264 để cho phép mọi mạng bên ngoài internet tham gia vào việc truyền gửi mail
  ```
  264 mynetworks = 0.0.0.0/0, 127.0.0.0/8
  ```
  ![Alt](/thuctap/anh/Screenshot_603.png)
  - Mở khóa dòng 419 để có thể tạo ra thư mục lưu mail 
  ```
  419 home_mailbox = Maildir/
  ```
  ![Alt](/thuctap/anh/Screenshot_604.png)

  - Tiến hành lưu và thoát file `:wq`
  - khởi động và enable `postfix`
  ```
  sudo systemctl start postfix
  sudo systemctl enable postfix
  ```
  - Bây giờ ta tiến hành test thử gửi mail đến mail của mình . Dấu `.` đứng 1 mình 1 dòng có ý nghĩa là kết thúc mail
  ```
  sendmail -v khuongthanhquang276@gmail.com
  test
  xin chao toi chi muon test thu postfix cua toi thoi
  .
  ```
  và đây là kết quả
  ![Alt](/thuctap/anh/Screenshot_605.png)
  - Lưu ý mail mà bạn dùng sẽ nằm trong thư mục thư rác hoặc spam ,bạn có thể tìm kiếm ở đó 
  - Bây giờ ta sẽ tiếp tục sử dụng ssl để thiết lập bảo mật
  ```
  certbot certonly --standalone -d mail.thanhquang.site
  ```
  - Thêm vào cuối file `/etc/postfix/main.cf` dòng sau đây:
  ```
  smtp_tls_security_level = may
  smtp_tls_note_starttls_offer = yes
  smtpd_tls_security_level = may
  smtpd_tls_cert_file = /etc/letsencrypt/live/mail.thanhquang.site/fullchain.pem
  smtpd_tls_key_file = /etc/letsencrypt/live/mail.thanhquang.site/privkey.pem
  ```
  - Ta tiến hành gửi thử mail và kiểm tra
  ![Alt](/thuctap/anh/Screenshot_606.png)

  - Test thửu gửi kết quả 1 file log vào gmail
  ```
  sendmail khuongthanhquang276@gmail.com < /var/log/httpd/error_log
  ```
  ![Alt](/thuctap/anh/Screenshot_607.png)

- Một số câu lệnh thao tác với postfix
  - Sử dụng lệnh mail hoặc sendmail để gửi email một cách đơn giản
  - Gửi email với nội dung từ một tệp
  ```
  sendmail [tên mail] < [đường dẫn file]
  ```
  - Gửi mail kèm theo tiêu đề
  ```
  sendmail -s "Tiêu đề email" recipient@example.com
  ```
  -  Gửi email từ một người dùng cụ thể:
  ```
  echo "Nội dung email" | sendmail -s "Tiêu đề email" -r sender@example.com recipient@example.com
  ```
  - Gửi email với tệp đính kèm:
  ```
  echo "Nội dung email" | sendmail -s "Tiêu đề email" -A [path tệp đính kèm] recipient@example.com
  ```
- Ta test thử tính năng nhận mail bằng cách gửi từ gmail của mình đi
  ![Alt](/thuctap/anh/Screenshot_609.png)
  - Mỗi user sẽ có một thư mục `Maildir/` riêng mà ta đã cấu hình trước đó để lưu trữ lại và ta có thể xem nội dung mail ở đây
  ![Alt](/thuctap/anh/Screenshot_608.png)



# Tài liệu tham khảo
https://www.youtube.com/watch?v=VAEAuvfdIcg

https://chat.openai.com/

https://docs.google.com/document/d/1fWqO1oW1_P3ee4k9v3cMZvG5fqroS_nB6djXZ2McVts/edit