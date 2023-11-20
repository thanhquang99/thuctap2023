Mục lục
- [Tổng hợp lại kiến thức xem video vnpro](#tổng-hợp-lại-kiến-thức-xem-video-vnpro)
- [Cisco](#cisco)
- [Thực hành](#thực-hành)
  - [đổi password console (hoặc enable)](#đổi-password-console-hoặc-enable)
- [Định tuyến đường đi](#định-tuyến-đường-đi)
  - [Cấp dhcp từ router cho máy tính](#cấp-dhcp-từ-router-cho-máy-tính)
  - [Tìm hiểu về Vlan](#tìm-hiểu-về-vlan)
  - [Back up file cấu hình và IOS](#back-up-file-cấu-hình-và-ios)
  - [Tìm hiểu về vlan trunk](#tìm-hiểu-về-vlan-trunk)
- [Tài liệu tham khảo :](#tài-liệu-tham-khảo-)


## Tổng hợp lại kiến thức xem video vnpro
- Mô hình OSI
  https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/OSIvaTCPIP/osivatcpipnew.md#m%C3%B4-h%C3%ACnh-osi-v%C3%A0-tcpip
- Tìm hiểu về cisco
## Cisco
- cisco packet tracer là phần mềm giúp ta mô phỏng quá trình logic các mạng máy tính trên đường truyền mạng
- Có một vài lưu ý chúng ta cần nhớ:
  - switch là bản nâng cấp của hub, Nó có tác dụng ghép nối các laptop lại với nhau. Ta có thể tưởng tượng rằng máy tính là 1 họ người văn phòng vậy ,nó là tập hợp 1 số người có cùng điểm chung với nhau
  - Router: Đúng như tên gọi của nó thì nó định tuyến đường đi . Như switch là 1 họ người có chung 1 đặc điểm thì router lại được coi như là cái cửa mỗi cái cửa sẽ dẫn đến 1 họ người khác nhau. 
- Trong router và switch sẽ có 2 mode quan trọng là mode`#` và mode `config` 
  - Để vào mode `#` ta gõ lệnh `enable`
  - Để vào mode `config` ta gõ `conf t` .Đây là mode quan trọng khi chúng ta cần cấu hình gì thì bắt buộc phải vào mode này
  - Lưu ý : Ta muốn làm gì thì cần phải vào đúng vị trí đó để thực hiện, Như khi cần cấu hình interface f0/0 thì ta phải đứng đúng interface f0/0
 ## Thực hành
 ### đổi password console (hoặc enable)

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

- thiết lập trên router cho phép telnet trên laptop khác `line vty 0-X` trong đó x+1 là số telnet có thể truy cập đến ,tiếp theo ta sẽ đặt password để truy cập.

![Alt](/thuctap/anh/Screenshot_25.png)

- Bây giờ ta có thể từ máy tính kết nối trong mạng và tiến hành telnet đến router(ip:192.168.10.1)

![Alt](/thuctap/anh/Screenshot_26.png)

- SSH lên router: Để có thể ssh lên router ta cần đảm bảo 2 điều kiện là có public key và privatie key . Để có được thứ đó đầu tiên ta cần đặt tên cho router, sau đó tạo user và password 

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
`Lưu ý đây là định tuyến trên router và switch layer 2`
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

### Cấp dhcp từ router cho máy tính
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
### Tìm hiểu về Vlan
- Mạng vlan laf gì? 
- Vlan(virtual local area network) :Mạng lan được định nghĩa là một mạng cục bộ, ta có thể hiểu là 1 dải mạng và nó bao gồm tất cả các mạng con nằm trong nó. Vlan chính là mạng cục bộ ảo. Nó được tạo ra để từ 1 con switch chia ra thành nhiều switch ảo tránh lãng phí tài nguyên.
- Cấu hình vlan trên sisco: Để cấu hình Vlan ta thực hiện lần lượt theo các bước sau:
  - Tạo Vlan
  - Khai báo địa chỉ ip cho Vlan
  - Gắn cổng cho Vlan 
  - Tắt bật công đã gắn cho Vlan để Vlan chuyển từ trạng thái down lên up

`Lưu ý: đây là đang thực hiện trên switch layer 3`
```
int vlan 1
ip address 192.168.1.1
no shutdown
end
conf t
interface fastEthernet 0/1
switchport mode access 
switchport access vlan 1
shutdown 
no shutdown 
exit
```
Ta có thể gắn 1 dải interface thay bằng 1 interface bằng cú pháp sau:
```
Switch(config)#interface range f0/1-8
Switch(config-if)#switchport mode access
Switch(config-if)#switchport access vlan n
```

### Back up file cấu hình và IOS
- Để back up file cấu hình ta có 2 sựa lựa chọn là `tftp server` hoặc `ftp server`
- `ftp server` là sự lựa chọn tốt hơn vì nó tránh làm mất mát và có khả năng khôi phục được file trong quá trình gửi đi
- Để cấu hình `ftp server` ta cần đặt `user name` và `password` còn `tftp server thì không`
- Ta cần phải hiểu thêm về bộ nhớ `Ram` và `NVRam`
  - Ram là bộ nhớ tạm thời nếu mất điện thì sẽ mất hết dữ liệu : file `running config`
  - NVRam là bộ nhớ mà mất mất điện đi vẫn còn lưu :file `startup config`
copy running config vào ftp server
```
Router(config)#ip ftp username thanhquang
Router(config)#ip ftp password 123456
Router(config)#end
Router#copy running-config ftp:
Address or name of remote host []? 192.168.1.2
Destination filename [Router-confg]? runningconfig.cfg
```
copy trở lại router
```
Router#copy ftp: running-config 
Address or name of remote host []? 192.168.1.2
Source filename []? runningconfig.cfg
Destination filename [running-config]? 
```

- Còn tftp server thì làm  tương tự nhưng không cần đặt user và password
- Hệ điều hành đã làm ở trên


### Tìm hiểu về vlan trunk
- Đầu tiên ta đã biết Vlan là chia ra các Lan ảo từ 1 Lan thật , vậy để các Vlan liên lạc với nhau chẳng lẽ ta lại phải nối nhiều đây lên router để chúng liên lạc với nhau? Vlan trunk sinh ra là để giải quyết điều đó, Nó có tác dụng gộp các Vlan thành 1 dây nối và để biết kết nối đó thuộc Vlan nào thì nó sẽ được đánh dấu bằng thẻ tag để phân biệt
- Để có thể kết nối trunking thì ta phải kết nối vào trunking port



## Tài liệu tham khảo :
https://www.youtube.com/watch?v=55YDCAfz75k&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ&index=4

