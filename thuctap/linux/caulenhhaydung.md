- [Tổng hợp các câu lệnh hay dùng](#tổng-hợp-các-câu-lệnh-hay-dùng)
  - [Các câu lệnh show trong linux](#các-câu-lệnh-show-trong-linux)
    - [pwd](#pwd)
    - [ls](#ls)
    - [cat](#cat)
    - [du](#du)
    - [](#)
  - [Các câu lệnh tìm kiếm](#các-câu-lệnh-tìm-kiếm)
  - [Các câu lệnh liên quan đến thư mục](#các-câu-lệnh-liên-quan-đến-thư-mục)
    - [cp](#cp)
    - [mv](#mv)
    - [mkdir](#mkdir)
    - [rmdir](#rmdir)
    - [rm](#rm)
  - [Các câu lệnh liên quan đến hệ thống](#các-câu-lệnh-liên-quan-đến-hệ-thống)
    - [shutdown](#shutdown)
    - [reboot](#reboot)
    - [init](#init)
    - [](#-1)
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

### 
## Các câu lệnh tìm kiếm


## Các câu lệnh liên quan đến thư mục
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

### 

# Tổng hợp các file cần nhớ
- `/etc/sysconfig/network-scripts` là file chuyển dùng để cấu hình card mạng của centos
- `/etc/netplan/` là file cấu hình ip cho ubuntu
- `/etc/ssh/sshd_config` file cấu hình ssh có cả cấu hình port nữa

# Tài liệu tham khảo
https://github.com/QuocCuong97/Linux/blob/master/docs/Basic%20Linux/08_Basic_Commands.md