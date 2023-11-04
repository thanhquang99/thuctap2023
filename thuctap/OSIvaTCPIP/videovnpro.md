## Tổng hợp lại kiến thức xem video vnpro
- Mô hình OSI
  https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/OSIvaTCPIP/osivatcpipnew.md#m%C3%B4-h%C3%ACnh-osi-v%C3%A0-tcpip
- Tìm hiểu về cisco
## Cisco
- cisco packet tracer là phần mềm giúp ta mô phỏng quá trình logic các mạng máy tính trên đường truyền mạng
- Hub :ghép nối các máy lại với nhau( chỉ hoạt động được ở layer 1 )
- Bridge : Là bản nâng cấp của hub giúp các máy tính liên lạc với nhau (Có thể hoạt động ở layer 2)
- Switch :Cũng hoạt động ở layer 2 nhưng nó tiến tiến hơn 2 con trên ,có nhiều port hơn, Nó có thê giữ lại hay gửi đi các dữ liệu tùy data
  - Học địa chỉ Mac ngay khi mới bắt đầu , Khi A gửi cho B 1 gói tin thì nó sẽ học Mac của máy a sau đó khi chưa biết Mac đích thì nó sẽ gửi toàn bộ đến các cổng và khi cổng nào trùng Mac thì sẽ có phản hồi và nó lại tiếp tục lưu địa chỉ Mac vào bẳng
 ## Thực hành
 - đổi password console

![Alt](/thuctap/anh/Screenshot_18.png)

- Mật khẩu enable thì làm tương tự

![Alt](/thuctap/anh/Screenshot_19.png)

- Mã hóa password để không bị ai biết khi nhập

![Alt](/thuctap/anh/Screenshot_20.png)

- Mô hình thiết lập

![Alt](/thuctap/anh/Screenshot_21.png)

  - CDP là gì : CDP là dữ liệu khách hàng ta có thể kiểm tra bằng câu lệnh` show cdp neighbors` ở trên router hoặc switch

![Alt](/thuctap/anh/Screenshot_22.png)

Ta có thể tắt đi bằng câu lệnh `no cdp run`

![Alt](/thuctap/anh/Screenshot_23.png)

thiết lập trên router cho phép telnet trên laptop khác `line vty 0-X` trong đó x+1 là số telnet có thể truy cập đến ,tiếp theo ta sẽ đặt password để truy cập.

![Alt](/thuctap/anh/Screenshot_25.png)

Bây giờ ta có thể từ máy tính kết nối trong mạng và tiến hành telnet đến router(ip:192.168.10.1)

![Alt](/thuctap/anh/Screenshot_26.png)

SSH lên router: Để có thể ssh lên router ta cần đảm bảo 2 điều kiện là có public key và privatie key . Để có được thứ đó đầu tiên ta cần đặt tên cho router, sau đó tạo user và password 

```

hostname R1
ip domain-name thanhquang.com
crypto key generate rsa
username thanhquang password 123456
line vty 0
login local
transport input ssh 
exit
enable password 123456

```
- Khôi phục lại hệ điều hành của router khi lỡ xóa file flash:
```
rommon 5 > IP_ADDRESS=10.10.10.2
rommon 6 > IP_SUBNET_MASK=255.0.0.0
rommon 7 > DEFAULT_GATEWAY=10.10.10.1
rommon 8 > TFTP_SERVER=10.10.10.2
rommon 9 > TFTP_FILE=c2900-universalk9-mz.SPA.151-4.M4.bin
rommon 10 >tftpdnld
```
![Alt](/thuctap/anh/Screenshot_27.png)

Dưới đây là hình ảnh mà switch ssh đến router

![Alt](/thuctap/anh/Screenshot_28.png)

- Copy file config của router vào server

![Alt](/thuctap/anh/Screenshot_29.png)

- khôi phục lại hệ điều hành cho router

Router có bộ nhớ flash để chạy hệ điều hành chính và bộ nhớ Rom đề phòng khi hệ điều hành chính trong flash bị mất

Ta có thể xóa hệ điều hành chính đi bằng câu lệnh `delete flash [tên file]`
sau đó `reload` từ router sẽ chuyển về rommon

ta bắt đầu cấu hình như sau:
```
IP_ADDRESS=10.0.0.1
IP_SUBNET-MASK=255.0.0.0
DEFAULT_GATEWAY=10.0.0.2
TFTP_SERVER=10.0.0.2
TFTP_FILE=[TÊN FILE CAU HÌNH]
tftpdnld
```
Trong đó `10.0.0.1`là ip router `10.0.0.2`là ip server tftp dùng để chứa file tftp dùng cấp lại hệ điều hành.Sau khi thành công ta `reset`để router trở lại bình thường
`hệ điều hành không liên quan đến cấu hình mà router ta đã cấu hình trc đó`


## Tài liệu tham khảo :
https://www.youtube.com/watch?v=55YDCAfz75k&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ&index=4

