- [Tổng hợp các câu lệnh hay dùng](#tổng-hợp-các-câu-lệnh-hay-dùng)
  - [Các câu lệnh show trong linux](#các-câu-lệnh-show-trong-linux)
    - [pwd](#pwd)
    - [ls](#ls)
    - [cat](#cat)
    - [du](#du)
  - [Các câu lệnh tìm kiếm](#các-câu-lệnh-tìm-kiếm)
    - [find](#find)
  - [Các câu lệnh liên quan đến thư mục và file](#các-câu-lệnh-liên-quan-đến-thư-mục-và-file)
    - [cp](#cp)
    - [mv](#mv)
    - [mkdir](#mkdir)
    - [rmdir](#rmdir)
    - [rm](#rm)
    - [touch](#touch)
    - [cat](#cat-1)
    - [grep](#grep)
  - [Các câu lệnh liên quan đến hệ thống](#các-câu-lệnh-liên-quan-đến-hệ-thống)
    - [shutdown](#shutdown)
    - [reboot](#reboot)
    - [init](#init)
    - [date](#date)
    - [df](#df)
  - [Các câu lệnh quan trọng nhất thiết phải nhớ](#các-câu-lệnh-quan-trọng-nhất-thiết-phải-nhớ)
    - [`Systemctl`](#systemctl)
- [Tổng hợp các file cần nhớ](#tổng-hợp-các-file-cần-nhớ)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

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
## Các câu lệnh show trong linux
### pwd
- show đường dẫn của vị trí đang đứng

### ls
- Liệt kê các file có trong thư mục hiện tại
- Nó có một vài option cho ta lựa chọn:
  - `ls -R ` :liệt kê tất cả các file bao gồm cả thư mục phụ bên trong
  - `ls -a`: liệt kê tất cả các file bao gồm cả thư mục ẩn
  - `ls -al` :liệt kê tất cả các kèm theo các thông tin chi tiết như phân quyền, chủ sở hữu ,kích thước ...
  
### cat
- dùng để show nội dùng trong file ra
- Ta cũng có thể sắp xếp nội dung show theo ý chúng ta như show file 1 rồi đến file 2 bằng

```
cat file1 file2
```

### du
```
du [option] [path]
```
- dùng để xem dung lượng thư mục
- option :
  - `-s` : in kích thước tổng
  - `-k` : hiển thị dung lượng theo Kb
  - `-m` : hiển thị dung lượng theo Mb

## Các câu lệnh tìm kiếm
### find
- Là lệnh tìm kiếm mạnh nhất với nhiều tham số nhưng thường tốn thời gian hơn các lệnh khác
```
# find [không_gian_tìm_kiếm] [tiêu_chuẩn_tìm_kiếm (options)]
```
- Trong đó [không_gian_tìm_kiếm] :là chỉ định thư mục tìm kiếm trong đó
- (options)
  - name [file_name]
  - atime :access time
  - mtime : modify time
  - ctime :change time
  - perm [number_mode] : quyền hạn permission của file
  - size n ( n là kích cỡ cần tìm )


## Các câu lệnh liên quan đến thư mục và file
### cp
- Dùng để sao chép file 
- Có 2 cách dùng 
  - Sao chép file ở thư mục hiện tại đến vị trí khác `cp [tênfile] [đường dẫn muốn đến]`
  - Sao chép file ở 1 thư mục bất kỳ đến 1 thư mục bất kỳ ` cp [đường dẫn file cần sao chép] [đường dẫn muốn đến]`

### mv
- Dùng để di chuyển file và ta có cách dùng tương tự như `cp`

### mkdir
- Tạo thư mục
- Ta cũng có 1 vài các dùng độc đáo như
  - Tạo thư mục mới trong thư mục đã có sẵn
 ```
mkdir [new foder]/[foder có sẵn]
```

- Tạo thư mục nằm giữa 2 thư mục

```
mkdir -p [foder1]/[newfoder]/[foder2]
```
### rmdir
- Dùng để xóa thư mục nhưng chỉ được phép xóa thư mục trống

### rm
- dùng để xóa 
- có nhiều option để chọn
  - `-f` :xóa không cần hỏi
  - `-i`:hỏi trước khi xóa
  - `-r`:xóa toàn bộ kể cả thư mục con bên trong
  - `-d` :xóa thư mục rỗng
  - `rm -rf` : xóa toàn bộ kể cả file system (rất nguy hiểm)
### touch 
- Dùng để tạo file
```
touch file1.txt
```
### cat
- là lệnh dùng để hiển thị nội dung file
- Ta có 1 số biến thể có thể sử dụng .Do các thông tin của cpu hay ram ở trong file system /proc/ nên ta có thể xem thông tin của nó bằng lệnh cat
- xem thông tin của cpu

```
cat /proc/cpuinfo
```
- xem thông tin của ram

```
cat /proc/meminfo
```
### grep
- là lệnh cho phép lọc dữ liệu 
```
grep -[options] [string] [file]
```
- c : đếm số lần xuất hiện của string trong file
- n : hiển thị số dòng có chứa string trong file
- i : tìm kiếm không phân biệt chữ hoa và chữ thường
- w : tim kiếm chính xác nội dung của string
- v :tìm kiếm các dòng mà không có nội dung của string

Ví dụ :tìm kiếm các dòng mà không có kí tự `#` trong file `sshd_config` 
![Alt](/thuctap/anh/Screenshot_185.png)
## Các câu lệnh liên quan đến hệ thống
### shutdown
```
shutdown [options] [time] [wall]
```
- option:
  - `h`: shutdown
  - `r`: restart
- time:
  - `now`: ngay bây giờ
  - `+ phút` : sau bao nhiêu phút nữa
  - `giờ:phút` :ấn định thời gian

### reboot
```
reboot
```
- reboot lại máy

### init
```
init [number]
```
- `0` :shutdown
### date 
- Dùng để xem ngày giờ hệ thống

### df
- Ta có thể sử dụng lệnh này để xem thông tin ổ cứng

```
df -[options]
```
- a : hiển thị thông tin của các hệ thống tập tin cùng với tất cả
- h : hiển thị theo mức sử dụng dung lượng ổ cứng theo định dạng dễ đọc
- k : hiển thị thông tin dung lượng theo kilobytes
- m : hiển thị thông tin dung lượng theo megabytes
- i : hiển thị thông tin dung lượng theo inodes
- T : hiển thị loại file system ( ext4 , xfs ,...)
- t : hiển thị thông tin dựa trên loại file system

## Các câu lệnh quan trọng nhất thiết phải nhớ
### `Systemctl`
- `systemctl` : là câu lệnh dùng để quản lý các chương trình hệ thống trong linux ,ta có thể reset,enable với các chương trình trong hệ thống
- Để show các chương trình mà `systemctl` đang quản lý ta sử dụng lệnh

```
systemctl list-inits
```
- Để show các chương trình chạy loại service thì ta dunngf lệnh

```
systemctl list-inits --t service
```
- Để khởi động dịch vụ 

```
systemctl start service-name
```
- Để dừng dịch vụ

```
systemctl stop service-name
```
- Để dịch vụ luôn bật khi khởi động lại máy

```
systemctl enable service-name
```

- Để dịch vụ luôn tắt kể cả khi khởi động lại máy

```
systemctl disable service-name
```
- Để xem các thông tin chi tiết về dịch vụ

```
systemctl show service-name
```
- Để xem trạng thái của dịch vụ 

```
systemctl status service-name
```


# Tổng hợp các file cần nhớ
- `/etc/sysconfig/network-scripts` là file chuyển dùng để cấu hình card mạng của centos
- `/etc/netplan/` là file cấu hình ip cho ubuntu
- `/etc/ssh/sshd_config` file cấu hình ssh có cả cấu hình port nữa

# Tài liệu tham khảo
https://github.com/QuocCuong97/Linux/blob/master/docs/Basic%20Linux/08_Basic_Commands.md