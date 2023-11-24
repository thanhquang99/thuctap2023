- [Linux history](#linux-history)
- [Distro](#distro)
- [Licensing](#licensing)
- [Các câu lệnh được sử dụng như thế nào](#các-câu-lệnh-được-sử-dụng-như-thế-nào)
  - [Man page](#man-page)
  - [học về thư mục](#học-về-thư-mục)
    - [pwd (Print Working Directory)](#pwd-print-working-directory)
    - [cd  (Change Directory)](#cd--change-directory)
    - [cd ~](#cd-)
    - [cd ..](#cd--1)
    - [cd -](#cd--)
    - [Đường dẫn tuyệt đối và đường dẫn tương đối](#đường-dẫn-tuyệt-đối-và-đường-dẫn-tương-đối)
    - [Phím Tab](#phím-tab)
    - [ls (list)](#ls-list)
    - [mkdir (make directory)](#mkdir-make-directory)
    - [file](#file)
    - [touch](#touch)
    - [rm (remove)](#rm-remove)
    - [cp (copy)](#cp-copy)
    - [rename](#rename)
    - [Hiển thị nội dung file](#hiển-thị-nội-dung-file)
  - [Shell expansion](#shell-expansion)
    - [Tìm hiểu đơn giản](#tìm-hiểu-đơn-giản)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Linux history
- Năm 1969 Dennis Ritchie và Ken
Thompson cùng nhau phát triển ngôn ngữ C hệ điều hành unix và họ đã chia sẻ ra cho toàn thế giới 
- Năm 1975 AT&T bắt đầu bán ra unix với hơn 1 nữa source code là của Dennis Ritchie và Ken
Thompson ,họ đã không vui dẫn đến kết quả họ đã phát triển ra phiên bản 2 của unix kèm theo free BSD Unix.
- Nắm 1980 có rất nhiều công ty hưởng ứng và bắt đầu phát triển Unix của riêng họ và đã tạo ra một mớ hỗn độn .Lúc này Richard Stallman bắt đầu muốn phát triển ra 1 hệ điều hành miễn phí cho người dùng mà bắt đầu với GNU chứ ko phải UNIX
- Năm 1990 Nineties bắt đầu Linus Torvalds và đưa source lên trên mạng . Lúc này rất nhiều người kết hợp với GNU tool và cho rằng nó là một bước đột phá
- 2015 đến nay linux đã phát triển rất phổ biến và trải rộng trên khắp thế giới

# Distro
- Hiện tại Linux đã có rất nhiều distro và có kể đén các ông lớn như: REDHAT, UBUNTU ,DEBIAN ,...

|Distro|Mục đích sử dụng|
|------|----------------|
|Red Hat Enterprise (RHEL)|Bạn là người quản lý và muốn có sự suport tốt|
|Centos|Bạn muốn sử dụng Red Hat mà không có sự suport của red hat|
|Fedora|Bạn muốn sử dụng Red Hat trên laptop và desktop|
|Debian|Sử dụng với mục đích dùng cho server,laptop hay các thiết bị khác|
|Ubuntu|Rất phổ biến và dựa trên Debian|
|Kali|Bạn muốn có một giao diện hack chỉ bằng một cú nhấp chuột|

# Licensing
- Vấn đề bản quyền là vấn đề chúng ta rất muốn biết đúng không
- Ta có thể xem các giấy phép [ở trên đấy](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux/giayphepmanguonmo.md)

# Các câu lệnh được sử dụng như thế nào
## Man page
- Hay còn được gọi là manual page 
- Man là câu lệnh trợ giúp bạn hiểu thêm về cách dùng các câu lệnh khác
- Ví dụ bạn muốn hỏi câu lệnh systemctl dùng như thế nào 

```
man systemctl
```

![Alt](/thuctap/anh/Screenshot_230.png)

## học về thư mục
Phần này sẽ học về các câu lệnh liên quan đến thư mục như pwd, cd, ls, mkdir và rmdir
### pwd (Print Working Directory)
- Đây là câu lệnh xem đường dãn mà vị trí hiện tại bạn đang đứng

![Alt](/thuctap/anh/Screenshot_231.png)

### cd  (Change Directory)
- Đây là câu lệnh giúp bạn di chuyển đến thư mục chỉ đinh bằng cách chỉ ra đường dẫn của nó

![Alt](/thuctap/anh/Screenshot_232.png)

### cd ~
khi bạn gõ `cd`=`cd ~` nó sẽ đua bạn về thư mục chính của bạn

![Alt](/thuctap/anh/Screenshot_233.png)

### cd ..
- đưa bạn về thư mục cao hơn vị trí bạn đang đứng 1 cấp

![Alt](/thuctap/anh/Screenshot_234.png)

### cd - 
- Đưa bạn về thư mục trước đó bạn đang đứng

![Alt](/thuctap/anh/Screenshot_235.png)

### Đường dẫn tuyệt đối và đường dẫn tương đối
- Đường dẫn tuyệt đối sẽ lấy thư mục root làm chuẩn bắt đầu bằng ký tự `/` còn đường dẫn tương đối lấy vị trí bạn đang đứng làm chuẩn sẽ không bắt đầu bằng kí tự gì cả

### Phím Tab
- Nó giúp bạ không cần nhớ đầy đủ lệnh ví dụ bạn chỉ cần gõ `cd /et`+`Tab` thì nó sẽ hiện ra câu lệnh đầy đủ `cd /etc/`

### ls (list)
- Bạn có thể xem list những nội dung có trong thư mục đang đứng
- Nó có một vài tùy chọn như:
  - `ls -a` show tất cả bao gồm cà file ẩn
  - `ls -l` nó sẽ show cho bạn các file dưới dạng chi tiết hơn như phân quyền ,chủ sở hưu hay dung lượng
  - `ls -lh` nó cũng tương tự như `ls -l` nhưng được cho là trình bày đẹp hơn

![Alt](/thuctap/anh/Screenshot_236.png)

### mkdir (make directory)
- Dùng để tạo thư mục ,nó tương tự như new forder trong windows vậy
- Ta có một vài biến thể như
  - `mkdir [file-name]` :tạo thư mục trống
  - `mkdir -p [file-name]` :khi bạn muốn tạo thư mục con trong thư mục con
  - `rmdir [file-name]`: xóa thư mục trống
  - `rmdir -p [file-name]` :xóa thư mục con trong thư mục

![Alt](/thuctap/anh/Screenshot_237.png)

### file
- là câu lệnh giúp ta biết chi tiết về file hơn

![Alt](/thuctap/anh/Screenshot_238.png)

### touch 
- là câu lệnh tạo ra file mới và ta cũng có biến thể như `touch -t` để chỉnh sửa thời gian tạo ra file đó đồng thời cấp quyền cho file đó

![Alt](/thuctap/anh/Screenshot_239.png)

### rm (remove)
- dùng để xóa file hay thư mục
- Một số biến thể như 
  - `rm -i`: hỏi trước khi xóa
  - `rm -rf` : xóa thư mục bình thường rm chỉ xóa được thư mục rỗng nhưng rm-rf xóa được cả thư mục có nội dung

![Alt](/thuctap/anh/Screenshot_240.png)

### cp (copy)
- Dùng để copy file 
- Có các biến thể như
  - `cp` copy 1 file
  - `cp -r` copy tất cả các file mà nằm trong thư mục đó
  - `cp -i` copy file nếu có file trùng sẽ hỏi xem có được đè lên file đấy ko

### rename 
- ta dùng để kết hợp với rm để có thể đổi tên nhiều file cùng 1 lúc
- ví dụ như ta muốn đổi tên các file có đuôi .txt thành file .img

```
rename 's/\.txt/\.png/' *.txt
```

![Alt](/thuctap/anh/Screenshot_241.png)

### Hiển thị nội dung file
- `head`: Dùng để hiển thị 10 dòng đầu của file
- `tail`: dùng để hiển thị 10 dòng cuối cùng của file
- `cat`: dùng để hiển thị toàn bộ file

![Alt](/thuctap/anh/Screenshot_242.png)

- Ta có 1 vài biến thể có thể sử dụng cat như sắp xếp nội dung file nối liền kiểu trình bày file 1 rồi trình bày file 2`cat file1 file2`

- Ta có thể thêm vào nội dung các dòng bằng `<<`
- Dùng `>` để copy file

![Alt](/thuctap/anh/Screenshot_243.png)

![Alt](/thuctap/anh/Screenshot_244.png)

## Shell expansion

Nói một cách đơn giản, shell là một chương trình nhận lệnh từ bàn phím và đưa chúng cho hệ điều hành thực hiện.
### Tìm hiểu đơn giản
- khoảng trắng trong shell : nhiều khoảng trắng liên tiếp sẽ chỉ được tính là một

![Alt](/thuctap/anh/Screenshot_245.png)

- Để



  




























# Tài liệu tham khảo

https://linux-training.be/linuxfun.pdf