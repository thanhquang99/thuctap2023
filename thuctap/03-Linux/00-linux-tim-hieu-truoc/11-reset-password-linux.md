## Reset password centos 7
- Giống như window khi cài đặt hay chỉnh sửa chuyên sâu ta sẽ restart máy và bấm `F2` thì centos ta sẽ restart máy và bấm
 `e` để thay đổi chế đọ boot
![Alt](/thuctap/anh/Screenshot_145.png)
- Tìm đến dòng Linux16 có chữ `ro` và thay `ro` thành `rw init=/sysroot/bin/sh`
![Alt](/thuctap/anh/Screenshot_146.png)
![Alt](/thuctap/anh/Screenshot_147.png)


- nhấn `Ctrl + X` để vào chế độ single mode.
- Sau khi bắt đầu ở chế độ người dùng, cần phải remount filesystem là có thể ghi được vì nó được gắn ở chế độ chỉ đọc .vì khi ta thay đổi ro(read only) thành rw(read wirte) cần phải mount

```
mount -o remount,rw /sysroot / trỏ đến file sysroot thành rw/
chroot /sysroot /truy cập vào hệ thống chroot ta có thể hiểu là change-root/
passwd root /thay đổi pass root/
touch /.autorelabel / Update thông tin selinux /
exit
reboot
```

![Alt](/thuctap/anh/Screenshot_148.png)

## Reset password ubuntu server
- B1: Reboot vaf spam phím `esc` nó sẽ hiện ra như dưới màn hình(nhớ kỹ phải ấn thật nhanh đó, nếu làm đi làm lại mà không được ta có thể thử lại thêm bằng cách spam nút `shift`)

![Alt](/thuctap/anh/Screenshot_150.png)

![Alt](/thuctap/anh/Screenshot_151.png)

![Alt](/thuctap/anh/Screenshot_152.png)

- Ta nhập đúng thứ tự các lệnh sau:

```
mount -rw -o remount /Bạn cần có quyền ghi vào phân vùng gốc/
passwd thanhquang /đặt mật khẩu mới/
exit
```
![Alt](/thuctap/anh/Screenshot_153.png)
## Reset password centos 8
- Ta làm tương tự như centos 7 reboot lại máy ảo và tiến hành spam `e`

![Alt](/thuctap/anh/Screenshot_157.png)
- Tìm đến dòng Linux16 có chữ `ro` và thay `ro` thành `rw init=/sysroot/bin/sh`

![Alt](/thuctap/anh/Screenshot_158.png)

![Alt](/thuctap/anh/Screenshot_159.png)

- Tiếp theo ta thực hiện 1 chuỗi các lệnh sau:

```
chroot /sysroot
passwd root
touch /.autorelabel
exit
reboot
```
![Alt](/thuctap/anh/Screenshot_160.png)
- Có thể quá trình lúc reboot lâu và có một số cảnh báo nhưng ta cứ đợi là được

## Reset password centos 9
- làm hệt như các bước ở centos 7 

![Alt](/thuctap/anh/Screenshot_167.png)
![Alt](/thuctap/anh/Screenshot_168.png)
![Alt](/thuctap/anh/Screenshot_169.png)



## Tài liệu tham khảo

https://docs.google.com/document/d/1J7ebhuO8c7yw3te7j2habHixSYkyjgzrdrZMwjT6CY0/edit

https://itsfoss.com/how-to-hack-ubuntu-password/

https://howto.nsupport.asia/knowledge-base/reset-password-centos-8/

https://github.com/huydv398/Linux-tutorial/blob/master/tool/Reset-passwd.md