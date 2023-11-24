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
    - [command](#command)
      - [External commands và Builtin commands](#external-commands-và-builtin-commands)
  - [Các toán tử điều khiển](#các-toán-tử-điều-khiển)
    - [`;`](#)
    - [`&`](#-1)
    - [`&&`](#-2)
    - [`||`](#-3)
    - [`#`](#-4)
    - [`\`](#-5)
  - [Các biến trong shell](#các-biến-trong-shell)
    - [`$`](#-6)
    - [Biến môi trường](#biến-môi-trường)
  - [Các tùy chọn trong shell](#các-tùy-chọn-trong-shell)
    - [shell option](#shell-option)
  - [shell history](#shell-history)
  - [file globbing](#file-globbing)
  - [pipes and commands](#pipes-and-commands)
    - [stdin, stdout, and stderr](#stdin-stdout-and-stderr)
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

- Để loại bỏ khoảng trắng thì ta phải thêm dấu ngoặc kép vào 

![Alt](/thuctap/anh/Screenshot_246.png)

- Ta cũng có thể hiển thị xuống dòng bằng option `-e` và dấu `/n`

![Alt](/thuctap/anh/Screenshot_247.png)

### command
#### External commands và Builtin commands
- External commands :là lệnh bên ngoài và là những lệnh có hệ nhị phân riêng và nằm ở đâu đó trong file system
- Builtin commands : là lệnh có sẵn và là một phần không thể thiếu của shell bản thân chương trình

- Ta có thể xem lệnh nào là External commands và Builtin commands bằng lệnh type và cũng biết được nơi mà câu lệnh được đặt

![Alt](/thuctap/anh/Screenshot_248.png)

- Ta có thể xem đường dẫn đặt các câu lệnh bằng lệnh `which`

![Alt](/thuctap/anh/Screenshot_249.png)

- Ta có thể đặt bí danh cho lệnh để dễ nhớ và mỗi khi cần dùng đến lệnh chỉ cần gọi bí danh thay vì lệnh

```
 alias dog=cat
```
  
![Alt](/thuctap/anh/Screenshot_250.png)

- ta có thể tận dụng alias để làm ngắn gọn câu lênh ví dụ`clear=c` thì khi ta gõ `c` enter thì đã xóa rồi không cần gõ dài dòng làm gì

- Ta có thể tìm bí danh đã được gắn bằng câu lệnh `alias + bí danh` những câu lệnh nào 
- để xóa bí danh ta sử dụng lệnh `unalias`

![Alt](/thuctap/anh/Screenshot_251.png)

## Các toán tử điều khiển 
### `;`
- Khi bạn sử dụng dấu `;` để ngăn cách các câu lệnh cùng 1 dòng thì máy sẽ hiểu là thực hiện tuần tự các câu lệnh đến khi kết thúc

![Alt](/thuctap/anh/Screenshot_252.png)
### `&`
- Khi bạn thêm dấu `&` ở cuối câu lệnh thì máy sẽ hiểu rằng sau khi thực hiện xong câu lệnh và đang đợi bạn gõ câu lệnh tiếp theo

![Alt](/thuctap/anh/Screenshot_253.png)

### `&&`
- Dùng để thực hiện xong câu lệnh 1 rồi đến câu lệnh 2

![Alt](/thuctap/anh/Screenshot_254.png)

### `||`
- Nó có nghĩa là hoặc .hoặc làm cái này hoặc làm cái kia,nếu cái trước không đúng thì mới xét đến cái sau

![Alt](/thuctap/anh/Screenshot_255.png)

### `#`
- Ta dùng nó đẻ viết comment hay giải thích câu lệnh

![Alt](/thuctap/anh/Screenshot_256.png)

### `\`
-  dùng khi ta muốn thêm kí tự đặc biệt mà không muốn hiểu kí tự đó như 1 câu lệnh

![Alt](/thuctap/anh/Screenshot_257.png)

## Các biến trong shell
### `$`
- Ta hiểu nó như là tên gọi của biến vậy ví dụ như khi ta đặt x=name thì khi ta gọi $x thì nó sẽ hiểu là name
- ví dụ : Đặt name=quang và gọi biến đó ra

![Alt](/thuctap/anh/Screenshot_258.png)

- Ta có thể sử dụng lệnh `set` và `unset` để đặt tên biến và xóa nó đi

![Alt](/thuctap/anh/Screenshot_259.png)

### Biến môi trường
- Biến môi trường là biến mà đã được định nghĩa sẵn rồi mà chúng ta không cần phải định nghĩa bằng set nữa, nó đã được thiết lập sẵn khi chạy hệ điều hành rồi

![Alt](/thuctap/anh/Screenshot_260.png)

- Ta có thể dung lệnh `env` để xem các biến môi trường

![Alt](/thuctap/anh/Screenshot_261.png)

- Làm thế nào để tạo ra một biến môi trường .Ta có thể sử dụng lệnh `export`

```
export VAR="value"
```
trong đó VAR là tên biến còn value là giá trị của biến

![Alt](/thuctap/anh/Screenshot_262.png)

- lưu ý : ta chỉ có thể dùng biến thay thế cho 1 cụm từ chứ ko phải 1 vài từ trong 1 cụm từ


## Các tùy chọn trong shell
- Shell có thể được nhúng trên các dòng lệnh nhưng nó chỉ có tác dụng ngay lúc đó thôi . hãy nhìn vào ví dụ để hiểu rõ

![Alt](/thuctap/anh/Screenshot_263.png)

- ta đã nhúng shell vào câu lệnh echo nhưng biến var1 chỉ có tác dụng ngay lúc đó thôi

- hãy lưu ý dấu tích ngược nó dùng có thể dùng để chạy một loạt các câu lệnh
- hãy nhìn vào hình và phân tích

![Alt](/thuctap/anh/Screenshot_264.png)

- Câu dòng lênh này sẽ in ra kết quả mà trong dấu tích ngược trả về là in ra những file mà có chư pass
### shell option
- Theo mặc định shell sẽ hiểu các biến mà chưa được đặt sẽ là biến trống ,không có giá trị ,ta có thể loại bỏ điều này bằng lệnh `set -u` và đặt lại bằng lệnh `set +u`

![Alt](/thuctap/anh/Screenshot_265.png)

## shell history
- shell history sẽ giúp bạn dễ dàng nhắc lại các câu lệnh trước đó

- ta có thể xem các câu lệnh đã thực hiện trước đó bằng `!!` và tìm kiếm câu lệnh có từ gì đấy bằng dấu `![từ]`

![Alt](/thuctap/anh/Screenshot_266.png)

- Ta có thể xem 20 câu lệnh trước đó bằng lệnh `history 20`
- hay để xem câu lệnh số 2 thì `!2`

![Alt](/thuctap/anh/Screenshot_267.png)

- ta có thể dùng `ctrl +r` để tìm kiếm các lệnh đã dùng bằng cách gõ các từ trùng

![Alt](/thuctap/anh/Screenshot_268.png)

- Ta có thể xem size lịch sử tối đa có thể lưu
- và chỉnh sửa size của nó
- hay xem file history được lưu ở đâu

![Alt](/thuctap/anh/Screenshot_270.png)

## file globbing
- sự khác biệt giữa `*` `?` : `*` có thể thay thế cho nhiều kí tự còn `?` chỉ thay thế cho 1 kí tự

![Alt](/thuctap/anh/Screenshot_271.png)

- `[]` cung cấp cho ta sự lựa chọn ,chỉ cần q trong những từ trong ngoặc phù hợp là được 

![Alt](/thuctap/anh/Screenshot_272.png)

- Ta có thể viết gọn các số từ 1 đến 9 thành 1-9 hoặc từ a đến z thành a-z

```
paul@RHELv4u4:~/test$ ls [A-Z]ile?
file1 file2 file3 File4
paul@RHELv4u4:~/test$ ls [a-z]ile?
file1 file2 file3 File4
paul@RHELv4u4:~/test$ echo $LANG
en_US.UTF-8
paul@RHELv4u4:~/test$ LANG=C
paul@RHELv4u4:~/test$ echo $LANG
C
paul@RHELv4u4:~/test$ ls [a-z]ile?
file1 file2 file3
paul@RHELv4u4:~/test$ ls [A-Z]ile?
File4
paul@RHELv4u4:~/test$

```
Hãy nhìn vào ví dụ này khi ta thay biến `LANG` hay language thif a-z hay 1-9 sẽ không còn khả dụng nữa

##  pipes and commands
### stdin, stdout, and stderr

![Alt](/thuctap/anh/Screenshot_273.png)































# Tài liệu tham khảo

https://linux-training.be/linuxfun.pdf