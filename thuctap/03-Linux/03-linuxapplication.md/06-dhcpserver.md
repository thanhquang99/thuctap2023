- [DHCP](#dhcp)
  - [1. Mô hình lab](#1-mô-hình-lab)
  - [2. Thực hành](#2-thực-hành)
    - [2.1 Tiến hành tắt dhcp của VMware](#21-tiến-hành-tắt-dhcp-của-vmware)
    - [2.2 Cài đặt DHCP server cho centos 8](#22-cài-đặt-dhcp-server-cho-centos-8)
    - [2.3 Cài dặt nhận ip từ dhcp cho centos 7](#23-cài-dặt-nhận-ip-từ-dhcp-cho-centos-7)
    - [2.4 test](#24-test)
  - [3. Phân tích các gói tin dhcp băng tcpdump](#3-phân-tích-các-gói-tin-dhcp-băng-tcpdump)
    - [3.1 Phân tích lý thuyết về dhcp](#31-phân-tích-lý-thuyết-về-dhcp)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# DHCP
## 1. Mô hình lab
![Alt](/thuctap/anh/Screenshot_622.png)
- Phân tích:
  - Mô hình này gồm 2 máy khác nhau , centos8 đóng vai trò làm dhcp-server và centos7 đóng vai trò làm dhcp-client
  - Car centos 7 và centos 8 đều cần 1 card mạng và gắn card mạng đó vào VM-net8 (NAT)
- Yêu cầu
  - Máy centos 8 có thể tự động cấp IP mà trong dải chỉ định cho centos 7
  - Centos 7 có thể ping ra ngoài môi trường internet bằng ip được cấp
## 2. Thực hành 
### 2.1 Tiến hành tắt dhcp của VMware
![Alt](/thuctap/anh/Screenshot_625.png)

![Alt](/thuctap/anh/Screenshot_627.png)

### 2.2 Cài đặt DHCP server cho centos 8
- Ta tiến hành tải các gói `dhcp-server` về máy
  ```
  yum install -y dhcp-server*
  ```
- Tiến hành sửa file cấu hình
  ```
  vi /etc/dhcp/dhcpd.conf
  ```
- Ta thêm nội dung sau vào cuối file
  ```
  subnet 192.168.10.0 netmask 255.255.255.0 {
          range 192.168.10.30 192.168.10.40;
          option routers 192.168.10.2;
          option subnet-mask 255.255.255.0;
          option domain-name-servers 8.8.8.8;
          option broadcast-address 192.168.10.255;
          default-lease-time 3600;
          max-lease-time 7200;
  }
  ```
  - Giải thích
    - ` range 192.168.10.30 192.168.10.40; ` Khai báo dải ip được phép cấp
    - `option routers 192.168.10.2;` : khai báo default gateway
    - `option subnet-mask 255.255.255.0;` :khai báo subnet-mask
    - `option domain-name-servers 8.8.8.8;` :khai báo dns
    - `option broadcast-address 192.168.10.255;` :khai báo broadcast
    - `default-lease-time 3600;`: khai báo thời gian mặc định ip đó được cấp
    - `max-lease-time 7200;` : khai báo thời gian tối đa ip đó được cấp

    ![Alt](/thuctap/anh/Screenshot_623.png)
- Tiến hành lưu file và chạy dịch vụ `dhcp`
  ```
  systemctl start dhcpd
  systemctl enable dhcpd
  ```
### 2.3 Cài dặt nhận ip từ dhcp cho centos 7
- Do mặc định centos7 không cần phải cài dhcp-client mà ta chỉ cần vào cấu hình lại file `ifcfg-ens33` để nhận dhcp
  ```
  vi /etc/sysconfig/network-scripts/ifcfg-ens33
  ``` 
  - Thay đổi `BOOTPROTO` sang `dhcp` và xóa hết cấu hình liên quan đến ip tĩnh. Các bạn có thể tham khảo hình bên dưới
  ![Alt](/thuctap/anh/Screenshot_626.png)
- Lưu lại và tiến hành restart lại `NetworkManager`
  ```
  systemctl restart NetworkManager
  ```
- Kiểm tra ip bằng câu lệnh `ip a`
  ![Alt](/thuctap/anh/Screenshot_624.png)
### 2.4 test
- từ centos 7 tiến hành ping ra ngoài môi trường internet
  ![Alt](/thuctap/anh/Screenshot_628.png)

## 3. Phân tích các gói tin dhcp băng tcpdump
### 3.1 Phân tích lý thuyết về dhcp
- DHCP giao tiếp bằng UDP và sử dụng port 67 và 68. 
- DHCP server sử dụng port 67 để nghe thông tin từ các client và sử dụng port 68 để reply thông tin
- Thành phần chính của DHCP bao gồm 4 bản tin:
  - DISCOVERY :bản tin mà client yêu cầu cấp ip
  - OFFER : Bản tin server gửi thông tin IP có thể cấp cho client 
  - REQUEST :Bản tin client gửi đến server bảo nó đồng ý nhận gói tin
  - ACK:gói tin mà thông báo cho client rằng ip này đã được dùng hay chưa để cilent chính thức nhận ip mới
  ![Alt](/thuctap/anh/Screenshot_641.png)

- Phân tích các bước giữa client và dhcp
  - B1: client sẽ gửi gói tin `DISCOVERY` dưới dạng broadcast đi để yêu cầu cấp địa chỉ ip do chưa biết ai là server
  - B2: server nhận được cũng sẽ gửi gói tin `OFFER` dưới dạng broadcast để đưa thông tin về IP cho client .Do client chưa có IP nên chưa phân biệt được
  - B3 :Client nhận được offer sẽ nhận bản đầu tiên mà nó nhận đc và nếu không nhận được sau 1 thời gian nó sẽ gửi lại `DISCOVERY`
  - B4 : Client sẽ gửi gói tin `REQUEST` dưới dạng broadcast để thông báo với server rằng nó nhận IP đó
  - B5 :Sau khi server nhận được gói tin nó sẽ kiểm tra xem IP này đã được sử dụng hay chưa
  - B6: Nếu còn sử dụng được thì server sẽ gửi gói tin `PACK ` còn không thì server gửi gói tin `PNAK ` để bắt client quay lại B1 và bản tin sẽ được gửi dưới dạng unicast
- Bắt gói tin bằng `tcpdump` và lưu lại file dưới dạng `pcap` và tiến hành phân tích ở `wireshark`
  ```
  tcpdump -i ens160 'port 67 or port 68' -w dhcp.pcap
  ```
- Xóa ip cũ của client và tiến hành xin lại (centos 7)
  ```
  dhclient -r ens33
  dhclient ens33
  ```
- Chuyển file bằng sftp
  ```
  get -r /root/dhcp.pcap C:\Users\ADMIN\Desktop\dhcp.pcap
  ```
- Mở wireshark lên phân tích
  ![Alt](/thuctap/anh/Screenshot_642.png)
  - đã đầy đủ 4 gói ở trên và thêm gói release đễ xóa địa chỉ ip trước đó đã cấp
- Gói `Discover`:
  - Nhìn vào hình phía trước ta nhận thấy source không có và des là broad cast đã đúng với lý thuyết
- Gói `OFFER`:
  ![Alt](/thuctap/anh/Screenshot_643.png)
  - Đúng rằng client IP hiện tại chưa có và đã được offer 1 IP
- Gói `REQUEST` :
  ![Alt](/thuctap/anh/Screenshot_644.png)
  - Đúng rằng lúc này IP vẫn chưa được nhận chính thức và đang gửi gói đồng ý nhận
- Gói `ACK` :
  ![Alt](/thuctap/anh/Screenshot_645.png)
  - Gói này gửi đầy đủ các thông tin mà ta đã khai báo ở dhcp-server (centos 8)
  - Thông tin đầy đủ chỉ có gói `OFFER` và `ACK` có
  
# Tài liệu tham khảo
https://viblo.asia/p/cau-hinh-dhcp-tren-centos-7-gDVK2a4A5Lj

https://www.youtube.com/watch?v=1XdarH8KaCE&t=161s

https://blog.cloud365.vn/ccna/dhcp-tong-quan/