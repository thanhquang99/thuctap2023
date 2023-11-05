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


## Định tuyến đường đi

![Alt](/thuctap/anh/Screenshot_30.png)

Ta hãy phân tích sơ đồ trên : Sơ đồ này gồm 4 dải mạng , 3 máy tính 3 dải mạng ,3 router 1 dải mạng. Theo mặc định các máy tính chỉ có thể liên lạc với nhau trong cùng 1 dải mạng.Nhưng router có thể định tuyến đường đi để các dải mạng không cùng 1 dải liên lạc với nhau
- Ví dụ dải `192.168.1.0/24` liên lạc với `192.168.2.0/24` thì cần qua `10.0.0.2/8` thì ta ở router 1 thực hiện lệnh sau
```
ip route 192.168.2.0 255.255.255.0 10.0.0.2
```
- Nếu mới chỉ như vậy thì chưa đủ mới chỉ có dải  `192.168.1.0/24` liên lạc với `192.168.2.0/24` còn dải `192.168.2.0/24` chưa liên lạc được với `192.168.1.0/24`, để xử lý điều đó chúng ta sẽ ở router 2 cấu hình ngược lại
```
ip route 192.168.1.0 255.255.255.0 10.0.0.1
```
Đây chính là kết quả khi ta ping từ laptp `192.168.1.2` đến `192.168.2.2`. và có 1 lưu ý nữa `ta phải thiết lập default cho các laptop tuy theo từng dải mạng`

![Alt](/thuctap/anh/Screenshot_31.png)

### Cấp dhcp cho laptop
-  đế cấp dhcp thì ta phải mode `config` ở mỗi router để cấu hình
```
service dhcp 
ip dhcp excluded-address 192.168.1.1 192.168.1.2 /để loại bỏ 2 ip ko được cấp vì đã dùng/
ip dhcp pool LAN1
network 192.168.1.0 255.255.255.0
default-router 192.168.1.1
dns-server 8.8.8.8
```
- Ta có thể cấp 1 ip cố định cho 1 server (có thể khác) bằng cách biết địa chỉ Mac của nó

Trên router ta cấu hình như sau:
```
ip dhcp pool [tên server mình tự đặt]
client-indentifier [Mac]
host [ip cần cấp cố định] [subnet mask]
dns-server 8.8.8.8
default-router 192.168.1.1
```
### Mangj Vlan
- Mạng vlan laf gì? 
- Vlan(virtual local area network) :Mạng lan được định nghĩa là một mạng cục bộ, ta có thể hiểu là 1 dải mạng và nó bao gồm tất cả các mạng con nằm trong nó. Vlan chính là mạng cục bộ ảo. Nó được tạo ra để từ 1 con switch chia ra thành nhiều switch ảo tránh lãng phí tài nguyên.
- Cấu hình vlan trên sisco
```
SW(config)#vlan n​ /tao vlan n
Switch(config-vlan)#name test / đặt tên cho vlan
Switch(config)#interface f0/1 / Truy cập vào interface
Switch(config-if)#switchport mode access /Bật mode cho phép truy cập
Switch(config-if)#switchport access vlan n

```
Ta có thể gắn 1 dải interface thay bằng 1 interface bằng cú pháp sau:
```
Switch(config)#interface range f0/1-8
Switch(config-if)#switchport mode access
Switch(config-if)#switchport access vlan n
```

## Tài liệu tham khảo :
https://www.youtube.com/watch?v=55YDCAfz75k&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ&index=4

