- [Hướng dẫn cài đặt mobaxterm](#hướng-dẫn-cài-đặt-mobaxterm)
- [Hướng dẫn dùng mobaxterm để ssh vào centos 7](#hướng-dẫn-dùng-mobaxterm-để-ssh-vào-centos-7)
  - [Thay đổi port ssh trên linux](#thay-đổi-port-ssh-trên-linux)
  - [Sửa lỗi SSH không được](#sửa-lỗi-ssh-không-được)
  - [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Hướng dẫn cài đặt mobaxterm
[link cài đặt mobaxterm](https://mobaxterm.mobatek.net/download-home-edition.html)
- Có 2 loại để chúng ta lựa chọn là `portal` và `installer`
  - `portal` : ta down file về và sử dụng trực tiếp không cần cài đặt,nó sẽ không ảnh hưởng đến thông số của máy
  - `installer` : ta down file về và tiến hành cài đặt như các app bình thường,nó sẽ như các app khác sẽ yêu cầu quyền truy cập và thay đổi một số thông số của máy

Ở đây tôi thích dùng portal nên tôi cài portal còn các bạn thì tùy
# Hướng dẫn dùng mobaxterm để ssh vào centos 7
- Để cho phép điều khiển máy từ xa thì có 2 giao thức chính là telnet và ssh khi telnet thì sẽ gặp vấn đề lộ mật khẩu bảo mật. 

[xem trộm mật khẩu telnet](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/OSIvaTCPIP/wireshark.md#s%E1%BB%AD-d%E1%BB%A5ng-wireshark-b%E1%BA%AFt-m%E1%BA%ADt-kh%E1%BA%A9u-telnet)
- Tôi đã thực hiện cài centos 7 trên VMware workstation và đặt địa chỉ ip `192.168.68.92`
- Trên VM ta thực hiện cài đặt (Hãy nhớ rằng ta phải đứng ở quyền root để thực hiện lệnh)

```
yum –y install openssh-server openssh-clients
```
- Khởi động dịch vụ SSH
```
systemctl start sshd
systemctl enable sshd
```
- Kiểm tra trạng thái 

```
systemctl status sshd
```

- Ta mở file mobaxterm lên và thực hiện session ssh ,sau khi ấn ok thì ta sẽ phải nhập user và password vào 

![Alt](/thuctap/anh/Screenshot_143.png)

- Đây là kết quả ta đạt được ,ở đây chúng ta có thể copy băng cách nhấn chuột phải rất tiện lợi so với thao tác trực tiếp trên VMware

![Alt](/thuctap/anh/Screenshot_144.png)

## Thay đổi port ssh trên linux
- Ta có thể show port đang sử dụng ssh băng câu lệnh

```
netstat -tulnp | grep ssh
```
hoặc
```
grep -i port /etc/ssh/sshd_config
```
- Chỉnh sửa file sshd_config

```
vi /etc/ssh/sshd_config
```
- Ta tìm đến chỗ ghi `#port 22` và chỉnh thành `port 22345`

![Alt](/thuctap/anh/Screenshot_154.png)

- Khởi động lại máy chủ SSH

```
systemctl restart sshd
```
- chạy lệnh netstat và đảm bảo rằng daemon ssh hiện đang lắng nghe trên cổng ssh mới (do trước đó dùng mobaxterm để cấu hình nên khi thay đổi port sẽ không thể tiếp tục sử dụng được nữa nên tôi vào vmware cấu hình )

```
netstat -tulpn | grep ssh
```
![Alt](/thuctap/anh/Screenshot_155.png)

- Ta tiến hành ssh vào port 22345 như sau:

![Alt](/thuctap/anh/Screenshot_156.png)

## Sửa lỗi SSH không được
- Ở centos 9 thì nó sẽ không cho phép ssh bằng tài khoản root. Để có thể ssh bằng root thì ta phải sửa file 

```
vi /etc/ssh/sshd_config
```
- Ta sửa flie như trong hình (lưu ý: phải xóa dấu `#` để máy có thể hiểu được rằng đó là câu lênh )
![Alt](/thuctap/anh/Screenshot_170.png)
## Tài liệu tham khảo 

https://drive.google.com/drive/folders/1jgK20MU3-D9caYRcc9JPbnHs7AxTm-vV