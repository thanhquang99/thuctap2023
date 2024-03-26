# 1. Tổng quan về VyOS
VyOS là một hệ điều hành mạng dựa trên Linux cung cấp chức năng định tuyến mạng, tường lửa và VPN dựa trên phần mềm
- VyOS là một Hệ điều hành (OS) có chức năng tương đương với Router
- tích hợp nhiều chức năng thiết yếu của 1 thiết bị mạng (ROUTER, MODEM, FIREWALL, VPN, Load Balancing, WebFiltering, WebCache, Nat, DHCP…)


Vyos hiện có 3 phiên bản khác nhau bao gồm có:
- Vyos community : là phiên bản Open source miễn phí đầy đủ các chức năng cơ bản cần thiết cho các mạng công ty hoặc gia đình vừa và nhỏ . Phiên bản này không nhận được sự hỗ trợ từ nhà sản xuất
- Vyos Professional: là phiên bản thương mại của Vyos với các chức năng nổi bậc mà phiên bản vyatta core không có. 
- Vyos Corporate: được khuyên dùng cho khách hàng enterprise, nhưng chức năng lọc web và soát lưu lượng cao cấp hơn cho phép lọc luồng data cao cấp hơn, đem lại sự an toàn hơn với khả năng tự động thu nhập thông tin của người dùng khi truy cập vào internet, giảm thiểu các mối nguy hiểm như phising,scan…..và cơ sở dữ liệu được cập nhật hằng ngày giúp tăng tối đa sự bảo mật của hệ thống mạng khi truy cập ra ngoài internet. Ngoài ra images cài đặt của version này đã được tối ưu hóa cho các nền tảng ảo hóa.

# 2. Các tính năng chính của VyOS
- Định tuyến: Cung cấp các tính năng định tuyến như RIP, OSPF, BGP để quản lý giao thông mạng.
- Tường lửa: Cho phép quản lý lưu lượng mạng và thực hiện các chính sách bảo mật thông qua tường lửa.
- VPN: Hỗ trợ các giao thức VPN như IPsec, OpenVPN để thiết lập các kết nối an toàn giữa các vị trí khác nhau.
- QoS (Quality of Service): Cho phép ưu tiên lưu lượng mạng dựa trên các quy tắc được thiết lập trước để đảm bảo chất lượng dịch vụ.
- NAT (Network Address Translation): Thực hiện chuyển đổi địa chỉ IP và quản lý các luồng lưu lượng qua mạng.
- Proxy: Cung cấp tính năng proxy cho HTTP, HTTPS, FTP, DNS và nhiều giao thức khác.

# 3. Một số lệnh dùng
## 3.1 DHCP
- Cấu hình một pool DHCP:
    ```
    configure
    set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 default-router 192.168.1.1
    set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 dns-server 8.8.8.8
    set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 range 192.168.1.100-192.168.1.200
    ```
- Kích hoạt dịch vụ DHCP:
    ```
    set service dhcp-server global-parameters 'domain-name vyos.local'
    set service dhcp-server shared-network-name LAN subnet 192.168.1.0/24 disable false
    ```
- Lưu cấu hình
```
commit
save
```
## 3.2 Định tuyến
Mô hình

![Alt](/thuctap/anh/Screenshot_972.png)

- Tạo VLAN
    ```
    configure
    set interfaces ethernet eth0 vif 10 address '192.168.99.1/24'
    set interfaces ethernet eth1 vif 20 address '172.16.66.1/24'
    set interfaces ethernet eth2 vif 30 address '172.16.68.1/24'
    ```

- Cấu hình giao tiếp giữa các VLAN:
    ```
    set firewall name VLAN_INTERFACES default-action 'drop'
    set firewall name VLAN_INTERFACES rule 10 action 'accept'
    set firewall name VLAN_INTERFACES rule 10 source address '192.168.99.0/24'
    set firewall name VLAN_INTERFACES rule 10 destination address '172.16.66.0/24'
    set firewall name VLAN_INTERFACES rule 20 action 'accept'
    set firewall name VLAN_INTERFACES rule 20 source address '192.168.99.0/24'
    set firewall name VLAN_INTERFACES rule 20 destination address '172.16.68.0/24'
    ```
- Áp dụng các quy tắc tường lửa cho các giao diện VLAN:
    ```
    set interfaces ethernet eth0 vif 10 firewall in name 'VLAN_INTERFACES'
    set interfaces ethernet eth1 vif 20 firewall in name 'VLAN_INTERFACES'
    set interfaces ethernet eth2 vif 30 firewall in name 'VLAN_INTERFACES'
    ```
- Lưu cấu hình:
    ```
    commit
    save
    ```