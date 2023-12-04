- [Cài đặt ip tĩnh trên ubuntu](#cài-đặt-ip-tĩnh-trên-ubuntu)
  - [Cấu hình bằng NETPLAN](#cấu-hình-bằng-netplan)
  - [Cấu hình bằng nmcli trong network manager](#cấu-hình-bằng-nmcli-trong-network-manager)
  - [Đặt ip tĩnh centos 7](#đặt-ip-tĩnh-centos-7)
    - [sửa file cấu hình](#sửa-file-cấu-hình)
    - [sử dụng lênh nmcli](#sử-dụng-lênh-nmcli)
  - [Cấu hình ip động cho centos 7](#cấu-hình-ip-động-cho-centos-7)
  - [Trường hợp test thử các lỗi sai](#trường-hợp-test-thử-các-lỗi-sai)

# Cài đặt ip tĩnh trên ubuntu
- Show ip:`ip a`
## Cấu hình bằng NETPLAN
- xem tên card mạng bằng lệnh sau:

```
networkctl status
```
![Alt](/thuctap/anh/Screenshot_127.png)

- Sửa file cấu hình netplan

```
vi /etc/netplan/00-netcfg.yaml
```

- Chỉnh sửa nội dung file :Lưu ý ta phải chuyển bàn phím sang tiếng anh và gõ `sudo su` để dùng quyền root mới chỉnh sửa file được

```
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses: [192.168.1.3/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
      dhcp6: no
```
![Alt](/thuctap/anh/Screenshot_128.png)
- Áp dụng file cấu hình mới

```
netplan apply
```

- Show ip khi đã đặt lại

![Alt](/thuctap/anh/Screenshot_129.png)

![Alt](/thuctap/anh/Screenshot_131.png)

## Cấu hình bằng nmcli trong network manager
- Do ubuntu ưu tiên sử dụng netplan hơn Network Manager nên ta cần phải chỉnh sửa file netplan thêm dong `renderer: NetworkManager` :

```
sudo vi /etc/netplan/00-installer-config.yaml
```

```
network:
  version: 2
  renderer: NetworkManager

```
- Bây giờ ta có thể sử dụng câu lệnh nmcli để bắt dầu cấu hình

```
nmcli con mod ens33 ipv4.addr 192.168.10.21/24
nmcli con mod ens33 ipv4.gateway 192.168.10.2
nmcli con mod ens33 ipv4.dns 8.8.8.8
nmcli con mod ens33 ipv4.method manual
nmcli con mod ens33 connection.autoconnect yes
```

- Những cấu hình mới sẽ lưu vào bộ nhớ tạm chứ không thể áp dụng ngay khi ta `systemctl restart NetworkManager` như centos 7. Để có thể áp dụng được cấu hình mới ta cần bật tắt lại card mạng

```
sudo ifdown ens33
sudo ifup ens33
```
## Đặt ip tĩnh centos 7
### sửa file cấu hình

- Show ip

![Alt](/thuctap/anh/Screenshot_130.png)
- sửa file card ens33

```
vi /etc/sysconfig/network-scripts/ifcfg-ens33

```
- Sửa file cấu hình theo nội dung

![Alt](/thuctap/anh/Screenshot_132.png)
- reboot lại 

```
reboot
```
- Kết quả:

![Alt](/thuctap/anh/Screenshot_133.png)

### sử dụng lênh nmcli
- đầu tiên ta kiểm tra trạng thái bằng lệnh

```
nmcli device status
```

![Alt](/thuctap/anh/Screenshot_395.png)
- Đổi tên connection trong nmcli

```
nmcli con mod [tên cũ] connection.id [tên mới]
```
- Đặt ip address,gateway,dns

```
nmcli con mod ens33 ipv4.addr 192.168.10.20/24
nmcli con mod ens33 ipv4.gateway 192.168.10.2
nmcli con mod ens33 ipv4.dns 8.8.8.8
```
- Chuyển ip sang thủ công

```
nmcli con mod ipv4.method manual
```
- Bật kết nối tự dộng

```
nmcli con mod ens33 connection.autoconnect yes
```
- khởi động lại và kiểm tra trạng thái

```
systemctl restart network
nmcli device status
ip a
```

## Cấu hình ip động cho centos 7
- Để cấu hình dhcp ta cũng sửa file ifcfg-ens33

```
vi /etc/sysconfig/network-scripts/ifcfg-ens33
```
- Ta sửa nội dung như trong hình

![Alt](/thuctap/anh/Screenshot_141.png)
- reset mạng 

```
systemctl restart network.service
```
hoặc 
```
service network restart
```
- Kết quả:

![Alt](/thuctap/anh/Screenshot_142.png)

## Trường hợp test thử các lỗi sai
- file cấu hình file netplan bị sai . khi ta chạy lệnh `netplan apply` sẽ có thông báo là lệnh sai

![Alt](/thuctap/anh/Screenshot_350.png)
- Khi ta sửa file cấu hình `ifcfg-ens33` của centos thành sai thì khi `service network restart` hay `systemctl restart network` thì file vẫn chạy bình thường 
  - nếu cấu hình sai cấu trúc ip thì nó sẽ coi như là card ens33 chưa có ip 
  - nếu cấu hình ip mà không cùng vnet thì ip vẫn sẽ được nhận và chỉ không thể ping ra ngoài internet thôi (Nesu ping được hãy xem lại default-gateway vì những ip nào không xác định sẽ được chuyển qua default-gateway .bạn có thể thay đổi nó thử xem)