- [1. FTP và SFTP là gì?](#1-ftp-và-sftp-là-gì)
- [2. Thực hành FTP và SFTP giữa windows và Ubuntu](#2-thực-hành-ftp-và-sftp-giữa-windows-và-ubuntu)
  - [2.1 FTP](#21-ftp)
  - [2.2 SFTP](#22-sftp)
  - [2.3 Xem log của dịch vụ](#23-xem-log-của-dịch-vụ)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# 1. FTP và SFTP là gì?
- FTP (File Transfer Protocol) và SFTP (SSH File Transfer Protocol) là các giao thức truyền tải tập tin 
- Trong đó:
  - FTP : là giao thức đã tồn tại lâu đời ,được sử dụng rộng rãi nhưng nhược điểm của nó là không có mã hóa nên thiếu tính bảo mật
  - SFTP : là một phần của giao thức SSH nên sẽ được mã hóa dữ liệu và đáp ứng được yêu cầu về bảo mật

# 2. Thực hành FTP và SFTP giữa windows và Ubuntu
## 2.1 FTP
- Để có thể sử dụng FTP thì đầu tiên ta cần phải có server FTP ở đây tôi chọn Ubuntu làm server
- Sử dụng port 21 nên sẽ không được mã hóa ,khi ta dùng wireshark bắt gói tin thì sẽ lộ hết thông tin
- Cài đặt dịch vụ máy chủ FTP
    ```
    sudo apt-get update
    sudo apt-get install vsftpd
    ```
- Chỉnh sửa file `/etc/vsftpd.conf`
- Thêm nội dung sau vào file
  ```
  write_enable=YES
  ```
- Khởi động lại máy chủ FTP

    ```
    sudo systemctl restart vsftpd
    ```
- Bây giờ ta có thể tiến hành mở cmd từ window tiến hành tạo phiên , sau đó đăng nhập nhập 
  ```
  ftp [ip remote]
  ```
  ![Alt](/thuctap/anh/Screenshot_585.png)
- Các lệnh chuyển file sẽ được hướng dẫn ở phần SFTP sau

## 2.2 SFTP
- Để có thể sử dụng giao thức SFTP để truyền file thì điều cần thiết là chúng ta phải có  open-ssh trên máy remote. Bởi vì nó là 1 nhánh của SSH
- Điều dĩ nhiên port sử dụng cho giao thức SFTP là port 22 (chính là port của SSH)
- Đê sử dụng SFTP thì ta làm theo các bước:
  - Mở cmd của máy windows lên và tiến hành tạo phiên làm việc
  ```
  sftp [username]@[ip-remote]
  ```
  ![Alt](/thuctap/anh/Screenshot_581.png)
  - Sau khi tạo được phiên làm việc ta cần phải hiểu một số câu lệnh để thực hiện chuyển file
    - Máy mà windows mà ta đang tiến hành thao tác được coi là máy local còn máy ubuntu được coi là máy remote
    - Các câu lệnh tương tự như trên Linux và để phân biệt máy local và remote thì ta thêm `l` vào câu lệnh để ám chỉ máy local
    - Có 2 câu lệnh chính dùng để gửi file
      - gửi filw từ local đến remote : `put -r [path local] [path remote]` (thêm option -r để ám chỉ cả thư mục con)
      - tải file từ máy remote về máy local : `get -r [path remote] [path local]`

        ```
         put -r C:\Users\ADMIN\Desktop\anh-vmware-sua /home/thanhquang/anhvm
        ```
        ![Alt](/thuctap/anh/Screenshot_582.png)
        ```
        get -r /home/thanhquang/anhvm C:\Users\ADMIN\Desktop\anhvm
        ```
        ![Alt](/thuctap/anh/Screenshot_583.png)
        - Kiểm tra lại kết quả trên ubuntu
        ![Alt](/thuctap/anh/Screenshot_584.png)
## 2.3 Xem log của dịch vụ
- Theo mặc định, máy chủ SFTP không ghi nhật ký hành động, chỉ các sự kiện đăng nhập cho SSH/SFTP mới được đăng nhập /var/log/secure.
- Máy chủ FTP đơn giản mặc định vsftpd ghi lại một số hành động /var/log/xferlog; Các hành động get và put được ghi lại nhưng khi tôi kiểm tra các lệnh FTP dele thì không
- Xem log của FTP
  - Do chúng ta cài đặt server vsftpd nên sẽ tạo ra log `/var/log/vsftpd.log` hoặc `/var/log/xferlog`
  - Để xem được nó ta sử dụng lệnh`sudo cat vsftpd.log |more` hoặc `sudo cat /var/log/xferlog |more`

    ![Alt](/thuctap/anh/Screenshot_586.png)
- Xem log của SFTP
  - Để xem được log của SFTP thì ta phải sửa cấu hình của `/etc/ssh/sshd_config`. Tìm kiếm dòng `Subsystem sftp /usr/libexec/openssh/sftp-server` và sửa thành
  ```
  Subsystem sftp /usr/libexec/openssh/sftp-server -l VERBOSE
  ```
  - Restart lại dịch vụ sshd
  ```
  systemctl restart sshd
  ```
  - Tiến hành gửi lại file và xem nhật kí
  ```
  sudo tailf var/log/messages
  ```
  ![Alt](/thuctap/anh/Screenshot_587.png)

  
# Tài liệu tham khảo
https://www.youtube.com/watch?v=LBuILU5zeTQ

https://chat.openai.com/c/b031f3ef-02a7-45a2-9070-9fa7d2c29397

https://www.thegeekdiary.com/how-to-enable-sftp-logging-without-chroot-in-centos-rhel/
