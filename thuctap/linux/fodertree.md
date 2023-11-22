- [Cấu trúc file system trên linux](#cấu-trúc-file-system-trên-linux)
  - [/root](#root)
  - [/bin - user binary](#bin---user-binary)
  - [/sbin](#sbin)
  - [/etc](#etc)
  - [/dev](#dev)
  - [/tmp](#tmp)
  - [/proc](#proc)
  - [/var](#var)
  - [/usr](#usr)
  - [/home](#home)
  - [/boot](#boot)
  - [/lib](#lib)
  - [/opt](#opt)
  - [/mnt](#mnt)
  - [/media](#media)
  - [/srv](#srv)
- [tài liệu tham khảo](#tài-liệu-tham-khảo)

# Cấu trúc file system trên linux
![Alt](/thuctap/anh/Screenshot_171.png)

![Alt](/thuctap/anh/Screenshot_172.png)
- Nhìn vào 2 hình trên ta có thể thấy sự tương quan giữa linux và windows
- linux sử dụng 15 file system để quản lý hệ thống của mình còn windows sử dụng 7 file system để quản lý hệ thống của mình
- các file system chứa thông tin các file mà nó quản lý và hệ điều hành được hiểu như là quản lý các file đó khi cần dùng cái gì nó sẽ chọc vào file system để sử dụng

## /root
- Root là nơi bắt đầu của tất cả các thư mục chỉ có quyền root mới có thể sửa file ở đây
- Chúng ta hãy nhìn hình và phân biệt có 2 root trong hình,ý root mà ở đây tôi muốn nói là root bắt đầu mọi thứ cơ
## /bin - user binary
- Đây là file chương trình của người dùng 
- Thư mục này chứa các chương trình được thực thi ,các chương trình dùng chung cho tất cả các user trong linux được chứa ở đây
![Alt](/thuctap/anh/Screenshot_174.png)
- Ta thấy trên hình có rất nhiều câu lệnh mà dùng chung cho các user 

## /sbin
- Đây là file chương trình hệ thống
- Chứa những chương trình dành cho việc bảo trì hệ hệ thống như reboot, fdisk

![Alt](/thuctap/anh/Screenshot_175.png)

## /etc
- đây là file chứa thông tin cấu hình hệ thống
- Thư mục này chứa các file cấu hình của các chương trình, đồng thời nó còn chứa các shell script dùng để khởi động hoặc tắt các chương trình khác.
-  Ví dụ: /etc/resolv.conf, /etc/logrolate.conf

![Alt](/thuctap/anh/Screenshot_176.png)

## /dev
- Đây là thư mục chứa thông tin liên quan đến thiết bị trong hệ thống
- Ví dụ như :các phân vùng ổ cứng ,các thiết bị ngoại vi tất cả các thiết bị cắm ngoài vào máy

![Alt](/thuctap/anh/Screenshot_177.png)

## /tmp 
- chứa các thông tin của file tạm thời của người dùng và hệ thống
- các file này sẽ bị xóa đi khi khởi động lại máy

![Alt](/thuctap/anh/Screenshot_178.png)

## /proc
- Đây là file chứa thông tin về các tiến trình đang chạy
- Ngoài ra nó còn là nơi lưu các thông tin mà tài nguyên đang sử dụng

![Alt](/thuctap/anh/Screenshot_179.png)

## /var
- Đây là file chứa tất cả các biến của chương trình

![Alt](/thuctap/anh/Screenshot_180.png)

## /usr
- user programs : là nơi chưa các chương trình của người dùng

![Alt](/thuctap/anh/Screenshot_181.png)

![Alt](/thuctap/anh/Screenshot_182.png)

- 2 hình ảnh này là tương đương nhau giữa linux và windows

## /home
- Là thư mục người dùng
- Thư mục này chứa tất cả các file cá nhân của từng người dùng

## /boot
- Là nơi chứa tất cả các file yêu cầu trong quá trình khởi động

![Alt](/thuctap/anh/Screenshot_183.png)


## /lib
- Là thư viện của hệ thống 
- Chứa cá thư viện hỗ trợ cho các file thực thi trong /bin và /sbin

![Alt](/thuctap/anh/Screenshot_184.png)

##  /opt
- Tên thư mục này nghĩa là optional (tùy chọn)
- nó chứa các ứng dụng thêm vào từ các nhà cung cấp độc lập khác
- Các ứng dụng này có thể được cài ở /opt hoặc một thư mục con của /opt

## /mnt
- Đây là thư mục tạm để mount các file hệ thống
- Ví dụ như # mount /dev/sda2 /mnt

## /media
- Ta có thể liên tưởng đến ổ đĩa D trong windows ,nó có chức năng dùng để lưu lại những thứ mà ta thêm vào

##  /srv
- system services's data :Chứa dữ liệu liên quan đến các dịch vụ máy chủ như /srv/svs








# tài liệu tham khảo

https://github.com/QuocCuong97/Linux/blob/master/docs/Basic%20Linux/07_File_System.md

https://kienictns.wordpress.com/2015/09/09/tim-hieu-cau-truc-thu-muc-trong-linux/