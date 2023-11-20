- [Hướng dẫn cài đặt mobaxterm](#hướng-dẫn-cài-đặt-mobaxterm)
- [Hướng dẫn dùng mobaxterm để ssh vào centos 7](#hướng-dẫn-dùng-mobaxterm-để-ssh-vào-centos-7)
  - [Thay đổi port ssh trên linux](#thay-đổi-port-ssh-trên-linux)
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


## Tài liệu tham khảo 