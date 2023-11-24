- [SSH hoạt động như thế nào](#ssh-hoạt-động-như-thế-nào)
- [SSH key pair](#ssh-key-pair)
- [Thực hành](#thực-hành)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# SSH hoạt động như thế nào
![Alt](/thuctap/anh/Screenshot_223.png)

- Bước 1 client sẽ gửi 1 yêu cầu kết nối đến server
- Bước 2 server sẽ gửi 1 cái public key cho client (nó dùng để chứng minh danh tính của nó cho client ,server là ai)
- Bước 3 server và client sẽ thỏa thuận tham số rồi mở kênh bảo mật (ở bước này ta có thể hiểu như là thỏa thuận version ,loại mã hóa được sử dụng,...)
- Bước 4 người dùng đăng nhập vào hệ điều hành máy chủ

# SSH key pair
- Người ta nhận thấy khi ssh mà đăng nhập bằng user và password có thể không an toàn hay có thể bị nhìn lén hoặc khi copy vào 1 file nào đó mà bị mất sẽ đẫn đến mất khả năng bảo mật
- ssh key pair sẽ giải quyết được điều đó ,nó sẽ tự tạo ra một private key đã được mã hóa tương ứng với người dùng và kèm theo đó là passphrase là lớp bảo mật thứ 2 nó tương tự như mật khẩu người dùng vậy
- Mã hóa dùng trong SSH là mã hóa bất đối xứng nó sẽ tạo ra 1 cặp public key và private key để mã hóa và giải mã .
- public key sẽ gửi cho toàn bộ các client còn private key sẽ chỉ để cho client giữ (nó là duy nhất 1 client 1 private key)

# Thực hành

- Sử dụng tool để sinh ra cặp key pair đó ,ta sử dụng keygen sinh ra key theo thuật toán rsa

```
ssh-keygen -t rsa
```
- Sau đó ta sẽ được hỏi file key pair này được lưu ở đâu và yêu cầu được tạo mới passhrase

![Alt](/thuctap/anh/Screenshot_224.png)

- Ta tiến hành kiểm tra key

![Alt](/thuctap/anh/Screenshot_225.png)

- Copy file private key về máy để sử dụng. Tôi sử dụng lệnh cat để hiện thị nội dung private key ra rồi sau đó copy và paste vào máy tính của mình

![Alt](/thuctap/anh/Screenshot_226.png)

- Ta bắt buộc phải sửa file sshconfig để yêu cầu bắt buộc sử dụng keypair

```
vi /etc/ssh/sshd_config
```
- Ta xóa dấu # như trong hình để câu lệnh có hiệu lực

![Alt](/thuctap/anh/Screenshot_227.png)

- Ta tiến hành restart service sshd

```
systemctl restart sshd
```

- Ta tiến hành tạo phiên ssh mới vào máy

![Alt](/thuctap/anh/Screenshot_228.png)

![Alt](/thuctap/anh/Screenshot_229.png)


- Vậy là mọi thứ đã hoàn tất. 

# Tài liệu tham khảo

https://docs.google.com/document/d/1BVbJgmZIVCQD4cCFGF4u6zQT_LxU7Br4CeGQvHcDPkw/edit

https://www.youtube.com/watch?v=37SazIr9UVQ

https://www.youtube.com/watch?v=d4xhfzE01E4