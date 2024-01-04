- [Tìm hiểu về file fstab](#tìm-hiểu-về-file-fstab)
  - [Cấu trúc tổ chức trong file /etc/fstab](#cấu-trúc-tổ-chức-trong-file-etcfstab)
- [Tìm hiểu về cách mount](#tìm-hiểu-về-cách-mount)
  - [Thực hành mount ổ cứng vào phân vùng](#thực-hành-mount-ổ-cứng-vào-phân-vùng)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Tìm hiểu về file fstab
- Đường dẫn `/etc/fstab`
- Fstab ( file system table ) là 1 bảng lưu trữ thông tin các thiết bị , mount point và các thiết lập của nó
- Xem nội dung file `fstab`

```
cat /etc/fstab
```
![Alt](/thuctap/anh/Screenshot_211.png)

## Cấu trúc tổ chức trong file /etc/fstab

![Alt](/thuctap/anh/Screenshot_212.png)

- Ta chia cấu trúc trong file thành 6 cột ,và sẽ được định nghĩa như sau:
  - Cột 1: `file system` là đường dẫn đến thư mục của thiết bị (ta có thể thay thế bằng uuid của file đó và đê xem uuid ta sử dụng lệnh `blkid [path]`)
  - Cột 2: `mount point` cho biết thiết bị được mount đến thư mục nào
  - cột 3: `type` ta hiểu đơn giản rằng file sẽ có đuôi mp3 hay mp4 để phân loại và định nghĩa file đó thuộc loại nào.
  - cột 4: `options` cung cấp các tùy chọn và nếu có nhiều tùy chọn chúng được cách nhau bỏi dấu `,` .
  - Cột 5 :`dump` Trường này dùng bởi lệnh dump, chỉ ra filesystems trong record này có được dump khi sử dụng lệnh dump hay không .0 là bỏ qua việc sao lưu 1 là thực hiện sao lưu 
  - cột 6:`pass` là có kiểm tra file (hay dò lỗi file )hay không 1 là có 0 là không

- Các lựa chọn của `type`:
  - minix :Cái cũ nhất, được cho là đáng tin cậy nhất, nhưng khá hạn chế về tính năng (thiếu một số dấu thời gian, tối đa 30 tên tệp ký tự) và bị hạn chế về khả năng (tối đa 64 MB cho mỗi hệ thống tệp).
  - xia :Một phiên bản sửa đổi của hệ thống tệp minix giúp nâng cao các giới hạn về tên tệp và kích thước hệ thống tệp, nhưng không giới thiệu các tính năng mới
  - ext3 :Hệ thống tập tin ext3 có tất cả các tính năng của hệ thống tập tin ext2, sự khác biệt là có thêm nhật ký
  - reiserfs :Một hệ thống tập tin mạnh mẽ hơn. Việc ghi nhật ký được sử dụng giúp giảm khả năng mất dữ liệu
  - jfs :JFS là một hệ thống tập tin được ghi nhật ký được IBM thiết kế để hoạt động trong môi trường hiệu suất cao
  - xfs :XFS ban đầu được thiết kế bởi Silicon Graphics để hoạt động như một hệ thống tệp ghi nhật ký 64 bit. XFS cũng được thiết kế để duy trì hiệu suất cao với các tệp và hệ thống tệp lớn.
  - nfs : Một hệ thống tệp được nối mạng cho phép chia sẻ hệ thống tệp giữa nhiều máy tính để cho phép truy cập dễ dàng vào các tệp từ tất cả các máy tính đó.
  - NTFS :Hệ thống tệp được ghi nhật ký tiên tiến nhất của Microsoft cung cấp khả năng truy cập tệp nhanh hơn và ổn định hơn các hệ thống tệp trước đây của Microsoft.
  - còn nhiều nữa các bạn có thể tự tìm hiểu

- Các lựa chọn `options `
  - `auto` :tự động mount thiết bị khi khởi động
  - `noauto` : phải mount bằng tay khi khởi động
  - `user`: cho phép user có quyền mount
  - `nouser`: chỉ có root mới có quyền mount
  - `exc` : cho phép chạy lệnh nhị phân trên thiết bị
  - `noexc`: không cho phép chạy lệnh nhị phân trên thiết bị
  - `ro`: chỉ cho phép đọc
  - `rw`: cho phép cả đọc cả ghi
  - `sync`: thao tác trên file system được đồng bộ hóa
  - `async`: thao tác trên file system không được đồng bộ hóa
  - `default`: tương đương với các quyền rw , suid , dev , exec , auto , nouser , async


# Tìm hiểu về cách mount
- Cấu trúc lệnh

```
mount [options] [device_name] [mount_point]
```
- Options:
  - -v : chế độ chi tiết , cung cấp thêm thông tin về những gì mount định thực hiện
  - -w : mount hệ thống tập tin với quyền đọc và ghi
  - -r : mount hệ thống tập tin chỉ có quyền đọc
  - -t : xác định lại hệ thống tập tin được mount . Những loại hợp lệ là ext2 , ext3 , ext4 , vfat , iso9600 ,...
  - -a : mount tất cả các hệ thống tập tin được khai báo trong fstab

## Thực hành mount ổ cứng vào phân vùng
- kiểm tra phân vùng có sẵn

```
lsblk
```

![Alt](/thuctap/anh/Screenshot_213.png)

- Tôi sẽ đặt ra bài toán như thế này: máy của tôi đang ổ đĩa có dung lượng là 20G và tôi lắp thêm 1 ổ đĩa mới có dung lượng là 5G vào .Để dùng được 5G này tôi phải mount ổ 5G này đến 1 thư mục trong hệ thống linux .Bạn tưởng tượng rằng máy tính của bạn lắp thêm 1 ổ đĩa mới vào thì nó sẽ là ổ đĩa D để bạn dùng lưu trữ dữ liệu,nhưng khi làm với linux thì nó sẽ không tự động tạo ra ổ D như thế mà nó chỉ bảo là có ổ đĩa D đã được thêm vào nhưng bạn không có quyền gì với nó việc của bạn cần làm là mount nó đến 1 thu mục mà khi bạn thao tác gì với thư mục đó thì nó sẽ đc lưu vào ổ đĩa mới

- Tôi tiến hành cấp ổ đĩa ảo cho máy của mình và kiểm tra bằng lệnh `lsblk`


![Alt](/thuctap/anh/Screenshot_214.png)

![Alt](/thuctap/anh/Screenshot_215.png)

- Ta tiến hành tạo một thư mục để sử dụng ổ đĩa sdb 

```
root@thanhquang:/home# mkdir use-sdb1

```
- Để mount được ta cần phải phân vùng cho ổ sdb đã

```
parted /dev/sdb
(parted) mklabel gpt
(parted) mkpart primary 0GB 5GB
(parted) quit
```

![Alt](/thuctap/anh/Screenshot_216.png)

- Định dạng lại filesystem cho phân vùng

```
mkfs.xfs /dev/sdb1
```

![Alt](/thuctap/anh/Screenshot_217.png)

- Thực hiện lệnh mount

```
mount /dev/sdb1 /home/use-sdb1
```

- Kiểm tra kết quả

![Alt](/thuctap/anh/Screenshot_218.png)

- Chỉnh sửa file fstab để khi reboot không mất

```
vi /etc/fstab
```

```
/dev/sdb1  /home/use-sdb1 xfs defaults 0 0
```

![Alt](/thuctap/anh/Screenshot_219.png)

- Ta tiến hành reboot và kiểm tra lại 

![Alt](/thuctap/anh/Screenshot_220.png)

- Ta có thể thực hiện unmount

```
umount /dev/sdb1 /home/use-sdb1
```

![Alt](/thuctap/anh/Screenshot_221.png)
# Tài liệu tham khảo

https://github.com/QuocCuong97/Linux/blob/master/docs/Basic%20Linux/23_Mount_Devices.md

https://blog.vinahost.vn/gioi-thieu-ve-file-fstab-tren-linux/

https://tldp.org/LDP/sag/html/filesystems.html



