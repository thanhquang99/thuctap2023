# Tổng hợp các câu lệnh hay dùng
- Trước khi vào làm việc với máy ta cần phải update hết lên

```
yum -y install update
```
- Để cập nhật ip tĩnh mà ta vừa sửa vào file `ifcfg` thì ta thực hiện lần lượt 2 câu lệnh
```
systemctl stop NetworkManager.service
systemctl start NetworkManager.service
```
- Để xem ssh sử dụng port nào ta sử dụng câu lệnh

```
netstat -tulpn | grep ssh
```
# Tổng hợp các file cần nhớ
- `/etc/sysconfig/network-scripts` là file chuyển dùng để cấu hình card mạng của centos
- `/etc/netplan/` là file cấu hình ip cho ubuntu
- `/etc/ssh/sshd_config` file cấu hình ssh có cả cấu hình port nữa