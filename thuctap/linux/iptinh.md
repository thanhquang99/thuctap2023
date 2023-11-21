- [Cài đặt ip tĩnh trên ubuntu](#cài-đặt-ip-tĩnh-trên-ubuntu)
  - [Cấu hình bằng NETPLAN](#cấu-hình-bằng-netplan)
  - [Đặt ip tĩnh centos 7](#đặt-ip-tĩnh-centos-7)
  - [Cấu hình ip động cho centos 7](#cấu-hình-ip-động-cho-centos-7)

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
## Đặt ip tĩnh centos 7

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

