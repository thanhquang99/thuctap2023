- [Hướng dẫn đẩy log của ESXi vào server](#hướng-dẫn-đẩy-log-của-esxi-vào-server)
  - [1. Mô hình triển khai](#1-mô-hình-triển-khai)
  - [2. Cấu hình trên Log Server](#2-cấu-hình-trên-log-server)
  - [3. Cấu hình trên ESXi](#3-cấu-hình-trên-esxi)
  - [4. Kiểm tra kết quả](#4-kiểm-tra-kết-quả)
  - [5. Cấu hình rsyslog](#5-cấu-hình-rsyslog)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Hướng dẫn đẩy log của ESXi vào server
## 1. Mô hình triển khai
  ![Alt](/thuctap/anh/Screenshot_985.png)

IP planning
|Tên máy|interface|IP|
|---|--|--|
|ESXi 7.0.3|eth 0| 172.16.66.43|
|Log Server|ens 33|172.16.66.50|

## 2. Cấu hình trên Log Server
- Ta sử dụng dịch vụ Rsyslog để lắng nghe các gói tin UDP từ port 514 để thu thập log từ ESXi 
- Ta tiến hành bật dịch vụ rsyslog 
  ```
  systemctl start rsyslog
  systemctl enable rsyslog
  ```
- Cho phép firewall từ dịch vụ rsyslog
  ```
  ufw allow 514/udp
  ufw reload
  ```
- Tiến hành kiểm tra firewall
  ```
  ufw status
  ```
  ![Alt](/thuctap/anh/Screenshot_986.png)
- Tiến hành chỉnh sửa file cấu hình của rsyslog
  ```
  vi /etc/rsyslog.conf
  ```
- Thêm nội dung sau vào cuối file 
  ```
  # esxi log
  $ModLoad imudp
  $UDPServerRun 514
  #Storing Messages from a Remote System into a specific File
  $template RemoteServer, "/var/log/vmware-esxi.log/%fromhost-ip%/%programname%"
  if $fromhost-ip startswith '172.16.66.43' then ?RemoteServer
  & ~
  ```
  ![Alt](/thuctap/anh/Screenshot_987.png)
- Giải thích 
  - `$ModLoad imudp` : sử dụng udp để lắng nghe , thu thập log
  - `$UDPpoolRun 514` : sử dụng port 514 với giao thức udp
  - `$template RemoteServer, "/var/log/vmware-esxi.log/%fromhost-ip%/%programname%"` : định nghĩa cấu trúc lưu file log
  - `if $fromhost-ip startswith '172.16.66.43' then ?RemoteServer` : Nếu các gói tin có nguồn từ từ ip 172.16.66.43 thì lưu log theo template ở bước trước
- Ta tiến hành restart lại dịch vụ `rsyslog`
  ```
  systemctl restart rsyslog
  ```
## 3. Cấu hình trên ESXi
- Để có thể chuyển được log từ ESXi sang Log Server thì ta cần firewall cho phép
  ```
  esxcli network firewall ruleset set --ruleset-id=syslog --allowed-all=true
  esxcli network firewall ruleset set --ruleset-id=syslog --enabled=true
  ```
- Tiến hành reload và kiểm tra 
  ```
  esxcli network firewall refresh
  esxcli network firewall ruleset list --ruleset-id=syslog
  ```
  ![Alt](/thuctap/anh/Screenshot_988.png)
- Tiến hành đẩy log từ esxi sang log server
  ```
  esxcli system syslog config set --loghost=udp://172.16.66.50:514
  ```
- Reset lại syslog để lệnh mới thêm vào được áp dụng
  ```
  esxcli system syslog reload
  ```
## 4. Kiểm tra kết quả
- Ta tiến hành vào log server để xem log đã được đẩy sang chưa
  ```
  cd /var/log/vmware-esxi.log
  tree
  ```
  ![Alt](/thuctap/anh/Screenshot_989.png)
- Ta sẽ dùng tcpdump bắt các gói tin từ port 514 rồi kiểm tra bằng wireshark
  ```
  tcpdump -i ens160 port 514 -w log.pcap
  ```
  ![Alt](/thuctap/anh/Screenshot_990.png)
## 5. Cấu hình rsyslog

# Tài liệu tham khảo
https://wazuh.com/blog/monitoring-vmware-esxi-with-wazuh/